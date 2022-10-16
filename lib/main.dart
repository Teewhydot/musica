
import 'package:flutter/material.dart';
import 'package:musica/models/riverpod_file.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';

void main() {
  runApp(MultiProvider(
    builder: (context, _) {
      return const MyApp();
    },
    providers: [
      ChangeNotifierProvider(create: (context) => MusicPlayerProvider()),
    ],
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
