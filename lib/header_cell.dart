import 'package:flutter/material.dart';

class HeaderCell extends StatelessWidget {
  final double width;
  final String? title;
  final Widget? widget;
  final TextStyle? style;
  const HeaderCell({Key? key, required this.width, this.title, this.style, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: widget ?? Text(title ?? '', style: style ?? const TextStyle(fontSize: 14)),
    );
  }
}
