import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/core/core.dart';
import 'package:gallery/firebase_options.dart';
import 'package:gallery/injector.dart';
import 'package:gallery/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.init();

  runApp(
    ProviderScope(
      observers: [Observer()],
      child: const AppView(),
    ),
  );
}
