import 'package:flutter/material.dart';
import 'package:nepse/utils/form_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FormValidator _formValidator = FormValidator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: StreamBuilder(
                stream: _formValidator.textOnlyStream,
                builder: (context, textStream) {
                  return TextFormField(
                    onChanged: (input)=>_formValidator.updateTextOnly(input),
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      filled: true,
                      errorText: textStream.hasError?textStream.error.toString():null,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blueAccent, width: 0.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red, width: 0.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red, width: 0.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                  );
                }
              ),
            )));
  }
}
