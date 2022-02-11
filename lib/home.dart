import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_app/animation.dart';
import 'package:test_app/game.dart';
import 'package:test_app/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'widget/widgets.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override

  // ignore: no_logic_in_create_state

  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  //Variables
  var male;
  var female;

  //Variables

  //Controllers
  TextEditingController username1 = TextEditingController();
  TextEditingController username2 = TextEditingController();
  TextEditingController lucknumber = TextEditingController();
  TextEditingController maxnumber = TextEditingController();
  //Controllers

  //keys
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  GlobalKey<FormState> formstate2 = GlobalKey<FormState>();
  GlobalKey<FormState> formstate3 = GlobalKey<FormState>();
  GlobalKey<FormState> formstate4 = GlobalKey<FormState>();
  //Keys
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 41, 167),
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                MediaQuery.of(context).size.width * 0.5,
                100.0,
              ),
            ),
          ),
          title: const AutoSizeText(
            "Players Registeration",
            maxFontSize: 24.0,
            minFontSize: 20.0,
            style: TextStyle(
              // fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5,
              color: Colors.white,
            ),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Column(
                children: [
                  Image.asset(
                    "images/splash2.png",
                    height: MediaQuery.of(context).size.height * 0.15,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Card(
                    elevation: 10,
                    margin: const EdgeInsets.all(4),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 2, 41, 167),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          50,
                        ),
                        bottomLeft: Radius.circular(
                          20,
                        ),
                        topRight: Radius.circular(
                          20,
                        ),
                        bottomRight: Radius.circular(
                          50,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: PlayerIndex(
                                topLeft: 30,
                                bottomLeft: 10,
                                bottomRight: 30,
                                topRight: 10,
                                index: "Player 1",
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: PlayerIndex(
                                bottomLeft: 30.0,
                                topRight: 30.0,
                                topLeft: 10,
                                bottomRight: 10,
                                index: "Player 2",
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            PlayerName(
                              hintText: "Player 1 Name",
                              formstate: formstate,
                              username1: username1,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            PlayerName(
                              hintText: "Player 2 Name",
                              formstate: formstate2,
                              username1: username2,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Consumer<MyProvider>(
                                      builder: (context, prov, child) {
                                        return Radio(
                                          groupValue: female,
                                          value: "Male",
                                          onChanged: (val) {
                                            setState(
                                              () {
                                                female = val;
                                                prov.check1 = val;
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    const Text("   Male"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Consumer<MyProvider>(
                                      builder: (context, prov, child) {
                                        return Radio(
                                          groupValue: female,
                                          value: "Female",
                                          onChanged: (val) {
                                            setState(
                                              () {
                                                female = val;
                                                prov.check1 = val;
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    const Text("Female"),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Consumer<MyProvider>(
                                      builder: (context, prov, child) {
                                        return Radio(
                                          groupValue: male,
                                          value: "Male",
                                          onChanged: (val) {
                                            setState(
                                              () {
                                                male = val;
                                                prov.check2 = val;
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    const Text("   Male"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Consumer<MyProvider>(
                                      builder: (context, prov, child) {
                                        return Radio(
                                          groupValue: male,
                                          value: "Female",
                                          onChanged: (val) {
                                            setState(
                                              () {
                                                male = val;
                                                prov.check2 = val;
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    const Text("Female"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Numbers(
                            hintText: " 0 To 99",
                            errorText: "Enter Luck number",
                            myKey: formstate3,
                            myController: lucknumber,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Numbers(
                              hintText: "MAX",
                              errorText: "Enter Max ",
                              myKey: formstate4,
                              myController: maxnumber,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Consumer<MyProvider>(
                    builder: (context, prov, child) {
                      return InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 2, 41, 167),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          height: 35,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text(
                            "START",
                            style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2.5,
                                color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          var formdata = formstate.currentState;
                          var formdata2 = formstate2.currentState;
                          var formdata3 = formstate3.currentState;
                          var formdata4 = formstate4.currentState;
                          if (formdata != null &&
                              formdata2 != null &&
                              formdata3 != null &&
                              formdata4 != null) {
                            if (formdata.validate() &&
                                formdata2.validate() &&
                                formdata3.validate() &&
                                formdata4.validate()) {
                              prov.user1 = username1.text;
                              prov.user2 = username2.text;
                              prov.luckynum = int.parse(lucknumber.text);
                              prov.maximum = int.parse(maxnumber.text);
                              if (prov.check1 != null && prov.check2 != null) {
                                if (prov.check1 == prov.check1) {
                                  prov.gender1 = prov.check1;
                                }
                                if (prov.check2 == prov.check2) {
                                  prov.gender2 = prov.check2;
                                }

                                if (prov.luckynum < prov.maximum &&
                                    prov.luckynum != 0 &&
                                    prov.luckynum > 0) {
                                  Navigator.of(context).pushReplacement(
                                    SlideRight(
                                      Page: Game(),
                                    ),
                                  );
                                } else {
                                  AwesomeDialog(
                                    context: context,
                                    animType: AnimType.SCALE,
                                    dialogType: DialogType.ERROR,
                                    width: double.infinity,
                                    body: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: const [
                                          FittedBox(
                                            child: Text(
                                              "LUCK NUMBER ERROR",
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          FittedBox(
                                            child: Text(
                                              "Luck number is <= 0 or greater then the max",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //autoHide: const Duration(seconds: 5),
                                    padding: const EdgeInsets.only(
                                      bottom: 20,
                                      left: 5,
                                      right: 5,
                                    ),
                                    dialogBackgroundColor: Colors.red,
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 3,
                                    ),
                                    dialogBorderRadius:
                                        BorderRadius.circular(25),
                                  ).show();
                                }
                              } else {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.INFO,
                                  animType: AnimType.SCALE,
                                  dialogBorderRadius: BorderRadius.circular(50),
                                  width: double.infinity,

                                  body: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: FittedBox(
                                      child: Text(
                                        "Gender must be selected",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  //autoHide: const Duration(seconds: 3),
                                  // aligment: Alignment.center,
                                  padding: const EdgeInsets.only(bottom: 20),
                                  dialogBackgroundColor: Colors.red,
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 3),
                                ).show();
                              }
                            }
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
