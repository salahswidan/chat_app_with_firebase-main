import 'package:flutter/material.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';
import 'resgister_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B475E),
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
              CustomTextField(
                hintText: 'Email',
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: 'Password',
              ),
              SizedBox(
                height: 10,
              ),
              CustomBotton(
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
        ),
      ),
    );
  }
}
