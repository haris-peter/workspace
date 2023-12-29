import 'package:flutter/material.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key, required this.selectAll, required this.toggleSelectAll}) : super(key: key);

  final bool selectAll;
  final void Function(bool?) toggleSelectAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 245, 246, 250),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Checkbox(
            value: selectAll,
            onChanged: toggleSelectAll,
          ),
          const SizedBox(width: 30),
          const SizedBox(
            width: 100, // Set your desired width
            child: Text('Image'),
          ),
          const SizedBox(
            width: 300, // Set your desired width
            child: Text('Name'),
          ),
          const SizedBox(width: 10),
          const SizedBox(
            width: 200, // Set your desired width
            child: Text('Supplier'),
          ),
          const SizedBox(width: 10),
          const SizedBox(
            width: 100, // Set your desired width
            child: Text('Brand'),
          ),
          const SizedBox(width: 10),
          const SizedBox(
            width: 150, // Set your desired width
            child: Text('Barcode'),
          ),
          const SizedBox(width: 10),
          const SizedBox(
            width: 80, // Set your desired width
            child: Text('Action'),
          ),
        ],
      ),
    );
  }
}
