import 'package:application_albarakah/view/conversation.dart';
import 'package:application_albarakah/view/invite.dart';
import 'package:application_albarakah/view/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/config/get_it_config.dart';

void main() {
  setup();
  runApp(const MyApp());
}

late double width;
late double height;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: core.get<SharedPreferences>().getString('name') == null
          ? Login()
          : Conversation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
