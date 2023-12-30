import 'package:flutter/material.dart';

class DataRowModel {
  final String name;
  final String supplier;
  final String brand;
  final String barcode;
  final String photoUrl;
  final bool checked;
  
   DataRowModel(
   this.name, 
   this.supplier, 
   this.brand, 
   this.barcode, 
   this.checked, 
   this.photoUrl, 
  );

  List<DataRowModel> sampleList1 = [
  DataRowModel(
    'Product 1',
    'Supplier A',
    'Brand X',
    '123456789',
    true,
    'assets/luffyf.png',
  ),
  DataRowModel(
    'Product 2',
    'Supplier B',
    'Brand Y',
    '987654321',
    false,
    'assets/sugarr.png',
  ),
  DataRowModel(
    'Product 3',
    'Supplier C',
    'Brand Z',
    '456789012',
    true,
    'assets/wheate.png',
  ),
  // Add more items as needed...
];




}




