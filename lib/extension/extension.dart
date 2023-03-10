import 'package:flutter/material.dart';

extension FirstData on String {
  String firstValue() {
    return split('').first;
  }
}

extension DesignBox on Widget {
  Widget decorationStyle(String? text) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Text(text!.firstValue().toUpperCase()),
      ),
    );
  }
}

extension DesignText on TextStyle {
  TextStyle styledText(bool setLine) {
    return TextStyle(
        color: setLine ? Colors.grey : Colors.black,
        decoration: setLine ? TextDecoration.lineThrough : TextDecoration.none);
  }
}
