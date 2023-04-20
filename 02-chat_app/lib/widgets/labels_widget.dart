import 'package:flutter/material.dart';

class LabelsWidget extends StatelessWidget {
  final String route;
  final String title;
  final String subtitle;

  const LabelsWidget(
      {super.key,
      required this.route,
      required this.subtitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300)),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, route);
          },
          child: Text(subtitle,
              style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
