import 'package:application_albarakah/appstring.dart/color.dart';
import 'package:application_albarakah/appstring.dart/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';
import 'login.dart';

class Invite extends StatelessWidget {
  const Invite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 131, 125, 125).withOpacity(0.7),
            height: height / 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: const Color(
                          0xFF202020,
                        ).withOpacity(0.6),
                        blurRadius: 10.0,
                      ),
                    ]),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(7)),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    INVITE,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: const Color(
                          0xFF202020,
                        ).withOpacity(0.6),
                        blurRadius: 10.0,
                      ),
                    ]),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(7)),
                        child: const Icon(Icons.delete, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/Artwork.jpg', color: Colors.transparent,
                      fit: BoxFit.contain,
                      width: width, // Set the desired width
                      height: height * 0.42, // Set the desired height
                    ),
                  ),
                ),
                Text(
                  INVITE,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    PARAGRAF,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 56, 55, 55),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        prefix: const SizedBox(
                          width: 20,
                        ),
                        hintText: "Share your invite code",
                        hintStyle: const TextStyle(
                          color: Color(0xFFC5C5CF),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: PrimaryContainer(text: INVITE),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
