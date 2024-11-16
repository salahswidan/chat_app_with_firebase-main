import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/show_snack_bar.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';
import 'chat_page.dart';
import 'resgister_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  String? email;

  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Color(0xff2B475E),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 75,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Image.asset('assets/images/scholar.png'),
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'Pacifico'),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      children: [
                        Text(
                          'Login',
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
                    CustomFormTextField(
                      isPass: false,
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomFormTextField(
                      isPass: true,
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
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await loginUser();
                            showSnackBar(context, 'success');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ChatPage(
                                email: email!,
                              );
                            }));
                          } on FirebaseAuthException catch (ex) {
                            if (ex.code == 'user-not-found') {
                              showSnackBar(context, 'user not found');
                            } else if (ex.code == 'wrong-password') {
                              showSnackBar(context, 'wrong password');
                            }
                          } catch (ex) {
                            showSnackBar(context, 'there is an error');
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                      },
                      text: 'LOGIN',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'dont\'t have an account ? ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ResgisterPage();
                            }));
                          },
                          child: Text(
                            '   Register',
                            style: TextStyle(
                              color: Color(0xffC7EDE6),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
