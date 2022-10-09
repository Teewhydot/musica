import 'package:flutter/material.dart';

class NewReleasesWidget extends StatelessWidget {
  final String image;

  const NewReleasesWidget({super.key, required this.image});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        image,
        fit: BoxFit.fill,
        height: 153,
        width: 153,
      ),
    );
  }
}
