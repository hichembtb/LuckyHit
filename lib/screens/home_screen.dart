import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_app/animation.dart';
import 'package:test_app/helper/app_provider.dart';
import 'package:test_app/screens/game_screen.dart';

import 'package:awesome_dialog/awesome_dialog.dart';

import '../widget/custom_button.dart';
import '../widget/numbers_field.dart';
import '../widget/player_name_field.dart';
import '../widget/player_index_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Radio Variables , mael female check
  Object? male;
  Object? female;
// Radio Variables , mael female check

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
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // provider instence
    AppProvider provider = Provider.of<AppProvider>(
      context,
      listen: false,
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 41, 167),
          toolbarHeight: height * 0.07,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                width * 0.5,
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
          height: height * 0.9,
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Column(
                children: [
                  Image.asset(
                    "images/splash2.png",
                    height: height * 0.15,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: height * 0.03,
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
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: PlayerIndexContainer(
                                topLeft: 30,
                                bottomLeft: 10,
                                bottomRight: 30,
                                topRight: 10,
                                index: "Player 1",
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: PlayerIndexContainer(
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
                            PlayerNameTextField(
                              hintText: "Player 1 Name",
                              formstate: formstate,
                              username1: username1,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            PlayerNameTextField(
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
                                    Radio(
                                      groupValue: female,
                                      value: "Male",
                                      onChanged: (val) {
                                        setState(
                                          () {
                                            female = val;
                                            provider.check1 = val;
                                          },
                                        );
                                      },
                                    ),
                                    const Text("   Male"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      groupValue: female,
                                      value: "Female",
                                      onChanged: (val) {
                                        setState(
                                          () {
                                            female = val;
                                            provider.check1 = val;
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
                                    Radio(
                                      groupValue: male,
                                      value: "Male",
                                      onChanged: (val) {
                                        setState(
                                          () {
                                            male = val;
                                            provider.check2 = val;
                                          },
                                        );
                                      },
                                    ),
                                    const Text("   Male"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      groupValue: male,
                                      value: "Female",
                                      onChanged: (val) {
                                        setState(
                                          () {
                                            male = val;
                                            provider.check2 = val;
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
                    height: height * 0.1,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: NumbersTextField(
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
                          child: NumbersTextField(
                            hintText: "MAX",
                            errorText: "Enter Max ",
                            myKey: formstate4,
                            myController: maxnumber,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  InkWell(
                    child: const CustomButton(
                      text: 'START',
                    ),
                    onTap: () {
                      startGame();
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

  // Start Game Function
  void startGame() {
    // provider instence
    AppProvider provider = Provider.of<AppProvider>(
      context,
      listen: false,
    );
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
        provider.user1 = username1.text;
        provider.user2 = username2.text;
        provider.luckynum = int.parse(lucknumber.text);
        provider.maximum = int.parse(maxnumber.text);
        if (provider.check1 != null && provider.check2 != null) {
          if (provider.check1 == provider.check1) {
            provider.gender1 = provider.check1;
          }
          if (provider.check2 == provider.check2) {
            provider.gender2 = provider.check2;
          }

          if (provider.luckynum < provider.maximum &&
              provider.luckynum != 0 &&
              provider.luckynum > 0) {
            Navigator.of(context).pushReplacement(
              SlideRight(
                page: const Game(),
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
              dialogBorderRadius: BorderRadius.circular(25),
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
            borderSide: const BorderSide(color: Colors.black, width: 3),
          ).show();
        }
      }
    }
  }
}
