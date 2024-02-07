import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workspace/notifier.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<Notifier>().delete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.deepPurpleAccent,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back), // Corrected the back icon
          ),
        ],
      ),
    );
  }
}
