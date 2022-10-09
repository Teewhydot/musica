import 'package:flutter/material.dart';
import 'package:musica/reusables/constants.dart';



class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
    backgroundColor: backgroundColor,
    child: Column(
      children: [
        addVerticalSpacing(50),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                },
                leading: const Icon(Icons.history),
                title: const Text('History'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("About the Developer"),
              ),
              const Divider(),
            ],
          ),
        ),
      ],
    ),
  );
}
