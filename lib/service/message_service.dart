import 'package:application_albarakah/model/message_model.dart';
import 'package:dio/dio.dart';

abstract class MessageService {
  Dio req = Dio();
  late Response response;
  String baseUrl = 'https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/people';

  Future<List<MessageModel>> getAllMessages();
}

class MessageSerivceImpl extends MessageService {
  @override
  Future<List<MessageModel>> getAllMessages() async {
    print("object");
    try {
      response = await req.get(baseUrl);
      print(response.statusCode);

      print(response.data);
      if (response.statusCode == 200) {
        List<MessageModel> messages = List.generate(
          response.data.length,
          (index) => MessageModel.fromJson(
            response.data[index],
          ),
        );
        return messages;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
