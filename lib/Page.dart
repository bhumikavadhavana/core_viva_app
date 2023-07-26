
import 'package:flutter/material.dart';
import 'package:viva_app/Global.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            Global.value = [];
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            Global.value.length,
            (index) => Row(
              children: [
                Text("${index + 1}."),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  Global.value[index],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
