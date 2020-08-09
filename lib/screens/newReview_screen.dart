import 'dart:io';
import 'dart:math';
import 'package:bptest_app/components/users.dart';
import 'package:bptest_app/firebaseStuff//auth_functions.dart';
import 'package:bptest_app/firebaseStuff//database_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';
import 'package:bptest_app/components/page_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class NewReviewScreen extends StatefulWidget {
  @override
  _NewReviewScreenState createState() => _NewReviewScreenState();
}

class _NewReviewScreenState extends State<NewReviewScreen> {
  final AuthService _auth = AuthService();
  final DatabaseService _databaseService = DatabaseService();
  final _formKey = GlobalKey<FormState>();

  String rating = '';
  int ratingInt = 0;
  String comments = '';
  String photos = '';

  String name = '';
  String product = 'Floaroma';
  int votes = 0;

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    name = user.email;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text('PRODUCTS'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, 'Products');
              },
            ),
            ListTile(
              title: Text('CHAT'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, 'Chat');
              },
            ),
            ListTile(
              title: Text('LOG OUT'),
              onTap: () async {
                await _auth.logOut();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Butterflies & Petals'),
        backgroundColor: kSecondaryColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Text(
              'NEW REVIEW',
              style: kPageHeadingStyle,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  border: Border.all(color: Colors.black)),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      validator: (val) => int.parse(val) > 5 || val.isEmpty
                          ? 'Give a rating between 0-5'
                          : null,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Rating (out of 5)',
                      ),
                      onChanged: (val) {
                        setState(() => rating = val);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Additional comments',
                      ),
                      onChanged: (val) {
                        setState(() => comments = val);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Upload image'),
                        IconButton(
                            icon: Icon(Icons.add_photo_alternate),
                            onPressed: () {
                              uploadImage();
                            }),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: (photos != null)
                          ? Image.network(photos)
                          : Placeholder(
                        fallbackHeight: 20.0,
                        fallbackWidth: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PageButton(
              press: () {
                if (_formKey.currentState.validate()) {
                  _databaseService.updateUserReview(
                      name, product, rating, comments, votes,photos);
                Navigator.pop(context);
                }
              },
              text: 'SUBMIT',
            ),
          ],
        ),
      ),
    );
  }

//uploading images
  uploadImage() async {
    final storage = FirebaseStorage.instance;
    final picker = ImagePicker();
    PickedFile image;

    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      image = await picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        var snapshot =
            await storage.ref().child(random.nextInt(999999).toString()).putFile(file).onComplete;

        var downloadURL = await snapshot.ref.getDownloadURL();
        setState(() {
          photos = downloadURL;
        });
      } else {
        print('no path received');
      }
    } else {
      print('Grant permissions');
    }
  }
}
