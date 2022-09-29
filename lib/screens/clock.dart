import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({Key? key}) : super(key: key);

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  double secondsAngle = 0;
  double minAngle = 0;
  double hoursAngle = 0;

  Timer? timer;
  String finalhour = "";
  TextEditingController thoughtController = TextEditingController();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(microseconds: 500), (timer) {
      final now = DateTime.now();
      // print(now.hour);
      setState(() {
        secondsAngle = (pi / 30) * now.second;
        minAngle = (pi / 30) * now.minute;
      });

      hoursAngle = (pi / 6 * now.hour) + (pi / 45 * minAngle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(8, 25, 35, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(8, 25, 35, 1),
        title: Text("Clock"),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                final List<String>? data = prefs.getStringList('items') ??
                    [
                      '  no date available',
                      '  no time available',
                      '  no dec. available',
                    ];

                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Row(
                            children: [
                              Text("Saved Thoughts"),
                              IconButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  final success = await prefs.remove('items');
                                },
                                icon: Icon(Icons.delete),
                              )
                            ],
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Date: ${data![0]}"),
                              Text("Time: ${data[1]}"),
                              Text("Thought: ${data[2]}"),
                            ],
                          ),
                        ));
              },
              icon: const Icon(Icons.file_copy_sharp))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "DATE",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.black,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(2, 5),
                      ),
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 5,
                        offset: Offset(-5, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    "${DateTime.now().day}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.black,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(2, 5),
                      ),
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 5,
                        offset: Offset(-5, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    "${DateTime.now().month}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.black,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        // spreadRadius: 2,
                        offset: Offset(2, 5),
                      ),
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 5,
                        // spreadRadius: 2,
                        offset: Offset(-5, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    "${DateTime.now().year}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "TIME",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       alignment: Alignment.center,
            //       width: 50,
            //       height: 50,
            //       decoration: const BoxDecoration(
            //         color: Colors.white,
            //         gradient: LinearGradient(
            //           colors: [
            //             Colors.orange,
            //             Colors.white,
            //             Colors.yellow,
            //           ],
            //           begin: Alignment.topRight,
            //           end: Alignment.bottomLeft,
            //         ),
            //       ),
            //       child: Text(
            //         "${DateTime.now().hour}",
            //         style: const TextStyle(
            //             fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     const SizedBox(width: 20),
            //     Container(
            //       alignment: Alignment.center,
            //       width: 50,
            //       height: 50,
            //       decoration: const BoxDecoration(
            //         color: Colors.white,
            //         gradient: LinearGradient(
            //           colors: [
            //             Colors.orange,
            //             Colors.white,
            //             Colors.yellow,
            //           ],
            //           begin: Alignment.topRight,
            //           end: Alignment.bottomLeft,
            //         ),
            //       ),
            //       child: Text(
            //         "${DateTime.now().minute}",
            //         style: const TextStyle(
            //             fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     const SizedBox(width: 20),
            //     Container(
            //       alignment: Alignment.center,
            //       width: 50,
            //       height: 50,
            //       decoration: const BoxDecoration(
            //         color: Colors.white,
            //         gradient: LinearGradient(
            //           colors: [
            //             Colors.orange,
            //             Colors.white,
            //             Colors.yellow,
            //           ],
            //           begin: Alignment.topRight,
            //           end: Alignment.bottomLeft,
            //         ),
            //       ),
            //       child: Text(
            //         "${DateTime.now().second}",
            //         style: const TextStyle(
            //             fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              child: Container(
                height: 350,
                width: 350,
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/images/c2.png",
                    ),

                    // Seconds
                    Transform.rotate(
                      angle: secondsAngle,
                      child: Container(
                        padding: const EdgeInsets.only(top: 30),
                        alignment: const Alignment(0, -0.35),
                        child: Container(
                          height: 90,
                          width: 2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    //  MIN

                    Transform.rotate(
                      angle: minAngle,
                      child: Container(
                        padding: const EdgeInsets.only(top: 28),
                        alignment: const Alignment(0, -0.35),
                        child: Container(
                          height: 70,
                          width: 4,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    // HOURS

                    Transform.rotate(
                      angle: hoursAngle,
                      child: Container(
                        padding: const EdgeInsets.only(top: 6),
                        alignment: const Alignment(0, -0.2),
                        child: Container(
                          height: 60,
                          width: 4,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    // DOT
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
              ),
              child: const Text("Mark My Thought "),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Center(child: const Text("Add Thought")),
                          content: Container(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                        "Date: ${DateTime.now().day.toString()}-"),
                                    Text("${DateTime.now().month.toString()}-"),
                                    Text("${DateTime.now().year.toString()}"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                        "Time: ${(DateTime.now().hour == 00) ? finalhour = "12" : (DateTime.now().hour == 01) ? finalhour = "01" : (DateTime.now().hour == 02) ? finalhour = "02" : (DateTime.now().hour == 03) ? finalhour = "03" : (DateTime.now().hour == 04) ? finalhour = "04" : (DateTime.now().hour == 05) ? finalhour = "05" : (DateTime.now().hour == 06) ? finalhour = "06" : (DateTime.now().hour == 07) ? finalhour = "07" : (DateTime.now().hour == 08) ? finalhour = "08" : (DateTime.now().hour == 09) ? finalhour = "09" : (DateTime.now().hour == 10) ? finalhour = "10" : (DateTime.now().hour == 11) ? finalhour = "11" : (DateTime.now().hour == 12) ? finalhour = "12" : (DateTime.now().hour == 13) ? finalhour = "01" : (DateTime.now().hour == 14) ? finalhour = "02" : (DateTime.now().hour == 15) ? finalhour = "03" : (DateTime.now().hour == 16) ? finalhour = "04" : (DateTime.now().hour == 17) ? finalhour = "05" : (DateTime.now().hour == 18) ? finalhour = "06" : (DateTime.now().hour == 19) ? finalhour = "07" : (DateTime.now().hour == 20) ? finalhour = "08" : (DateTime.now().hour == 21) ? finalhour = "09" : (DateTime.now().hour == 22) ? finalhour = "10" : (DateTime.now().hour == 23) ? finalhour = "11" : finalhour = "12"}"),
                                    Text(
                                        " : ${DateTime.now().minute.toString()}"),
                                    Text(
                                        " : ${DateTime.now().second.toString()}"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 100,
                                  width: 300,
                                  child: TextField(
                                    controller: thoughtController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Thought',
                                      label: const Text("Thought"),
                                      prefixIcon: const Icon(Icons.add),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.amber),
                                  ),
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();

                                    await prefs.setStringList('items', <String>[
                                      '${DateTime.now().day.toString()},${DateTime.now().month.toString()},${DateTime.now().year.toString()}',
                                      '$finalhour,${DateTime.now().minute.toString()},${DateTime.now().second.toString()}',
                                      '${thoughtController.text}',
                                    ]);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Save"),
                                )
                              ],
                            ),
                          ),
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
