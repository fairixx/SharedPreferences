import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/item_provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'List of Item',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ItemProvider>(
                builder: (context, provider, child) {
                  if (provider.items.isEmpty) {
                    return const Center(
                      child: Text('Empty'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: provider.items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          color: Colors.pink,
                          child: ListTile(
                            title: Text(
                              provider.items[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            trailing: InkWell(
                              onTap: () {
                                provider.deleteItem(index);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Add Item',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23),
                          borderSide: const BorderSide(
                            color: Colors.pink,
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23),
                          borderSide: const BorderSide(
                            color: Colors.pinkAccent,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        Provider.of<ItemProvider>(context, listen: false)
                            .addItem(_controller.text);
                        _controller.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
