import 'package:application_albarakah/view/conversation.dart';
import 'package:application_albarakah/view/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/config/get_it_config.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: core.get<SharedPreferences>().getString('name') == null
            ? Login()
            : Conversation());
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Text(core.get<SharedPreferences>().getString('last result') ??
//             "No Result"),
//       ),
//     );
//   }
// }


//  @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: core.get<SharedPreferences>().getString('token') == null
//             ? const SplashScreen()
//             : ProductsPage());
//   }
// }