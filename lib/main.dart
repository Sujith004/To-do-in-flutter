import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String displaytext = "NoText data";
  TextEditingController textcontroller = TextEditingController();
  List<String> tasklist=[
    
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TO-DO List'),
          backgroundColor: const Color.fromARGB(255, 255, 196, 0),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: textcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Enter a task")),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.white54,
                  height: 40,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    setState(() {
                     
                      tasklist.add(textcontroller.text);
                      textcontroller.clear();
                    });
                  },
                  child: Text("Add"),
                ),
              ],
            ),
            
            Flexible(
              child: ListView.builder(itemCount:tasklist.length,itemBuilder: (context, index) {
               return Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(tasklist[index]),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        tasklist.removeAt(index);
                      });
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              );
              }),
            )
          ],
        ),
      ),
    );
  }
}
