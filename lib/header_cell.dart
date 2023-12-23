import 'package:flutter/material.dart';

class HeaderCell extends StatelessWidget {
  final String title;
  final double width;
  

  const HeaderCell({
    Key? key,
    required this.title,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(title),
    );
  }
}
