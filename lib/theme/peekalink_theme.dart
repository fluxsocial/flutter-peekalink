import 'package:flutter/material.dart';
import 'package:flutter_peekalink/theme/theme.dart';

class PeekalinkThemeProvider extends InheritedWidget {
  PeekalinkThemeProvider({Key key, this.child, this.data})
      : super(key: key, child: child);

  final Widget child;
  final PeekalinkThemeData data;

  static PeekalinkThemeData of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PeekalinkThemeProvider>()
        .data;
  }

  @override
  bool updateShouldNotify(PeekalinkThemeProvider oldWidget) =>
      oldWidget.data != data || oldWidget.child != child;
}
