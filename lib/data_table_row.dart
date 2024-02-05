import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workspace/notifier.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: Colors.deepPurpleAccent,
    child: Column(
      children: [
        IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.back_hand)),
        Consumer<Notifier>(
          builder: (context,notifier,child) {
            return IconButton(onPressed: (){notifier.increment();}, icon: const Icon(Icons.add));
          }
        )
      ],
    ),);
  }
}
