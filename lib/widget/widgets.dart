import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Player 1 , Player 2
class PlayerIndex extends StatelessWidget {
  final String index;
  final double bottomLeft;
  final double topLeft;
  final double bottomRight;
  final double topRight;
  PlayerIndex({
    required this.index,
    required this.bottomLeft,
    required this.bottomRight,
    required this.topLeft,
    required this.topRight,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            bottomLeft,
          ),
          topRight: Radius.circular(
            topRight,
          ),
          topLeft: Radius.circular(
            topLeft,
          ),
          bottomRight: Radius.circular(
            bottomRight,
          ),
        ),
      ),
      child: Text(
        index,
        style: const TextStyle(
          color: Color.fromARGB(255, 7, 7, 7),
        ),
      ),
    );
  }
}

// Player 1 & 2 names textField
class PlayerName extends StatelessWidget {
  const PlayerName(
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

// Luck Number and Range
class Numbers extends StatelessWidget {
  const Numbers({
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
