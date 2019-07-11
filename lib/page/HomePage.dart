import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.brown,
              onPressed: () {
                Navigator.pop(context);
              },
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: new Text(
                '返回',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextField(maxLength: 1,)
          ],
        ),
      ),
    );
  }
}
