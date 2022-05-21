import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/models/course_model.dart';
import 'package:path/path.dart' as p;

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final _formKey = GlobalKey<FormState>();
  List<PlatformFile>? pickedFile;
  PlatformFile? coverImageFile;
  UploadTask? uploadTask;
  int filesUploaded = 0;
  int totalFiles = 1;

  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseDescriptionController =
      TextEditingController();

  final _storage = FirebaseStorage.instance;

  Future selectCoverImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return;
    setState(() {
      totalFiles++;
      coverImageFile = result.files.first;
    });
  }

  Future selectDocuments() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'pdf', 'doc', 'mp4']);
    if (result == null) return;
    setState(() {
      totalFiles += result.count;
      pickedFile = result.files;
    });
  }

  Future<String> uploadFile(selectedFile) async {
    final path = 'files/${selectedFile!.name}';
    final file = File(selectedFile!.path);
    final ref = _storage.ref().child(path);

    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapShot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapShot.ref.getDownloadURL();
    Fluttertoast.showToast(msg: 'Upload: File Uploaded');
    setState(() {
      filesUploaded += 1;
      uploadTask = null;
    });
    return urlDownload;
  }

  Future saveNewCourse() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference _users = firebaseFirestore.collection("users");
    CollectionReference _courses = firebaseFirestore.collection("courses");
    DocumentReference documentReference = _courses.doc();

    Map document = {};
    if (_formKey.currentState!.validate()) {
      if (coverImageFile == null) {
        Fluttertoast.showToast(msg: "Upload: Select a cover Image First");
        return;
      } else if (pickedFile == null) {
        Fluttertoast.showToast(msg: "Upload: Upload Some Docs First");
        return;
      }

      String coverImageURL = await uploadFile(coverImageFile);
      for (PlatformFile file in pickedFile!) {
        document[file.name] = await uploadFile(file);
      }

      CourseModel newCourse = CourseModel(
          title: _courseNameController.text,
          authorRef: _users.doc(user!.uid),
          description: _courseDescriptionController.text,
          coverImageURL: coverImageURL,
          document: document,
          likes: []);

      documentReference.set(newCourse.toMap()).then((value) async {
        setState(() {
          filesUploaded += 1;
        });
        await _users.doc(user.uid).set({
          "coursesCreated": FieldValue.arrayUnion([documentReference.id])
        }, SetOptions(merge: true));
        Fluttertoast.showToast(msg: "Upload: Upload Success");
        Navigator.of(context).pop(context);
      }).catchError((error) {
        Fluttertoast.showToast(msg: "Upload: Error ${error.toString}");
      });
    }
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
        validator: (value) {
          if (value!.isEmpty) {
            return ("Course Name cant be empty");
          }
          return null;
        },
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
        validator: (value) {
          if (value!.isEmpty) {
            return ("Course Description cant be empty");
          }
          return null;
        },
        // textInputAction: TextInputAction.done,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          labelText: "Course Description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));

    IconData getIcon(path) {
      final extension = p.extension(path);
      if (extension == ".pdf") {
        return Icons.picture_as_pdf;
      } else if (extension == ".doc" || extension == ".docx") {
        return Icons.description;
      } else if (extension == ".mp4" || extension == ".mkv") {
        return Icons.video_file_rounded;
      } else {
        return Icons.collections;
      }
    }

    Widget buildUploadProgress() {
      return StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            double progress = data.bytesTransferred / data.totalBytes;

            return SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                  ),
                  Center(
                    child: Text(
                      '${(100 * progress).roundToDouble()}%',
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox(height: 50);
          }
        },
      );
    }

    Widget buildTotalProgress() {
      return StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            double progress = filesUploaded / totalFiles;

            return SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                  ),
                  Center(
                    child: Text(
                      '${(100 * progress).roundToDouble()}%',
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox(height: 50);
          }
        },
      );
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (coverImageFile != null)
                        Image.file(
                          File(coverImageFile!.path!),
                          width: 300,
                          height: 150,
                        ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: selectCoverImage,
                          child: const Text("Select Cover Image")),
                      const SizedBox(height: 30),
                      courseNameTextBox,
                      const SizedBox(height: 30),
                      courseDescriptionTextBox,
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: selectDocuments,
                          child: const Text("Select Documents")),
                      const SizedBox(height: 30),
                      if (pickedFile != null)
                        Container(
                          height: 400,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                            itemCount: pickedFile!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: const Color.fromARGB(255, 228, 224, 227),
                                child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {},
                                  child: SizedBox(
                                    width: 300,
                                    child: ListTile(
                                      leading: Icon(
                                        getIcon(pickedFile![index].name),
                                        size: 28,
                                      ),
                                      title: Text(
                                        pickedFile![index].name.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                      ),
                                      subtitle: Text(
                                        pickedFile![index].path.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                      ),
                                      trailing: InkWell(
                                        onTap: () {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Upload: Remove this(Future Implementation)");
                                        },
                                        child: const Icon(
                                          Icons.delete_outline,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: saveNewCourse,
                          child: const Text('Upload Course')),
                      const SizedBox(height: 30),
                      const Text("Current File Upload Progress"),
                      buildUploadProgress(),
                      const SizedBox(height: 30),
                      const Text("Total Progress"),
                      buildTotalProgress()
                    ]),
              ),
            )),
          )),
    );
  }
}
