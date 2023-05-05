import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String uid;
  final AnimationController animationController;

  const ChatMessage(
      {super.key,
      required this.text,
      required this.uid,
      required this.animationController});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
          .animate(CurvedAnimation(
              parent: animationController, curve: Curves.easeIn)),
      child: Container(
        child: uid == "123" ? _myMessage() : _notMyMessage(),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff4d9ef6),
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 5, left: 50, right: 5),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffe4e5e8),
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 5, left: 5, right: 50),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
