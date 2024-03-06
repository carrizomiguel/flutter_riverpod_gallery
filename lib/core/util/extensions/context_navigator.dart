import 'package:flutter/material.dart';

extension ContextNavigator on BuildContext {
  void go(Route<void> route) {
    Navigator.pushReplacement(this, route);
  }

  void push(Route<void> route) {
    Navigator.push(this, route);
  }

  void pop() {
    Navigator.pop(this);
  }

  void popAll() {
    Navigator.popUntil(
      this,
      (route) => route.isFirst,
    );
  }
}
