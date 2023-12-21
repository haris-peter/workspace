import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Row
              Row(
                children: [
                  Checkbox(
                    value: selectAll,
                    onChanged: (value) => toggleSelectAll(),
                  ),
                  const SizedBox(width: 20),
                  const SizedBox(
                    width: 60, // Set your desired width
                    child: Text('Image'),
                  ),
                  
                  const SizedBox(
                    width: 100, // Set your desired width
                    child: Text('Name'),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    width: 100, // Set your desired width
                    child: Text('Supplier'),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    width: 100, // Set your desired width
                    child: Text('Brand'),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    width: 100, // Set your desired width
                    child: Text('Barcode'),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    width: 100, // Set your desired width
                    child: Text('Action'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Second Row (ListView)
              SizedBox(
                height: 300, // Set your desired height
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: selectedRows[index] ? Colors.blue.withOpacity(0.3) : null,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: selectedRows[index],
                            onChanged: (value) {
                              setState(() {
                                selectedRows[index] = value!;
                              });
                            },
                          ),
                          const SizedBox(width: 20),
                          Container(
                              alignment: Alignment.centerLeft,
                              width: 60, 
                              // Set your desired width
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage: AssetImage('assets/luffyf.png'),
                              ),
                          ),
                          
                          SizedBox(
                            width: 100, // Set your desired width
                            child: Text('Name $index'),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 100, // Set your desired width
                            child: Text('Supplier $index'),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 100, // Set your desired width
                            child: Text('Brand $index'),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 100, // Set your desired width
                            child: Text('Barcode $index'),
                          ),
                          const SizedBox(width: 10),
                          Container(
                              alignment: Alignment.centerLeft,
                              width: 100, // Set your desired width
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
