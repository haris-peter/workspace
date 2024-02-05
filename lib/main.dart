
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workspace/data_table_row.dart';
import 'package:workspace/model.dart';
import 'package:workspace/notifier.dart';

void main() => runApp(
ChangeNotifierProvider(create: (context)=>Notifier(),
child: const MyApp(),
)  );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home:  HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Notifier>(
      builder: (context, value, child) {
        return SafeArea(
          child: Center(
            child: Container(
              color: Colors.blueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "When you press the button, the value increments",
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    value.count.toString(),
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      final counter = context.read<Notifier>();
                      counter.increment();
                    },
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_circle_right),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ThirdScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_circle_right),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}