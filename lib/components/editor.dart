import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String rotule;
  final String tooltip;
  final IconData icon;

  Editor({this.controller, this.rotule, this.tooltip, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: icon != null ? Icon(icon) : null,
            labelText: rotule,
            hintText: tooltip),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
