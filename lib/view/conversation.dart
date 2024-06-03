import 'package:application_albarakah/model/message_model.dart';
import 'package:application_albarakah/service/message_service.dart';
import 'package:flutter/material.dart';

class Conversation extends StatelessWidget {
  Conversation({super.key});
  List<MessageModel> result = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(Icons.back_hand_outlined),
                Text(
                  "Invite Friends",
                ),
                Icon(Icons.abc),
              ],
            ),
            Container(
              child: TextField(
                onChanged: (value) {
                  result = [];
                  // refresh(() {
                  //   for (var element in messages) {
                  //     if (element.message.contains(value)) {
                  //       result.add(element);
                  //     }
                  //   }

                  // });
                },
                decoration: const InputDecoration(
                  hintText: "",
                  prefix: Icon(Icons.abc),
                  suffix: Icon(Icons.abc),
                ),
              ),
            ),
            SizedBox(
              height: 250,
              //   width: 400,
              child: FutureBuilder(
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
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.90,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Search',
                                        suffixIcon: Icon(Icons.search),
                                      ),
                                      onChanged: (value) {
                                        result = [];
                                        setState(() {
                                          for (var element in messages) {
                                            if (element.message
                                                .contains(value)) {
                                              result.add(element);
                                            }
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: 500,
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
                                              Text(result[index].name),
                                              if (result[index]
                                                      .unreadMessageCount >
                                                  0)
                                                Container(
                                                  // padding: const EdgeInsets.all(6),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.red,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Text(
                                                    result[index]
                                                        .unreadMessageCount
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
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
                                              result[index].date.toString()),
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
            ),
          ],
        ),
      ),
    );
  }
}
              // Icon(Icons.arrow_back)),

//error setup 
//error row 
// async with await 
//  image: DecorationImage(
                                    //       image: Image.network(
                                    //               result[index].thumbnail)
                                    //           .image),
                                    // ),