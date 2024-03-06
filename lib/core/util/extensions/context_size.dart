import 'package:flutter/material.dart';

extension ContextSize on BuildContext {
  double width(double percent) {
    return MediaQuery.of(this).size.width * percent;
  }

  double height(double percent) {
    return MediaQuery.of(this).size.height * percent;
  }
}
