import 'package:flutter/material.dart';

class Heading extends StatefulWidget {
  const Heading({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<Heading> createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
      child: Center(
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.solid,
            color: Colors.transparent,
            decorationColor: Colors.black87,
            shadows: [Shadow(color: Colors.black, offset: Offset(0, -10))],
            decorationThickness: 1,
          ),
        ),
      ),
    );
  }
}
