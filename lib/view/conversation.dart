import 'package:application_albarakah/model/message_model.dart';
import 'package:application_albarakah/service/message_service.dart';
import 'package:application_albarakah/view/invite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';

class Conversation extends StatelessWidget {
  Conversation({super.key});
  List<MessageModel> result = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // gradient: LinearGradient(
          //   colors: [const Color(0xFF000000).withOpacity(0.38)],
          // ),
          // boxShadow: const [
          //   BoxShadow(offset: Offset(8, 4), blurRadius: 200)
          // ]
        ),
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 131, 125, 125).withOpacity(0.7),
              height: height / 5,
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
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Invite(),
                                ));
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Invite Friends",
                      style: TextStyle(
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
            FutureBuilder(
              future: MessageSerivceImpl().getAllMessages(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<MessageModel> messages =
                      snapshot.data as List<MessageModel>;
                  result = messages;
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black,
                                    hintText: "Search here..",
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    prefixIcon: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.green,
                                      ),
                                    ),
                                    suffixIcon: const Icon(
                                        Icons.record_voice_over,
                                        color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                onChanged: (value) {
                                  result = [];
                                  setState(() {
                                    for (var element in messages) {
                                      if (element.message.contains(value)) {
                                        result.add(element);
                                      }
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                              height: height * 0.58,
                              child: ListView.builder(
                                  // separatorBuilder: (context, index) => Divider(),
                                  itemCount: result.length,
                                  itemBuilder: (context, index) {
                                    // ? Eng.Qamar
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        title: Row(
                                          children: [
                                            Text(
                                              result[index].name,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            if (result[index]
                                                    .unreadMessageCount >
                                                0)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 15,
                                                  height: 15,
                                                  // padding: const EdgeInsets.all(6),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 33, 172, 156),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      result[index]
                                                          .unreadMessageCount
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 7,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        subtitle: Text(
                                          result[index].message,
                                        ),
                                        leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                          result[index].image,
                                        )),
                                        trailing: Text(
                                            result[index].date.toString(),
                                            style: const TextStyle(
                                                color: Colors.white)),
                                      ),
                                    );
                                  })),
                        ],
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            Expanded(
                child: Container(
              height: height * 0.2,
            ))
          ],
        ),
      ),
    );
  }
}
