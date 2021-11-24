import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:premiun_deluxe_motorsport/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
