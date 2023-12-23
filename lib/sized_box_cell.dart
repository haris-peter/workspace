import 'package:flutter/material.dart';

class SizedBoxCell extends StatelessWidget {
  final double width;

  const SizedBoxCell({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
