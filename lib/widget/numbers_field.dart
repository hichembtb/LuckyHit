// Luck Number and Range
import 'package:flutter/material.dart';

class NumbersTextField extends StatelessWidget {
  const NumbersTextField({
    Key? key,
    required this.myKey,
    required this.myController,
    required this.hintText,
    required this.errorText,
  }) : super(key: key);

  final GlobalKey<FormState> myKey;
  final TextEditingController myController;
  final String hintText;
  final String errorText;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: myKey,
      child: TextFormField(
        validator: (text) {
          if (text == null || text.isEmpty) {
            return errorText;
          }
        },
        controller: myController,
        textAlign: TextAlign.center,
        maxLength: 2,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 2, 41, 167),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 2, 41, 167),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 2, 41, 167),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 2, 41, 167),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
