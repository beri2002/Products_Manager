import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:products_manager/Item.dart';
import 'package:products_manager/userDialog.dart';

late Box box;
Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyFlutterList(),
      title: 'productsManager',
    );
  }
}

class MyFlutterList extends StatefulWidget {
  const MyFlutterList({super.key});

  @override
  State<MyFlutterList> createState() => _MyFlutterListState();
}

class _MyFlutterListState extends State<MyFlutterList> {
  List<Item> itemList = [];

  @override
  Widget build(BuildContext context) {
    void addUserData(Item item) {
      setState(() {
        itemList.add(item);
      });
    }

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: AddItemDialog(addUserData),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showUserDialog,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("productsManeger"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return Card(
              margin: const EdgeInsets.all(4),
              elevation: 8,
              child: ListTile(
                title: Container(
                  child: Column(
                    children: [
                      Text(
                        itemList[index].itemName,
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        itemList[index].idNumber,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: Text(
                  itemList[index].isSigne,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Container(
                  width: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: IconButton(
                            onPressed: () {
                              showUserDialog();
                            },
                            icon: const Icon(Icons.edit)),
                      ),
                      Expanded(
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                itemList.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          itemCount: itemList.length,
        ),
      ),
    );
  }
}
