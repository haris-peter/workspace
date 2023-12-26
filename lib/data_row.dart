import 'package:flutter/material.dart';

class MyDataRow extends StatelessWidget {
  const MyDataRow({
    Key? key,
    required this.selected,
    required this.onChanged,
    required this.index,
  }) : super(key: key);

  final bool selected;
  final ValueChanged<bool?> onChanged;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: selected ? Color.fromARGB(255, 170, 149, 255) : Color.fromARGB(255, 241, 238, 253),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Checkbox(
            value: selected,
            onChanged: onChanged,
          ),
          const SizedBox(width: 30),
          Container(
            alignment: Alignment.centerLeft,
            width: 100,
            child: const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/luffyf.png'),
            ),
          ),
          SizedBox(
            width: 300,
            child: Text('Name $index'),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 200,
            child: Text('Supplier $index'),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 100,
            child: Text('Brand $index'),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 150,
            child: Text('Barcode $index'),
          ),
          const SizedBox(width: 10),
          Container(
            alignment: Alignment.centerLeft,
            width: 80,
            child: PopupMenuButton<String>(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'edit',
                    child: ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Edit'),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete'),
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 'edit') {
                  // Implement your edit logic here
                } else if (value == 'delete') {
                  // Implement your delete logic here
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
