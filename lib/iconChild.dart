import 'package:flutter/material.dart';

class iconChild extends StatelessWidget {
  iconChild(this.icon, this.label);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}
