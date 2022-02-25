import 'package:cycle/services/string_validator.dart';
import 'package:cycle/services/validator_messages.dart';
import 'package:flutter/material.dart';

/// First name field used in the sign-up form.
class FirstNameField extends StatefulWidget {
  const FirstNameField({Key? key}) : super(key: key);

  @override
  FirstNameFieldState createState() {
    return FirstNameFieldState();
  }
}

class FirstNameFieldState extends State<FirstNameField> {
  final _validator = StringValidator();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        ValidatorMessage message = _validator.isFirstName(value!);
        if (value.isEmpty) {
          return 'Please enter your name';
        } else if (message != ValidatorMessage.defaultMessage) {
          return _validator.getText(message);
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        labelText: 'First name',
        hintText: 'Enter your first name',
      ),
    );
  }
}
