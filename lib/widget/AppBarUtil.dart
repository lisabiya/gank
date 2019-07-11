import 'package:flutter/material.dart';
import 'package:gank/route/Router.dart';

typedef onChangeTitle(bool change);

AppBar getAppBar(BuildContext context, String mTitle, onChangeTitle onchange) {
  return AppBar(
    title: Center(child: Text(mTitle)),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Icons.home, color: Colors.white),
      onPressed: () {
        Router.goPage(context, Router.home);
      },
    ),
    actions: <Widget>[SwitchDemo(false, onchange)],
  );
}

class SwitchDemo extends StatefulWidget {
  bool check = false;
  onChangeTitle onChange;

  SwitchDemo(this.check, this.onChange);

  _Demo createState() => _Demo(check, onChange);
}

class _Demo extends State<SwitchDemo> {
  bool check = false;
  onChangeTitle onChange;

  _Demo(this.check, this.onChange);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: this.check,
      onChanged: (bool val) {
        onChange(val);
        this.setState(() {
          this.check = !this.check;
        });
      },
    );
  }
}

void showDialogs(BuildContext context, String content) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SizedBox(
            height: 100,
            child: Card(
              color: Colors.white,
              child: Center(
                child: Text(
                  content,
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                ),
              ),
            ),
          ),
        );
      });
}
