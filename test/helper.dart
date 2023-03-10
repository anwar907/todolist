import 'package:flutter/material.dart';

Widget makeTestableWidget({required Widget child}) {
  return LayoutBuilder(
    builder: (_, constraints) =>
        OrientationBuilder(builder: (ctx, orientation) {
      return MaterialApp(
        home: child,
      );
    }),
  );
}
