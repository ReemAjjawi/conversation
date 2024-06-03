import 'package:flutter/material.dart';

class Invite extends StatelessWidget {
  const Invite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //backgroundColor: ,
          title: const Text('My App'),
          toolbarHeight: 130.0,
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: const Color(
                  0xFF202020,
                ).withOpacity(0.6),
                blurRadius: 10.0,
              ),
            ]),
            child: const Icon(Icons.arrow_back),
          ),
          actions: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: const Color(
                    0xFF202020,
                  ).withOpacity(0.6),
                  blurRadius: 10.0,
                )
              ]),
              child: const Icon(
                Icons.delete,
              ),
            ),
          ]),
      body: Column(
        children: [
          Image.asset(
            'assets/images/Artwork.jpg',
            width: 200.0, // Set the desired width
            height: 200.0, // Set the desired height
          ),
        ],
      ),
    );
  }
}
