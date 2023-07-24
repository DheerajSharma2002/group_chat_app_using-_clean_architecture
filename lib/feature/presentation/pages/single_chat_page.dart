import 'package:flutter/material.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({super.key});

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

final TextEditingController _messageController = TextEditingController();

@override
class _SingleChatPageState extends State<SingleChatPage> {
  @override
  void initState() {
    _messageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Group Name"),
      ),
      body: Column(
        children: [
          Expanded(child: _listMessageWidget()),
          _inputMessageTextField(),
        ],
      ),
    );
  }
}

_listMessageWidget() {
  return ListView.builder(itemBuilder: (context, index) {
    //MessageLayout
    return const Text("");
  });
}

_inputMessageTextField() {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(80),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 1,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                const Icon(Icons.insert_emoticon),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Scrollbar(
                    child: TextField(
                      controller: _messageController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: "Type a message",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const Icon(Icons.link),
                const SizedBox(
                  width: 2,
                ),
                const Icon(Icons.camera_alt),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Icon(
            _messageController.text.isEmpty ? Icons.mic : Icons.send,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
