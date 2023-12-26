import 'package:flutter/material.dart';
import 'header_row.dart';
import 'data_row.dart'; // Import the MyDataRow class

void main() {
  runApp(const MyApp());
}

const double containerHeight = 50;

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

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
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> selectedRows = List.generate(10, (index) => false);
  bool selectAll = false;

  void toggleSelectAll(bool? value) {
    setState(() {
      selectAll = value ?? false;
      selectedRows = List.generate(selectedRows.length, (index) => selectAll);
    });
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
              HeaderRow(
                selectAll: selectAll,
                toggleSelectAll: toggleSelectAll,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return MyDataRow(
                        selected: selectedRows[index],
                        onChanged: (value) {
                          setState(() {
                            selectedRows[index] = value ?? false;
                          });
                        },
                        index: index,
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
