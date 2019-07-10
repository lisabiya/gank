import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BingInfo extends StatelessWidget {
  final imagePath;
  final text1;
  final text2;
  final text3;
  final text4;

  BingInfo(this.imagePath, this.text1, this.text2, this.text3, this.text4);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment(-0.97, 0.97),
            children: <Widget>[
              Card(
                child: Image.network(imagePath),
              ),
              Positioned(
                top: 8.0,
                left: 8.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(60),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      text1,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(200),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 100.0, top: 4.0, bottom: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          text2,
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 16.0),
                        ),
                        Text(
                          text3,
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text4 == null ? "添加" : text4,
                style: TextStyle(color: Colors.black54, fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
