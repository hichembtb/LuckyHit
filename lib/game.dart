import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_app/animation.dart';
import 'package:test_app/provider.dart';
import 'dart:math';

import 'package:test_app/winner.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int number = 0;
  int number2 = 0;
  bool disablebutton = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF3a6168),
                Color(0xFF89253e),
              ],
            ),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 20,
              ),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const RadialGradient(
                    colors: [
                      Colors.blue,
                      Colors.black,
                    ],
                    stops: [0.1, 0.6],
                    center: Alignment.topLeft,
                    radius: 1.0,
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: const FittedBox(
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                  child: Text(
                    "Luck number",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const RadialGradient(
                    colors: [
                      Colors.blue,
                      Colors.black,
                      Colors.red,
                    ],
                    radius: 1.0,
                  ).createShader(bounds);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  height: 70,
                  width: 70,
                  alignment: Alignment.center,
                  child: Consumer<MyProvider>(
                    builder: (context, prov, child) {
                      return Text(
                        "${prov.luckynum}",
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Consumer<MyProvider>(
                        builder: (context, prov, child) {
                          return Text(
                            "${prov.user1}",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer<MyProvider>(
                        builder: (context, prov, child) {
                          return CircleAvatar(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                //color: Colors.red,
                                //borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            radius: 50,
                            backgroundImage: prov.gender1 == "Female"
                                ? const AssetImage("images/female.png")
                                : const AssetImage("images/male.jpg"),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Consumer<MyProvider>(
                        builder: (context, prov, child) {
                          return InkWell(
                            onTap: () {
                              setState(
                                () {
                                  if (disablebutton == true) {
                                    return;
                                  } else {
                                    number = Random().nextInt(prov.maximum) + 1;
                                    if (number == prov.luckynum) {
                                      prov.genderwinner = prov.gender1;
                                      prov.winner = prov.user1;
                                      Navigator.of(context).pushReplacement(
                                        GameToWinner(
                                          Page: Winner(),
                                        ),
                                      );
                                    }
                                    disablebutton = !disablebutton;
                                  }
                                },
                              );
                            },
                            child: disablebutton == false
                                ? ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const RadialGradient(
                                        colors: [
                                          Colors.blue,
                                          Colors.black,
                                          Colors.red,
                                        ],
                                        radius: 1.0,
                                      ).createShader(bounds);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(10),
                                      height: 100,
                                      width: 100,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "$number",
                                        style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                //Second ShaderMAsk
                                : ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const RadialGradient(
                                        colors: [
                                          Colors.red,
                                          Colors.black,
                                          Colors.white,
                                        ],
                                        radius: 1.0,
                                      ).createShader(bounds);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(10),
                                      height: 100,
                                      width: 100,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "$number",
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Consumer<MyProvider>(
                        builder: (context, prov, child) {
                          return Text(
                            "${prov.user2}",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer<MyProvider>(
                        builder: (context, prov, child) {
                          return CircleAvatar(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                //color: Colors.red,
                                //borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            radius: 50,
                            backgroundImage: prov.gender2 == "Female"
                                ? const AssetImage("images/female.png")
                                : const AssetImage("images/male.jpg"),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Consumer<MyProvider>(
                        builder: (context, prov, child) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  // disablebutton = !disablebutton;
                                  if (disablebutton == false) {
                                    return;
                                  } else {
                                    number2 =
                                        Random().nextInt(prov.maximum) + 1;
                                    if (number2 == prov.luckynum) {
                                      prov.genderwinner = prov.gender2;
                                      prov.winner = prov.user2;
                                      Navigator.of(context).pushReplacement(
                                        GameToWinner(
                                          Page: Winner(),
                                        ),
                                      );
                                    }
                                    disablebutton = !disablebutton;
                                  }
                                });
                              },
                              child: disablebutton == false
                                  ? ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return const RadialGradient(
                                          colors: [
                                            Colors.red,
                                            Colors.black,
                                            Colors.white,
                                          ],
                                          radius: 1.0,
                                        ).createShader(bounds);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black, width: 1),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        height: 100,
                                        width: 100,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "$number2",
                                          style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black),
                                        ),
                                      ),
                                    )
                                  //Second 2 ShadeMAsk
                                  : ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return const RadialGradient(
                                                colors: [
                                              Colors.blue,
                                              Colors.black,
                                              Colors.red,
                                            ],
                                                radius: 1.0,
                                                tileMode: TileMode.mirror)
                                            .createShader(bounds);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black, width: 1),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        height: 100,
                                        width: 100,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "$number2",
                                          style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ));
                        },
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                      center: Alignment.topLeft,
                      radius: 1.0,
                      tileMode: TileMode.mirror,
                      colors: [
                        Colors.blue.shade900,
                        Colors.blue.shade400,
                        Colors.lightBlue.shade900,
                        Colors.blue.shade900,
                      ],
                      stops: const [
                        0.0,
                        0.2,
                        0.5,
                        0.8
                      ]).createShader(bounds);
                },
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    height: 35,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Exit",
                      style: TextStyle(fontSize: 20, letterSpacing: 2.5),
                    ),
                  ),
                  onTap: () {
                    SystemNavigator.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
