import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const double imageSize = 100;
const double nameSize = 300;
const double supplierSize = 200;
const double brandSize = 100;
const double barcodeSize = 150;
const double actionSize = 80;
const double containerHeight=50;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Table Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> selectedRows = List.generate(10, (index) => false);
  bool selectAll = false;

  void toggleSelectAll() {
    setState(() {
      selectAll = !selectAll;
      for (int i = 0; i < selectedRows.length; i++) {
        selectedRows[i] = selectAll;
      }
    });
  }

  void editRow(int rowIndex) {
    // Implement edit functionality
    print('Edit clicked for row $rowIndex');
  }

  void deleteRow(int rowIndex) {
    // Implement delete functionality
    setState(() {
      selectedRows.removeAt(rowIndex);
    });
    print('Delete clicked for row $rowIndex');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Web Table Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Row
              Container(
                height: containerHeight,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color.fromARGB(255, 245, 246, 250)),
                child: Row(
                  children: [
                    const SizedBox(width: 10,),
                    Checkbox(
                      value: selectAll,
                      onChanged: (value) => toggleSelectAll(),
                    ),
                    const SizedBox(width: 30),
                    const SizedBox(
                      width: imageSize, // Set your desired width
                      child: Text('Image',),
                    ),
                    const SizedBox(
                      width: nameSize, // Set your desired width
                      child: Text('Name'),
                    ),
                    const SizedBox(width: 10),
                    const SizedBox(
                      width: supplierSize, // Set your desired width
                      child: Text('Supplier'),
                    ),
                    const SizedBox(width: 10),
                    const SizedBox(
                      width: brandSize, // Set your desired width
                      child: Text('Brand'),
                    ),
                    const SizedBox(width: 10),
                    const SizedBox(
                      width: barcodeSize, // Set your desired width
                      child: Text('Barcode'),
                    ),
                    const SizedBox(width: 10),
                    const SizedBox(
                      width: actionSize, // Set your desired width
                      child: Text('Action'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Second Row (ListView)
              Expanded(
                child: Container(
                  
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10,),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        height: containerHeight,
                        decoration: BoxDecoration(
                          color: selectedRows[index] ? 
                          Color.fromARGB(255, 170, 149, 255) : Color.fromARGB(255, 241, 238, 253),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          
                          child: Row(
                            
                            children: [
                              const SizedBox(width: 10,),
                              Checkbox(
                                value: selectedRows[index],
                                onChanged: (value) {
                                  setState(() {
                                    selectedRows[index] = value!;
                                  });
                                },
                              ),
                              const SizedBox(width: 30),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: imageSize,
                                child: const CircleAvatar(
                                  radius: 15,
                                  backgroundImage: AssetImage('assets/luffyf.png'),
                                ),
                              ),
                               SizedBox(
                                width: nameSize,
                                child: Text('Name $index'),
                              ),
                              const SizedBox(width: 10),
                               SizedBox(
                                width: supplierSize,
                                child: Text('Supplier $index'),
                              ),
                              const SizedBox(width: 10),
                               SizedBox(
                                width: brandSize,
                                child: Text('Brand $index'),
                              ),
                              const SizedBox(width: 10),
                               SizedBox(
                                width: barcodeSize,
                                child: Text('Barcode $index'),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: actionSize,
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
                                      editRow(index);
                                    } else if (value == 'delete') {
                                      deleteRow(index);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
