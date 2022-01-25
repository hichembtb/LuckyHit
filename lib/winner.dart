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
                    backgroundColor: Colors.redAccent,
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
                backgroundColor: Colors.redAccent,
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
                  Color(0xFF544a7d),
                  Color(0xFFffd452),
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                          //color: Colors.red,
                          //borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      backgroundImage: prov.genderwinner == "Female"
                          ? const AssetImage("images/female.png")
                          : const AssetImage("images/male.jpg"),
                      radius: 50,
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
                        return RadialGradient(
                          radius: 0.5,
                          stops: const [0.1, 0.4, 0.5, 0.9],
                          colors: [
                            Colors.black,
                            Colors.red.shade900,
                            Colors.black,
                            Colors.red.shade900,
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: Text(
                        "${prov.winner}",
                        style: const TextStyle(
                            fontSize: 50,
                            letterSpacing: 2,
                            //fontStyle: FontStyle.italic,
                            fontFamily: "Rye",
                            color: Colors.white),
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
