import 'package:flutter/material.dart';

import '../utils.dart';

class TitleAppBar extends StatelessWidget {
  final String text;
  const TitleAppBar(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleTextSTyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: context.isPhone ? 24 : 32,
    );
    return Text(
      text,
      softWrap: true,
      maxLines: 2,
      style: titleTextSTyle,
    );
  }
}
