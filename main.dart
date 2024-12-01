import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '213234'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _clothes = [
    "Dress",
    "Shirt",
    "Jeans"
  ];
  String _editingClothes = "";

  void _addClothes() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newClothes = "";
        return AlertDialog(
          titleTextStyle: TextStyle(color: Colors.blue, fontSize: 18),
          title: Text("Add clothes"),
          content: TextField(
            onChanged: (value) {
              newClothes = value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _clothes.add(newClothes);
                  Navigator.pop(context);
                });
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

  void _editClothes(int index) {
    _editingClothes = _clothes[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String editedClothes = _editingClothes;
        return AlertDialog(
          titleTextStyle: TextStyle(color: Colors.blue, fontSize: 18),
          title: Text("Edit clothes"),
          content: TextField(
            onChanged: (value) {
              editedClothes = value;
            },
            controller: TextEditingController(text: _editingClothes),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _clothes[index] = editedClothes;
                  Navigator.pop(context);
                });
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _clothes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                _clothes[index],
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _editClothes(index);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green)
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_rounded),
                    onPressed: () {
                      setState(() {
                        _clothes.removeAt(index);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addClothes,
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
