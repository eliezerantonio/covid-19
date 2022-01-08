import 'package:flutter/material.dart';

class HeaderCase extends StatelessWidget {
  const HeaderCase({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: color.withOpacity(0.6), shape: BoxShape.circle),
          child: Icon(Icons.remove, size: 15, color: color),
        ),
        Text(text),
      ],
    );
  }
}
