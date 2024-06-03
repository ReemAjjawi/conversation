import 'package:application_albarakah/appstring.dart/color.dart';
import 'package:application_albarakah/appstring.dart/style.dart';
import 'package:application_albarakah/model/message_model.dart';
import 'package:application_albarakah/service/message_service.dart';
import 'package:application_albarakah/view/conversation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/config/get_it_config.dart';

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
          child: Column(
            children: [
              //  const Spacer(),
              RichText(
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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: textFieldColor),
                child: TextFormField(
                  controller: username,
                  decoration: const InputDecoration(
                    hintText: "Enter email or username",
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("PASSWORD", style: login)),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: textFieldColor),
                child: TextFormField(
                  controller: password,
                  decoration:
                      const InputDecoration(hintText: "Enter your password"),
                ),
              ),
              // const Row(children: [
              //   Text("Remember me "),
              //   Text("Forgot password  "),
              // ]),
              InkWell(
                onTap: () async {
                  core
                      .get<SharedPreferences>()
                      .setString('name', username.text);
                  List<MessageModel> gg =
                      await MessageSerivceImpl().getAllMessages();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Conversation(),
                      ));
                },
                child: Container(
                  // width:,
                  child: const Text("sign in "),
                ),
              )
            ],
          ),
        ));
  }
}
