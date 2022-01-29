import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  final String text;

  const FieldTitle({required this.text, Key? k}) : super(key: k);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
