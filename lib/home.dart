import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_app/animation.dart';
import 'package:test_app/game.dart';
import 'package:test_app/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              stops: const [0.0, 0.2, 0.5, 0.8],
              colors: [
                Colors.grey.shade900,
                Colors.grey,
                Colors.grey,
                Colors.grey.shade900,
              ],
            ),
          ),
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return RadialGradient(
                              colors: [
                                Colors.black,
                                Colors.blue.withOpacity(0.7),
                                Colors.black,
                              ],
                              center: Alignment.topLeft,
                              radius: 1.0,
                              tileMode: TileMode.mirror,
                            ).createShader(bounds);
                          },
                          child: Column(
                            children: const [
                              Text(
                                "Players",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.5,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Registeration",
                                style: TextStyle(
                                    fontSize: 40,
                                    letterSpacing: 2.5,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.symmetric(horizontal: 100),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      //height: 250,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 20, right: 20),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "Player 1",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Colors.black,
                                height: 50,
                                width: 2,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 20, right: 20),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "Player 2",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Form(
                                  key: formstate,
                                  child: TextFormField(
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
                                    decoration: const InputDecoration(
                                        hintText: "Player 1 Name"),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                color: Colors.black,
                                height: 50,
                                width: 2,
                              ),
                              Expanded(
                                flex: 1,
                                child: Form(
                                  key: formstate2,
                                  child: TextFormField(
                                    validator: (text) {
                                      if (text == null) {
                                        return "please insert a name";
                                      }
                                      if (text.isEmpty) {
                                        return "please insert a name";
                                      }
                                      return null;
                                    },
                                    controller: username2,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(8),
                                    ],
                                    decoration: const InputDecoration(
                                      hintText: "Player 2 Name",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Container(
                                color: Colors.black,
                                height: 100,
                                width: 2,
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
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Form(
                              key: formstate3,
                              child: TextFormField(
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return "Enter Luck Number Please";
                                  }
                                },
                                controller: lucknumber,
                                textAlign: TextAlign.center,
                                maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "0 To 99",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Form(
                              key: formstate4,
                              child: TextFormField(
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return "Enter Max please";
                                  }
                                  // if (text.length < 0 ) {
                                  //  return "Luck number must be betzeen 0 and 99";
                                  // }
                                },
                                controller: maxnumber,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "MAX",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                maxLength: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Consumer<MyProvider>(
                      builder: (context, prov, child) {
                        return ShaderMask(
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
                              stops: const [0.0, 0.2, 0.5, 0.8],
                            ).createShader(bounds);
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: const Text(
                                "START",
                                style:
                                    TextStyle(fontSize: 20, letterSpacing: 2.5),
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
                                  if (prov.check1 != null &&
                                      prov.check2 != null) {
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
                                      dialogBorderRadius:
                                          BorderRadius.circular(50),
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
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      dialogBackgroundColor: Colors.red,
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 3),
                                    ).show();
                                  }
                                }
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
