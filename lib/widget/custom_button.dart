// App Button , start game , exit game
import 'package:flutter/material.dart';

import '../components/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 2, 41, 167),
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      height: 35,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: kButtonTextStyle,
      ),
    );
  }
}
