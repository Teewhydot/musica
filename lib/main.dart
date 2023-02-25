import 'package:flutter/material.dart';
import 'package:musica/musica/domain/entities/riverpod_file.dart';
import 'package:musica/musica/presentation/pages/screens/drawer/drawer_all_screens/my_collection/my_collections.dart';
import 'package:provider/provider.dart';

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
      home: MyCollections(),
    );
  }
}
