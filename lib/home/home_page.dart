import 'package:flutter/material.dart';
import 'package:marvelapp/home/book_net_controller.dart';
import 'package:marvelapp/resources/strings.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  String title = HomePage.home_page_title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List items = [];

  void initState() {
    super.initState();
    fetchBooks().then((bookList) {
      setState(() {
        items = bookList;
      });
    });
  }

  Widget getBody() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, position) {
        return ListTile(title: Text(items[position].listName));
      }
    );
  }

  Widget getItem(int position) {
    return Row(
      children: <Widget>[
        Text(items[position].listName)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(HomePage.home_page_title)
      ),
      body: getBody()
    );
  }
}


