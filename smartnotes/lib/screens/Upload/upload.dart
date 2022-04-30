import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseDescriptionController =
      TextEditingController();
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
                  courseNameTextBox,
                  const SizedBox(height: 30),
                  courseDescriptionTextBox,
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Select File")),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Upload File'))
                ])),
          )),
    );
  }
}
