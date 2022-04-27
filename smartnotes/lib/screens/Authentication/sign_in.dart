import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartnotes/constants.dart';
import 'package:smartnotes/screens/Dashboard/dashboard.dart';
import 'package:smartnotes/screens/Authentication/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        _emailController.text = value!;
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
      controller: _passwordController,
      onSaved: (value) {
        _passwordController.text = value!;
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

    final signInButton = OutlinedButton(
      child: const Text(
        "Sign In",
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primary),
      ),
      onPressed: () {
        _signInWithEmailAndPassword();
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
                      backgroundColor: Colors.amber,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: primary,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    emailField,
                    const SizedBox(
                      height: 15.0,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 15.0,
                    ),
                    signInButton,
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    // const Center(
                    //   child: Text(
                    //     "Don't have an account?",
                    //     style: TextStyle(color: Colors.grey, fontSize: 15.0),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10.0,
                    // ),
                    // OutlinedButton(
                    //   child: const Text(
                    //     "Sign Up",
                    //     style: TextStyle(fontSize: 16.0),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const SignUp(),
                    //       ),
                    //     );
                    //   },
                    // )
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signInWithEmailAndPassword() async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Dashboard()))
                // Navigator.pushNamed(context, '0')
              })
          .catchError((error) {
        Fluttertoast.showToast(msg: error!.message);
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
