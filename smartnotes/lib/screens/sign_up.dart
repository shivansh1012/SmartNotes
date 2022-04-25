import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/models/user_model.dart';
import 'package:smartnotes/screens/dashboard.dart';
import 'package:smartnotes/screens/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        nameController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Name cannot be empty");
        }
        if (!RegExp(r"^.{3,}$").hasMatch(value)) {
          return ("Enter Valid Name(Min. 3 Character)");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your email");
        }
        //regex
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Enter a valid email");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "Email ID",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      onSaved: (value) {
        passwordController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!RegExp(r"^.{6,}$").hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
        return null;
      },
      obscureText: true,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    final signUpButton = OutlinedButton(
      child: const Text(
        "Sign Up",
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primary),
      ),
      onPressed: () {
        signUp(
            nameController.text, emailController.text, passwordController.text);
      },
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.green,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: primary,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    nameField,
                    const SizedBox(
                      height: 15.0,
                    ),
                    emailField,
                    const SizedBox(
                      height: 15.0,
                    ),
                    // Password
                    passwordField,
                    const SizedBox(
                      height: 15.0,
                    ),
                    signUpButton,
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    // const Center(
                    //   child: Text(
                    //     "Already have an account?",
                    //     style: TextStyle(color: Colors.grey, fontSize: 15.0),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10.0,
                    // ),
                    // OutlinedButton(
                    //   child: const Text(
                    //     "Sign In",
                    //     style: TextStyle(fontSize: 16.0),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const SignIn(),
                    //       ),
                    //     );
                    //   },
                    // )
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()));
                          },
                          child: const Text(
                            "SignIn",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16.0),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String name, String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {saveDetailsToFirestore(name, email, password)})
          .catchError((e) => {Fluttertoast.showToast(msg: e!.message)});
    }
  }

  saveDetailsToFirestore(String name, String email, String password) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.name = name;
    userModel.email = user!.email;
    userModel.uid = user.uid;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account Created Successfully");

    Navigator.replace(context, oldRoute: MaterialPageRoute(builder: (context) => const SignUp()), newRoute: MaterialPageRoute(builder: (context) => const Dashboard()));
    // Navigator.pushAndRemoveUntil(
    //     (context),
    //     MaterialPageRoute(builder: (context) => const Dashboard()),
    //     (route) => false);
  }
}
