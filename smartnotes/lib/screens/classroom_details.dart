import 'package:flutter/material.dart';
import 'package:smartnotes/constants.dart';

class ClassroomDetails extends StatefulWidget {
  const ClassroomDetails({Key? key}) : super(key: key);

  @override
  State<ClassroomDetails> createState() => _ClassroomDetailsState();
}

class _ClassroomDetailsState extends State<ClassroomDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left_outlined),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Container(
                      height: safeHeight * 0.2,
                      width: safeWidth,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/physics_banner.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      "Physics",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
