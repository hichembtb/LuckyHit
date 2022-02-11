import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_app/animation.dart';
import 'package:test_app/home.dart';
import 'package:test_app/provider.dart';

class Winner extends StatefulWidget {
  @override
  _WinnerState createState() => _WinnerState();
}

class _WinnerState extends State<Winner> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.grey,
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 20),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<MyProvider>(
                builder: (context, prov, child) {
                  return FloatingActionButton(
                    heroTag: null,
                    backgroundColor: const Color.fromARGB(255, 2, 41, 167),
                    onPressed: () {
                      prov.check1 = null;
                      prov.check2 = null;

                      Navigator.of(context).pushReplacement(
                        SlideRight(
                          Page: Test(),
                        ),
                      );
                    },
                    child: const Icon(Icons.restart_alt),
                  );
                },
              ),
              FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 2, 41, 167),
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Icon(Icons.power_settings_new),
              ),
            ],
          ),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.3, 0.9],
                colors: [
                  Color.fromARGB(255, 227, 224, 236),
                  Color.fromARGB(255, 255, 255, 214),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "The Winner",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rye",
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                Consumer<MyProvider>(
                  builder: (context, prov, child) {
                    return CircleAvatar(
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,

                          //color: Colors.red,
                          //borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      backgroundImage: prov.genderwinner == "Female"
                          ? const AssetImage("images/female.png")
                          : const AssetImage("images/male.jpg"),
                      radius: 120,
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Is",
                  style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rye",
                      color: Colors.black),
                ),
                Consumer<MyProvider>(
                  builder: (context, prov, child) {
                    return ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const RadialGradient(
                          radius: 0.5,
                          stops: [0.1, 0.4, 0.5, 0.9],
                          colors: [
                            Colors.black,
                            Color.fromARGB(255, 2, 41, 167),
                            Colors.black,
                            Color.fromARGB(255, 2, 41, 167),
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: Text(
                        "${prov.winner}",
                        style: const TextStyle(
                          fontSize: 50,
                          letterSpacing: 10,
                          //fontStyle: FontStyle.italic,
                          fontFamily: "Rye",
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
