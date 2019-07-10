import 'package:flutter/material.dart';
import 'package:gank/net/HttpRequest.dart';
import 'package:gank/bean/GanHo.dart';
import 'package:gank/bean/Wan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'gank'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int page = 1;
  String url;
  List<BingInfo> bingList = new List();

  void _incrementCounter() {
//    getHappy((ganHo) {
//      initBing(ganHo.happyList);
//    }, page);

    getArticle((wan) {
      initWan(wan.data.datas);
    }, page);
  }

  void initBing(List<Happy> happyList) {
    if (page == 1) bingList.clear();
    page++;
    for (Happy happy in happyList) {
      BingInfo info =
          BingInfo(happy.url, happy.desc, happy.createdAt, happy.who, happy.id);
      bingList.add(info);
    }
    setState(() {});
  }

  void initWan(List<Article> articleList) {
    if (page == 1) bingList.clear();
    page++;
    for (Article article in articleList) {
      BingInfo info = BingInfo(article.envelopePic, article.niceDate,
          article.desc, article.author, null);
      bingList.add(info);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return bingList[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return new Container(height: 1.0, color: Colors.grey[200]);
          },
          itemCount: bingList.length),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '请求',
        backgroundColor: Colors.amberAccent,
        child: Icon(
          Icons.cloud_download,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

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
