import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../widget/constants.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';
import 'login_page.dart';

class ResgisterPage extends StatelessWidget {
  ResgisterPage({super.key});

  get primaryColor => null;

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset('assets/images/scholar.png'),
              Text(
                'Scholar Chat',
                style: TextStyle(
                    fontSize: 32, color: Colors.white, fontFamily: 'Pacifico'),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Text(
                    'REGISTER',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white60,
                        fontFamily: 'Pacifico'),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                onChanged: (data) {
                  email = data;
                },
                hintText: 'Email',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data) {
                  password = data;
                },
                hintText: 'Password',
              ),
              SizedBox(
                height: 10,
              ),
              CustomBotton(
                onTap: () async {
                  try {
                    UserCredential user = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email!, password: password!);
                  } on FirebaseAuthException catch (ex) {
                    if (ex.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Weak Password')));
                    } else if (ex.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'The account already exists for that email')));
                    }
                  }
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('enail created')));
                },
                text: 'REGISTER',
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'already have an account  ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    },
                    child: Text(
                      '   Login',
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
