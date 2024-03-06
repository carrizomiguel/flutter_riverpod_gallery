import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String descriptive() {
    return DateFormat('dd MMM yyyy HH:mm').format(this);
  }
}