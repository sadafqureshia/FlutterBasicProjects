import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter list view example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  List todoList = <Map<String, dynamic>>[];

  void _addTodoItem(String title, String? description) {
    setState(() {
      todoList.add({
        'title': title,
        'description': description,
        'isChecked': false,
      });
    });
  }

  void _deleteItem(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void _changeIsCompleted(index, value) {
    setState(() {
      todoList[index]["isChecked"] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo Application",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            Map item = todoList[index];
            return ListTile(
              leading: Checkbox(
                  value: item["isChecked"],
                  onChanged: (bool? newValue) {
                    _changeIsCompleted(index, newValue);
                  }),
              title: Text(item["title"]),
              subtitle: item["description"] != null
                  ? Text(item["description"])
                  : null,
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  _deleteItem(index);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return TodoAdd(onAdd: _addTodoItem);
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoAdd extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final Function(String, String) onAdd;

  TodoAdd({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Title*'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  onAdd(titleController.text, descriptionController.text);
                  Navigator.of(context).pop();
                },
                child: const Text("Add Todo"))
          ],
    ));
  }
}
