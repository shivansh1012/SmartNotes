import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/models/course_model.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  List<PlatformFile>? pickedFile;
  PlatformFile? coverImageFile;
  UploadTask? uploadTask;
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseDescriptionController =
      TextEditingController();

  final _storage = FirebaseStorage.instance;

  Future selectCoverImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return;
    setState(() {
      coverImageFile = result.files.first;
    });
  }

  Future selectDocuments() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'pdf', 'doc']);
    if (result == null) return;
    setState(() {
      pickedFile = result.files;
    });
  }

  Future<String> uploadFile(selectedFile) async {
    final path = 'files/${selectedFile!.name}';
    final file = File(selectedFile!.path);

    final ref = _storage.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapShot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapShot.ref.getDownloadURL();
    Fluttertoast.showToast(msg: 'FIle Uploaded');
    return urlDownload;
  }

  Future saveNewCourse() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference _users = firebaseFirestore.collection("users");
    Map document = {};
    String coverImageURL = await uploadFile(coverImageFile);
    for (PlatformFile file in pickedFile!) {
      document[file.name] = await uploadFile(file);
    }

    CourseModel newCourse = CourseModel(
        title: _courseNameController.text,
        authorRef: _users.doc(user!.uid),
        description: _courseDescriptionController.text,
        coverImageURL: coverImageURL,
        document: document);

    firebaseFirestore
        .collection("courses")
        .doc()
        .set(newCourse.toMap())
        .then((value) => Fluttertoast.showToast(msg: "Upload Success"))
        .catchError((error) => Fluttertoast.showToast(msg: "Error $error"));
  }

  @override
  Widget build(BuildContext context) {
    final courseNameTextBox = TextFormField(
        autofocus: false,
        controller: _courseNameController,
        onSaved: (value) {
          _courseNameController.text = value!;
        },
        textInputAction: TextInputAction.next,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          labelText: "Course Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));

    final courseDescriptionTextBox = TextFormField(
        autofocus: false,
        controller: _courseDescriptionController,
        onSaved: (value) {
          _courseDescriptionController.text = value!;
        },
        // textInputAction: TextInputAction.done,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          labelText: "Course Description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  if (coverImageFile != null) Text(coverImageFile!.name),
                  ElevatedButton(
                      onPressed: selectCoverImage,
                      child: const Text("Select Cover Image")),
                  courseNameTextBox,
                  const SizedBox(height: 30),
                  courseDescriptionTextBox,
                  const SizedBox(height: 30),
                  if (pickedFile != null)
                    SingleChildScrollView(
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.all(10),
                        child: Center(
                            child: Column(
                                children: pickedFile!
                                    .map((file) => Text(file.name))
                                    .toList())),
                      ),
                    ),
                  ElevatedButton(
                      onPressed: selectDocuments,
                      child: const Text("Select Documents")),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: saveNewCourse,
                      child: const Text('Upload Course'))
                ])),
          )),
    );
  }
}
