import 'package:flutter/material.dart';

// Player 1 , Player 2
class PlayerIndexContainer extends StatelessWidget {
  final String index;
  final double bottomLeft;
  final double topLeft;
  final double bottomRight;
  final double topRight;
  const PlayerIndexContainer({
    Key? key,
    required this.index,
    required this.bottomLeft,
    required this.bottomRight,
    required this.topLeft,
    required this.topRight,
  }) : super(key: key);
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
