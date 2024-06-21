import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'message_screen.dart'; // Pastikan untuk mengimpor file message_screen.dart yang sesuai

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    DialogFlowtter.fromFile().then((instance) => setState(() {
      dialogFlowtter = instance;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.android,
                color: Colors.black,
              ),
            ),
            Text(
              'ElzeBot',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFFEf6969),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessageScreen(messages: messages)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Color(0xFFEf6969),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Type your message...',
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                    icon: const Icon(Icons.send),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print("Message is Empty");
    } else {
      setState(() {
        addMessage(
          Message(text: DialogText(text: [text])),
          true,
        );
      });
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
        queryInput: QueryInput(text: TextInput(text: text)),
      );

      if (response.message == null) {
        return;
      } else {
        setState(() {
          addMessage(response.message!);
        });
      }
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    setState(() {
      messages.add({"message": message, "isUserMessage": isUserMessage});
    });
  }
}
