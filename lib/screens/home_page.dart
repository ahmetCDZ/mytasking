import 'package:flutter/material.dart';
import 'package:mytasking/models/item.dart';
import 'package:mytasking/models/items_data.dart';
import 'package:mytasking/widgets/item_cards.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  final textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(title: Text('Get It Done')),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  '${Provider.of<ItemData>(context).items.length} Tasks',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                      itemCount: Provider.of<ItemData>(context).items.length,
                      itemBuilder: (context, index) => ItemsCard(
                            Provider.of<ItemData>(context).items[index].title,
                            Provider.of<ItemData>(context).items[index].isDone,
                            (_) {
                              Provider.of<ItemData>(context, listen: false)
                                  .toggleStatus(index);
                            },
                          )),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                    child: Column(
                      children: [
                        TextField(
                          controller: textcontroller,
                          onChanged: ((value) {}),
                          style: TextStyle(color: Colors.amber),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Add Item'),
                        ),
                        FlatButton(
                            onPressed: (() {
                              Provider.of<ItemData>(context, listen: false)
                                  .itemAdd(textcontroller.text);
                            }),
                            child: Text('Add'))
                      ],
                    ),
                  ));
        }),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
