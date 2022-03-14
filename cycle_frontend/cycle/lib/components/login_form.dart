import 'package:cycle/components/form_button.dart';
import 'package:cycle/constants.dart';
import 'package:cycle/pages/forgot_password_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Form for a login.
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  // Global key that uniquely identifies the LoginForm widget.
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  // Controllers that keep track of the user's input.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Wrap(
                runSpacing: 20.0,
                children: <Widget>[
                  // EMAIL FIELD
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                    ),
                  ),
                  // PASSWORD FIELD
                  TextFormField(
                    obscureText: hidePassword,
                    controller: passwordController,
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Align(
                alignment: Alignment.topRight,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Forgot password?",
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, ForgotPasswordPage.id);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: FormButton(
                  text: 'Login',
                  onPressed: () {
                    // Send user data to server and look for a user with provided details.
                  },
                )),
          ],
        ),
      ),
    );
  }
}