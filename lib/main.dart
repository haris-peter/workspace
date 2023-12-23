import 'package:flutter/material.dart';
import 'package:trial/data_table_cell.dart';
import 'package:trial/header_cell.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DataTable Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter DataTable Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: DataTableRow(
          headers: const [
            HeaderCell(title: 'image', width: 100),
            HeaderCell(title: 'Name', width: 300),
            HeaderCell(title: 'Supplier', width: 250),
            HeaderCell(title: 'Brand', width: 200),
            HeaderCell(title: 'Barcode', width: 200),
          ],
          dataRows: const [
            ['Name 1', 'Supplier 1', 'Brand 1', 'Barcode 1'],//model class
            ['Name 2', 'Supplier 2', 'Brand 2', 'Barcode 2'],
            // Add more data rows as needed
          ],
          selectedRows: List.generate(2, (index) => false),
          selectAll: false,
          checkbox:true,
          actionbutton: true,
          toggleSelectAll: (value) {},
          onEdit: (index) => print('Edit clicked for row $index'),
          onDelete: (index) => print('Delete clicked for row $index'),
        ),
      ),
    );
  }
}
