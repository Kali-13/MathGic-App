import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathgic/text.dart';
import 'package:scratcher/widgets.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int b = 0;
  int c = 0;
  String temp = "";
  String temp1 = "";
  String sho = "";
  String sho1 = "";
  String writeend = "";
  bool _isload = false;
  bool _isloa = false;
  bool ispress = true;
  bool ispress1 = true;
  TextEditingController text1 = TextEditingController();

  TextEditingController text2 = TextEditingController();

  TextEditingController text3 = TextEditingController();
  final k = GlobalKey<FormState>();
  final kk = GlobalKey<FormState>();
  final k3 = GlobalKey<FormState>();
  void cl() {
    text1.clear();
    text2.clear();
    text3.clear();
    setState(() {
      temp = "";
      temp1 = "";
      sho = "";
      sho1 = "";
      writeend = "";
      ispress = true;
      ispress1 = true;
    });
  }

  Future<void> scratchCardDialog(context, String t) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Scratch The Card to See The Magic No.",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.aBeeZee().fontFamily,
                      color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ConfettiWidget(
                  confettiController: _control,
                  blastDirection: -pi / 2,
                  emissionFrequency: 0.01,
                  numberOfParticles: 20,
                  maxBlastForce: 100,
                  minBlastForce: 80,
                  gravity: 0.3,
                ),
              ),
            ],
          ),
          content: Scratcher(
            accuracy: ScratchAccuracy.low,
            child: Container(
              height: 300,
              width: 300,
              alignment: Alignment.center,
              child: Text(
                " Magic No. $t",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.aBeeZee().fontFamily,
                    color: Colors.deepPurple),
                textAlign: TextAlign.center,
              ),
            ),
            image: Image.asset("assets/images/min.png"),
            brushSize: 50,
            threshold: 50,
          ),
        );
      },
    );
  }

  late ConfettiController _control;

  void initState() {
    super.initState();
    _control = ConfettiController(duration: Duration(seconds: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Shimmer.fromColors(
              child: Text(
                "MathGic",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
              baseColor: Colors.deepPurple,
              highlightColor: Colors.grey),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    "Enter Any 5 Digit Number ($temp1)",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan[500],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: k,
                  child: Texx(
                      controller: text1,
                      onPressed: () {
                        if (k.currentState!.validate()) {
                          ispress = false;
                          _control.play();
                          setState(() {
                            temp = "2" + text1.text;
                            b = int.parse(temp);
                            b = b - 2;
                            temp1 = b.toString();
                            scratchCardDialog(context, temp1);
                          });
                        }
                      }),
                ),
                ispress
                    ? Text(
                        "Press Above Button",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                            fontFamily: GoogleFonts.aBeeZee().fontFamily),
                      )
                    : Form(
                        key: kk,
                        child: Texx(
                          controller: text2,
                          onPressed: () {
                            if (kk.currentState!.validate() &&
                                k.currentState!.validate()) {
                              setState(() {
                                ispress1 = false;
                                _isload = true;
                                Future.delayed(Duration(seconds: 2), () {
                                  setState(() {
                                    _isload = false;
                                  });
                                });

                                c = int.parse(text2.text);
                                int te = 99999 - c;
                                sho = te.toString();
                              });
                            }
                          },
                        ),
                      ),
                _isload
                    ? CircularProgressIndicator()
                    : Container(
                        width: 259,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(5.0),
                            color: Colors.deepPurple[200]),
                        child: Text(
                          "$sho",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.center,
                      ),
                SizedBox(
                  height: 30,
                ),
                ispress1
                    ? Text(
                        "Press Above Button",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                            fontFamily: GoogleFonts.aBeeZee().fontFamily),
                      )
                    : Form(
                        key: k3,
                        child: Texx(
                          controller: text3,
                          onPressed: () {
                            if (k3.currentState!.validate() &&
                                kk.currentState!.validate() &&
                                k.currentState!.validate()) {
                              setState(
                                () {
                                  _isloa = true;
                                  Future.delayed(Duration(seconds: 2), () {
                                    setState(() {
                                      _isloa = false;
                                      writeend =
                                          "Add These 5 Number In Calculator and Match With Magic No.";
                                    });
                                  });
                                  c = int.parse(text3.text);
                                  int te = 99999 - c;
                                  sho1 = te.toString();
                                },
                              );
                            }
                          },
                        ),
                      ),
                _isloa
                    ? CircularProgressIndicator()
                    : Container(
                        width: 259,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(5.0),
                            color: Colors.deepPurple[200]),
                        child: Text(
                          "$sho1",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.center,
                      ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    "$writeend",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/ma1.png"),
                    fit: BoxFit.cover)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: cl,
          child: Icon(Icons.restore_sharp),
          backgroundColor: Colors.deepPurple,
        ));
  }
}
