import 'package:flutter/material.dart';
import 'package:musica/generated/assets.dart';
import 'package:musica/reusables/constants.dart';
import 'package:musica/screens/drawer_screen.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      backgroundColor: backgroundColor,
      bottomNavigationBar: Container(
        height: 50,
        color: buttonPlayColor,
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search,color: textColor,),
          ),
        ],
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Image.asset(Assets.iconsMusicicon,
        height: 25,width: 25,),
      ),
      body: ListView(
      ),
    );
  }
}
