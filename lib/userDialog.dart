import 'package:flutter/material.dart';
import 'package:products_manager/Item.dart';

class AddItemDialog extends StatefulWidget {
  final Function(Item) addItem;

  const AddItemDialog(this.addItem);

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  @override
  Widget build(BuildContext context) {
    Widget buildTextField(String hint, TextEditingController controller) {
      return Container(
        margin: const EdgeInsets.all(4),
        child: TextField(
          decoration: InputDecoration(
              labelText: hint,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.black38,
              ))),
          controller: controller,
        ),
      );
    }

    var itemnameController = TextEditingController();
    var idController = TextEditingController();
    var isSigneController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Add Item",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            buildTextField('Item name', itemnameController),
            buildTextField('Item ID', idController),
            buildTextField('Signe status', isSigneController),
            ElevatedButton(
              onPressed: () {
                final item = Item(idController.text, isSigneController.text,
                    itemnameController.text);
                widget.addItem(item);
                Navigator.of(context).pop();
              },
              child: const Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
