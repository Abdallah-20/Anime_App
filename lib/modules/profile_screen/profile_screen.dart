import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool editButtonPressed = false;
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          if(editButtonPressed)
            TextButton(onPressed: (){setState(() {
              editButtonPressed = false;
            });}, child: const Text("Update")),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      fit: StackFit.loose,
                      children: [
                            CircleAvatar(
                            backgroundImage: image == null ? const AssetImage('assets/images/on_board_1.jpg') : FileImage(image!) as ImageProvider, radius: 40),
                            if(editButtonPressed)
                              InkWell(
                                child: Container(
                                  width: double.infinity,
                                  height: 30,
                                  color: Colors.white.withOpacity(0.7),
                                  child:const Icon(Icons.camera_alt,size: 20,),
                                ),
                                onTap: (){getImage();},
                              ),
                          ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: nameController..text = 'Abdallah Adel',
                          style: const TextStyle(color: Colors.black,fontSize: 20),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          enabled: editButtonPressed,

                        ),
                        Text(
                          '@abdullah_12',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Container(
                          height: 20,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.yellow.shade700,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.workspace_premium_outlined, size: 15),
                              Text(' premium', style: TextStyle(height: 1.3)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  if (!editButtonPressed)
                    FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            editButtonPressed = true;
                          });
                        },
                        shape: const CircleBorder(),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.grey.shade300,
                        mini: true,
                        child: const Icon(
                          Icons.mode_edit_outline_outlined,
                          color: Colors.black,
                        )),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Your Activity'),
                  buildProfileScreenItem(Icons.bookmark, 'Bookmark List', true),
                  buildProfileScreenItem(Icons.rate_review, 'Reviews', true),
                  buildProfileScreenItem(Icons.favorite, 'Favorite', true),
                  const Text('Account'),
                  buildProfileScreenItem(Icons.settings, 'Settings', false),
                  buildProfileScreenItem(
                      Icons.request_quote, 'My Subscription Plan', false),
                  buildProfileScreenItem(
                      Icons.lock_open, 'Change Password', false),
                  buildProfileScreenItem(Icons.login_outlined, 'Logout', false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileScreenItem(IconData icon, String text, bool activity) =>
      InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blueGrey[50],
            ),
            height: 40,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(width: 10),
                Text(text),
                const Spacer(),
                if (activity) const Text('10'),
              ],
            ),
          ),
        ),
      );

  File ? image;
  var picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    } else {
      print('No Image Selected');
    }
  }
}
