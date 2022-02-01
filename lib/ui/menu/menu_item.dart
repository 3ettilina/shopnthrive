import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  const MenuItem(
      {required this.title, required this.icon, required this.onTap, Key? k})
      : super(key: k);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
      leading: Icon(
        icon,
        size: 35.0,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
      onTap: () => onTap(),
    );
  }
}
