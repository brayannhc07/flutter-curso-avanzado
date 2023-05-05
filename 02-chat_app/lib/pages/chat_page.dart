import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  List<ChatMessage> _messages = [];
  bool _isWriting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Column(
            children: [
              CircleAvatar(
                maxRadius: 14,
                backgroundColor: Colors.blue.shade100,
                child: const Text("Te", style: TextStyle(fontSize: 12)),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text("Mesila Flores",
                  style: TextStyle(color: Colors.black87, fontSize: 12)),
            ],
          )),
      body: Column(
        children: [
          Flexible(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (context, index) => _messages[index],
          )),
          const Divider(
            height: 1,
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: _inputChat(),
          )
        ],
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: textController,
            onSubmitted: handleSubmit,
            onChanged: (value) {
              setState(() {
                _isWriting = value.trim().isNotEmpty;
              });
            },
            decoration:
                const InputDecoration.collapsed(hintText: "Enviar mensaje"),
            focusNode: focusNode,
          )),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS
                  ? CupertinoButton(
                      onPressed: _isWriting
                          ? () => handleSubmit(textController.text.trim())
                          : null,
                      child: const Text("Enviar"),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue.shade400),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: const Icon(Icons.send),
                          onPressed: _isWriting
                              ? () => handleSubmit(textController.text.trim())
                              : null,
                        ),
                      ),
                    ))
        ],
      ),
    ));
  }

  handleSubmit(String texto) {
    if (texto.isEmpty) return;

    debugPrint(texto);
    textController.clear();
    focusNode.requestFocus();

    final newMessage = ChatMessage(
      text: texto,
      uid: "123",
      animationController: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 100)),
    );
    _messages.insert(0, newMessage);

    newMessage.animationController.forward();
    setState(() {
      _isWriting = false;
    });
  }

  @override
  void dispose() {
    // TODO: Off del socket
    for (final chatMessage in _messages) {
      chatMessage.animationController.dispose();
    }
    super.dispose();
  }
}
