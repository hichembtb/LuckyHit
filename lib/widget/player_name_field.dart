import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Player 1 & 2 names textField
class PlayerNameTextField extends StatelessWidget {
  const PlayerNameTextField(
      {Key? key,
      required this.formstate,
      required this.username1,
      required this.hintText})
      : super(key: key);

  final GlobalKey<FormState> formstate;
  final TextEditingController username1;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Form(
        key: formstate,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            style: const TextStyle(fontSize: 15.0),
            validator: (text) {
              if (text == null) {
                return "please insert a name";
              }
              if (text.isEmpty) {
                return "please insert a name";
              }
              return null;
            },
            controller: username1,
            inputFormatters: [
              LengthLimitingTextInputFormatter(8),
            ],
            decoration: InputDecoration(
              focusedErrorBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
              errorStyle: const TextStyle(fontSize: 7.0),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
