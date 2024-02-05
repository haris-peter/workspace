import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workspace/notifier.dart';


class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: Colors.deepPurpleAccent,
    child: Column(
      children: [
        IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.back_hand)),
        Consumer<Notifier>(
          builder: (context,notifier,child) {
            return IconButton(onPressed: (){notifier.delete();}, icon: const Icon(Icons.add));
          }
        )
      ],
    ),);
  }
}