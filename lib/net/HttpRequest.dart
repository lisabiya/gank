import 'package:dio/dio.dart';
import 'package:gank/bean/GanHo.dart';

BaseOptions options = BaseOptions(
  baseUrl: "https://www.sojson.com/open/api/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

typedef OnHttpCallBack<T>(T message);

getHappy(OnHttpCallBack<Ganho> onMessage, int page) async {
  var dio = Dio();
  try {
    Response response = await dio.get("http://gank.io/api/data/福利/5/$page");
    bool state = response.data['error'];

    if (!state) {
      Ganho ganHo = Ganho.fromJson(response.data);
      onMessage(ganHo);
    }
  } catch (e) {
    print("response" + e);
  }
}
