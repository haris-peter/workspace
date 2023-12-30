import 'package:flutter/material.dart';
import 'package:trial/data_table_cell.dart';
import 'package:trial/header_cell.dart';

import 'data_model.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductDetailsModel> sampleList1 = [
    ProductDetailsModel(
      name: 'Product ',
      supplier: 'Supplier C',
      brand: 'Brand X',
      barcode: '123456789',
      checked: true,
      photoUrl: 'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
    ),
    ProductDetailsModel(
      name: 'Product 2',
      supplier: 'Supplier B',
      brand: 'Brand Y',
      barcode: '12345',
      checked: false,
      photoUrl: 'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
    ),
    ProductDetailsModel(
      name: 'Product 3',
      supplier: 'Supplier C',
      brand: 'Brand Z',
      barcode: '1234511',
      checked: false,
      photoUrl: 'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter DataTable Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: DataTableRow(
          headers: [
            HeaderCell(
                widget:
                    Checkbox(value: !sampleList1.map((e) => e.checked).contains(false), onChanged: _toggleSelectAll),
                width: 200),
            const HeaderCell(title: 'Image', width: 250),
            const HeaderCell(title: 'Name', width: 250),
            const HeaderCell(title: 'Supplier', width: 250),
            const HeaderCell(title: 'Brand', width: 200),
            const HeaderCell(title: 'Barcode', width: 200),
          ],
          dataRows: [
            for (final i in sampleList1)
              [
                HeaderCell(widget: Checkbox(value: i.checked, onChanged: (a) => _selectProduct(a, i)), width: 200),
                HeaderCell(widget: Image.network(i.photoUrl, width: 24, height: 24), width: 200),
                HeaderCell(title: i.name, width: 250, style: TextStyle(fontSize: 15)),
                HeaderCell(title: i.supplier, width: 250),
                HeaderCell(title: i.brand, width: 200),
                HeaderCell(title: i.barcode, width: 200),
              ]
          ],
        ),
      ),
    );
  }

  void _toggleSelectAll(bool? checked) {
    if (checked == null) return;

    for (final i in sampleList1) {
      i.checked = checked;
    }

    setState(() {});
  }

  void _selectProduct(bool? checked, ProductDetailsModel model) {
    if (checked == null) return;

    model.checked = checked;
    setState(() {});
  }
}
