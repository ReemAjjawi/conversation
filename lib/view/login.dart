import 'package:application_albarakah/appstring.dart/color.dart';
import 'package:application_albarakah/appstring.dart/style.dart';

import 'package:application_albarakah/view/conversation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/config/get_it_config.dart';
import '../main.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 0.3,
                ),
                SizedBox(
                  height: height * 0.2,
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'r',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 42.0,
                                letterSpacing: 5.0,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'i',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 42.0,
                                letterSpacing: 5.0,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'i',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 42.0,
                                letterSpacing: 5.0,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'd',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 42.0,
                                letterSpacing: 5.0,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'e',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 42.0,
                                letterSpacing: 5.0,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Welcome to RIIDE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("USERNAME", style: login)),
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                      fillColor: textFieldColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      prefix: const SizedBox(
                        width: 15,
                      ),
                      hintText: "Enter email or username",
                      hintStyle: const TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("PASSWORD", style: login)),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    fillColor: textFieldColor,
                    filled: true,
                    hintText: "Enter your password",
                    hintStyle: const TextStyle(color: Colors.white),
                    prefix: const SizedBox(
                      width: 15,
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Remember me ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Forgot password  ",
                        style: otherOption,
                      ),
                    ]),
                SizedBox(
                  height: height * 0.08,
                ),
                InkWell(
                  onTap: () async {
                    core
                        .get<SharedPreferences>()
                        .setString('name', username.text);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Conversation(),
                        ));
                  },
                  child: PrimaryContainer(text: "sign in"),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Dont have an account? ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Sign up ",
                          style: otherOption,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ));
  }
}

class PrimaryContainer extends StatelessWidget {
  PrimaryContainer({
    super.key,
    required this.text,
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(12)),
      // width:,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 19),
        ),
      ),
    );
  }
}
