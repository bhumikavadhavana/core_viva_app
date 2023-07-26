
import 'package:flutter/material.dart';
import 'package:viva_app/Global.dart';

import 'Page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const ProjectApp(),
        'page': (context) => const Page1(),
      },
    ),
  );
}

class ProjectApp extends StatefulWidget {
  const ProjectApp({Key? key}) : super(key: key);

  @override
  State<ProjectApp> createState() => _ProjectAppState();
}

class _ProjectAppState extends State<ProjectApp> {
  final List<TextEditingController> v=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('page');
             for(int i=0;i<v.length;i++){
               Global.value.add(v[i].text);
             }
            },
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              Global.i,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                   controller: v[index],
                    decoration: InputDecoration(
                      hintText: "Details",
                      prefix: Text("${index + 1}. "),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          v.add(TextEditingController());
          setState(() {
            Global.i++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
