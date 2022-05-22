import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    Widget _topbar() {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 22, right: 22, top: 40, bottom: 10),
            child: Material(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(360),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    final nameField = TextFormField(
      autofocus: false,
      readOnly: true,
      keyboardType: TextInputType.text,
      initialValue: 'Gaurav Gupta',
      decoration: InputDecoration(
        labelText: "Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      readOnly: true,
      keyboardType: TextInputType.emailAddress,
      initialValue: 'gaurav@gmail.com',
      decoration: InputDecoration(
        labelText: "Email ID",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    final contactField = TextFormField(
      autofocus: false,
      readOnly: true,
      keyboardType: TextInputType.number,
      initialValue: "1234567890",
      decoration: InputDecoration(
        labelText: "Contact Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    Widget _body() {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 25.0,
        ),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/student_5.png',
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  nameField,
                  const SizedBox(
                    height: 15.0,
                  ),
                  emailField,
                  const SizedBox(
                    height: 15.0,
                  ),
                  contactField,
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget _detailsStack() {
      return Stack(
        children: [_topbar(), _body()],
      );
    }

    return Scaffold(body: _detailsStack());

    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: Colors.white,
    //     body:
    //   ),
    // );
  }
}
