import 'package:flutter/material.dart';
import 'package:shopnthrive/theme.dart';

class ButtonMainFullWidth extends StatelessWidget {
  final Function onPressed;
  final String text;

  const ButtonMainFullWidth(
      {required this.onPressed, required this.text, Key? k})
      : super(key: k);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: ElevatedButton(
          onPressed: () => onPressed(),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => ShopNThriveColors.brightYellowDuck,
            ),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    ]);
  }
}
