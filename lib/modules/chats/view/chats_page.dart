import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Чаты'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Чат 1'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Создать'),
        onPressed: () {},
      ),
    );
  }
}
