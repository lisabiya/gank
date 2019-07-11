import 'package:flutter/material.dart';
import 'package:gank/net/HttpRequest.dart';
import 'package:gank/bean/GanHo.dart';
import 'package:gank/bean/Wan.dart';
import 'package:gank/widget/AppBarUtil.dart';
import 'package:gank/widget/BingWidget.dart';

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
      home: MyHomePage(title: '首页'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int page = 1;
  String url;
  List<BingInfo> bingList = new List();
  bool isShow = false;

  void _refreshView() {
    setState(() {});
  }

  void _incrementCounter() {
    if (isShow) {
      getHappy((ganHo) {
        initBing(ganHo.happyList);
      }, page);
    } else {
      getArticle((wan) {
        initWan(wan.data.datas);
      }, page);
    }
  }

  void initBing(List<Happy> happyList) {
    if (page == 1) bingList.clear();
    page++;
    for (Happy happy in happyList) {
      BingInfo info =
          BingInfo(happy.url, happy.desc, happy.createdAt, happy.who, happy.id);
      bingList.add(info);
    }
    _refreshView();
  }

  void initWan(List<Article> articleList) {
    if (page == 1) bingList.clear();
    page++;
    for (Article article in articleList) {
      BingInfo info = BingInfo(article.envelopePic, article.niceDate,
          article.desc, article.author, null);
      bingList.add(info);
    }
    _refreshView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, widget.title, (change) {
        isShow = change;
        showDialogs(context, "播放开心的内容:${isShow ? "开启" : "关闭"}");
        if (!isShow) {
          bingList.clear();
          _refreshView();
        }
      }),

      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return bingList[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return new Container(height: 4.0, color: Colors.white);
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
