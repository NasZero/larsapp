import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 2;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter -= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // No debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            // Gradient background
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 117, 136, 189),
                ],
              ),
            ),
            child: Padding(
              //Padding between rows
              padding: const EdgeInsets.only(top: 75.0),
              child: Wrap(
                spacing: 60,
                runSpacing: 60,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container for counter number
                      Container(
                        width: 380,
                        height: 380,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.white.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(12),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 82, 73, 221),
                              Color.fromARGB(255, 77, 17, 146),
                            ],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(2, 10),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            Center(
                              // Counter
                              child: AnimatedFlipCounter(
                                duration: const Duration(milliseconds: 250),
                                value: _counter,
                                textStyle: TextStyle(
                                  fontSize: 200,
                                  color: _counter >= 0
                                      ? Colors.white
                                      : const Color.fromARGB(108, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Plus button
                      Container(
                        width: 165,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.4),
                              Colors.white.withOpacity(0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(2, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                              icon: const Icon(
                                Icons.add,
                              ),
                              color: const Color.fromARGB(255, 163, 174, 204),
                              iconSize: 80,
                              splashRadius: 40,
                              splashColor:
                                  const Color.fromARGB(137, 66, 37, 196),
                              onPressed: _incrementCounter,
                            ),
                          ),
                        ),
                      ),
                      //Minus button
                      Container(
                        width: 165,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.4),
                                Colors.white.withOpacity(0.1),
                              ]),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(2, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                              icon: const Icon(
                                Icons.remove,
                              ),
                              color: const Color.fromARGB(255, 163, 174, 204),
                              iconSize: 80,
                              splashColor:
                                  const Color.fromARGB(137, 66, 37, 196),
                              splashRadius: 40,
                              onPressed: _decreaseCounter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    // End text
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Made by Lars van de Keuken',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(150, 34, 41, 46),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
