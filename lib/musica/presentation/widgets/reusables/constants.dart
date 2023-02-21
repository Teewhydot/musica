import 'package:flutter/material.dart';



const backgroundColor = Color(0xFF1e1e1e);
const buttonPlayColor = Color(0xFFfacd66);
const topClassWidgetColor = Color(0xFF1a1e1f);

Color textColor = const Color(0xFFefeee0).withOpacity(0.25);

Widget addVerticalSpacing (double height){
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalSpacing (double width){
  return SizedBox(
    width: width,
  );
}

const smallWhiteTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
);

const boldWhiteTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 35,
  fontWeight: FontWeight.bold,
);

const smallBlackTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 12,
);

TextStyle smallGreyTextStyle = TextStyle(
  color: textColor,
  fontSize: 12,
);

const smallBoldWhiteTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);

const smallBoldBlackTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);

TextStyle smallBoldGreyTextStyle = TextStyle(
  color: textColor,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);

const mediumWhiteTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
);