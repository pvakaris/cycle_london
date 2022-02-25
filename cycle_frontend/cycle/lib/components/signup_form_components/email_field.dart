import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

/// Email field used in the sign-up form.
class EmailField extends StatefulWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  EmailFieldState createState() {
    return EmailFieldState();
  }
}

class EmailFieldState extends State<EmailField> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (isEmail(value!)) {
          return null;
        } else {
          return "Your provided email is invalid.";
        }
      },
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email address',
      ),
    );
  }
}
