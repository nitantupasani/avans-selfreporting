import 'package:brains4buildings/screens/authenticate/sign_in.dart';
import 'package:brains4buildings/screens/home/screen2.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';
import '../../services/auth.dart';
import '../../services/database.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);
  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final AuthService _auth = AuthService();
  final rooms = [
    'ST 0.01',
    'ST 0.02',
    'ST 0.04',
    'ST 0.05',
    'ST 0.06',
    'ST 0.08',
    'ST 0.10',
    'ST 0.12',
    'ST 0.13',
    'ST 0.14',
    'ST 0.15',
    'ST 0.16',
    'ST 0.17',
    'ST 0.18',
    'ST 0.22',
    'ST 0.23',
    'ST 0.26',
    'ST 0.30',
    'ST 0.31',
    'ST 0.34',
    'ST 0.38'
  ];
  final durations = ['less than an hour', '1-2 hours', 'more than 3 hours'];
  String? value = 'ST 0.01';
  String? value2 = 'less than an hour';
  // ignore: non_constant_identifier_names
  bool nextButtonActive = false;
  // int screen = 1;
  Map<String, int> roomsMap = {
    'ST 0.01': 1,
    'ST 0.02': 2,
    'ST 0.04': 3,
    'ST 0.05': 4,
    'ST 0.06': 5,
    'ST 0.08': 6,
    'ST 0.10': 7,
    'ST 0.12': 8,
    'ST 0.13': 9,
    'ST 0.14': 10,
    'ST 0.15': 11,
    'ST 0.16': 12,
    'ST 0.17': 13,
    'ST 0.18': 14,
    'ST 0.22': 15,
    'ST 0.23': 16,
    'ST 0.26': 17,
    'ST 0.30': 18,
    'ST 0.31': 19,
    'ST 0.34': 20,
    'ST 0.38': 21
  };
  DropdownMenuItem<String> buildMenuItems(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brains for Buildings'),
        backgroundColor: Colors.green[800],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
              setState(() {
                mood = 0;
                modeOfTransport = 0;
                cloth1 = false;
                cloth2 = false;
                cloth3 = false;
                cloth4 = false;
                cloth5 = false;
                cloth6 = false;
                cloth7 = false;
              });
            },
          )
        ],
      ),
      backgroundColor: Colors.green[90],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Form(
              child: Column(children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              '1. How do you feel right now?',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0),
            ),
            SizedBox(width: 10, height: 10),
            SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  mood == 1
                      ? SizedBox(
                          width: 50,
                          height: 50,
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mood = 0;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.green, width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Ink.image(
                                  image: AssetImage('images/Mood1.png'),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 50,
                          height: 50,
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mood = 1;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Ink.image(
                                  image: AssetImage('images/Mood1.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(width: 25.0, height: 50.0),
                  mood == 2
                      ? SizedBox(
                          width: 50,
                          height: 50,
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mood = 0;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.green, width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Ink.image(
                                  image: AssetImage('images/Mood2.png'),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 50,
                          height: 50,
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mood = 2;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Ink.image(
                                  image: AssetImage('images/Mood2.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(width: 25.0, height: 50.0),
                  mood == 3
                      ? SizedBox(
                          width: 50,
                          height: 50,
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mood = 0;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.green, width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Ink.image(
                                  image: AssetImage('images/Mood3.png'),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 50,
                          height: 50,
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mood = 3;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Ink.image(
                                  image: AssetImage('images/Mood3.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(width: 25.0, height: 50.0),
                  mood == 4
                      ? SizedBox(
                          width: 50,
                          height: 50,
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mood = 0;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.green, width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Ink.image(
                                  image: AssetImage('images/Mood4.png'),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 50,
                          height: 50,
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mood = 4;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Ink.image(
                                  image: AssetImage('images/Mood4.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(width: 25.0, height: 50.0),
                  mood == 5
                      ? SizedBox(
                          width: 50,
                          height: 50,
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mood = 0;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.green, width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Ink.image(
                                  image: AssetImage('images/Mood5.png'),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 50,
                          height: 50,
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  mood = 5;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Ink.image(
                                  image: AssetImage('images/Mood5.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Text('2. How did you come to the Avans today?',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0)),
            SizedBox(width: 10, height: 10),
            SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 25,
                          height: 50,
                        ),
                        modeOfTransport == 1
                            ? SizedBox(
                                width: 50,
                                height: 50,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        modeOfTransport = 0;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.green, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Ink.image(
                                        image:
                                            AssetImage('images/Icons_Mov1.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 50,
                                height: 50,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        modeOfTransport = 1;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Ink.image(
                                        image:
                                            AssetImage('images/Icons_Mov1.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(width: 50.0, height: 50.0),
                        modeOfTransport == 2
                            ? SizedBox(
                                width: 50,
                                height: 50,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        modeOfTransport = 0;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.green, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Ink.image(
                                        image:
                                            AssetImage('images/Icons_Mov2.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 50,
                                height: 50,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        modeOfTransport = 2;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Ink.image(
                                        image:
                                            AssetImage('images/Icons_Mov2.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(width: 50.0, height: 50.0),
                        modeOfTransport == 3
                            ? SizedBox(
                                width: 50,
                                height: 50,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        modeOfTransport = 0;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.green, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Ink.image(
                                        image:
                                            AssetImage('images/Icons_Mov3.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 50,
                                height: 50,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        modeOfTransport = 3;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Ink.image(
                                        image:
                                            AssetImage('images/Icons_Mov3.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15, height: 15),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        SizedBox(width: 50.0, height: 50.0),
                        modeOfTransport == 6
                            ? SizedBox(
                                width: 50,
                                height: 50,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        modeOfTransport = 0;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.green, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Ink.image(
                                        image:
                                            AssetImage('images/Icons_Mov4.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 50,
                                height: 50,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        modeOfTransport = 6;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Ink.image(
                                        image:
                                            AssetImage('images/Icons_Mov4.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(width: 50.0, height: 50.0),
                        modeOfTransport == 4
                            ? SizedBox(
                                width: 50,
                                height: 50,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        modeOfTransport = 0;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.green, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Ink.image(
                                        image:
                                            AssetImage('images/Icons_Mov5.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 50,
                                height: 50,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        modeOfTransport = 4;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Ink.image(
                                        image:
                                            AssetImage('images/Icons_Mov5.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(width: 50.0, height: 50.0),
                        modeOfTransport == 5
                            ? SizedBox(
                                width: 50,
                                height: 50,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        modeOfTransport = 0;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.green, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Ink.image(
                                        image:
                                            AssetImage('images/Icons_Mov6.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: 50,
                                height: 50,
                                child: Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        modeOfTransport = 5;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Ink.image(
                                        image:
                                            AssetImage('images/Icons_Mov6.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Text('3. Where are you located in the building?',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0)),
            DropdownButton<String>(
                value: value,
                items: rooms.map(buildMenuItems).toList(),
                onChanged: (value) => setState(() => this.value = value)),
            SizedBox(height: 10.0),
            Text('4. How long have you been here',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0)),
            DropdownButton<String>(
                value: value2,
                items: durations.map(buildMenuItems).toList(),
                onChanged: (value2) => setState(() => this.value2 = value2)),
            SizedBox(height: 35.0),
            ElevatedButton(
                onPressed: (mood != 0) && (modeOfTransport != 0)
                    ? () async {
                        // setState(() => screen = 2);
                        location = value;
                        durationInBuilding = value2;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScreenTwo()));
                      }
                    : null,
                child: Text('Next'))
          ])),
        ),
      ),
    );
  }
}
