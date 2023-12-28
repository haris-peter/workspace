import 'package:flutter/material.dart';

class DataRowCell extends StatelessWidget {
  final String data;
  final double width;


  const DataRowCell({
    Key? key,
    required this.data,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(data),
    );
  }
}
