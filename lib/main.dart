import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAutobiographyApp(),
    );
  }
}

class MyAutobiographyApp extends StatefulWidget {
  @override
  _MyAutobiographyAppState createState() => _MyAutobiographyAppState();
}

class _MyAutobiographyAppState extends State<MyAutobiographyApp> {
  List<String> autobiographyList = [
    "I am passionate about programming.",
    "I have experience in mobile app development.",
    "I enjoy learning new technologies.",
  ];

  TextEditingController editingController = TextEditingController();
  int selectedIndex = -1;

  String name = "許益嘉";
  String studentID = "C110151149";

  void addAutobiography(String newAutobiography) {
    setState(() {
      autobiographyList.add(newAutobiography);
    });
  }

  void deleteAutobiography(int index) {
    setState(() {
      autobiographyList.removeAt(index);
      selectedIndex = -1;
    });
  }

  void editAutobiography(int index, String editedAutobiography) {
    setState(() {
      autobiographyList[index] = editedAutobiography;
      selectedIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autobiography - $name - $studentID'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: autobiographyList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(autobiographyList[index]),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      editingController.text = autobiographyList[index];
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: editingController,
              decoration: InputDecoration(labelText: 'Edit Autobiography'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  addAutobiography(editingController.text);
                  editingController.clear();
                },
                child: Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedIndex != -1) {
                    deleteAutobiography(selectedIndex);
                  }
                },
                child: Text('Delete'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedIndex != -1) {
                    editAutobiography(selectedIndex, editingController.text);
                    editingController.clear();
                  }
                },
                child: Text('Edit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}