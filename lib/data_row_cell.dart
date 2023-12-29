import 'package:flutter/material.dart';

class DataRowCell extends StatelessWidget {
  final dynamic data;
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
      child: data is String && data.endsWith('.png')
          ? Row(
        children: [
          const SizedBox(
            width: 4,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(data),
          ),
        ],
      )
          : data is Widget
          ? data
          : Text(data.toString()),
    );
  }
}
