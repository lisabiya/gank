import 'dart:convert' show json;

class Ganho {
  bool error;
  List<Happy> happyList;

  Ganho.fromParams({this.error, this.happyList});

  factory Ganho(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Ganho.fromJson(json.decode(jsonStr))
          : new Ganho.fromJson(jsonStr);

  Ganho.fromJson(jsonRes) {
    error = jsonRes['error'];
    happyList = jsonRes['results'] == null ? null : [];

    for (var resultsItem in happyList == null ? [] : jsonRes['results']) {
      happyList
          .add(resultsItem == null ? null : new Happy.fromJson(resultsItem));
    }
  }

  @override
  String toString() {
    return '{"error": $error,"results": $happyList}';
  }
}

class Happy {
  bool used;
  String id;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  String who;

  Happy.fromParams(
      {this.used,
      this.id,
      this.createdAt,
      this.desc,
      this.publishedAt,
      this.source,
      this.type,
      this.url,
      this.who});

  Happy.fromJson(jsonRes) {
    used = jsonRes['used'];
    id = jsonRes['_id'];
    createdAt = jsonRes['createdAt'];
    desc = jsonRes['desc'];
    publishedAt = jsonRes['publishedAt'];
    source = jsonRes['source'];
    type = jsonRes['type'];
    url = jsonRes['url'];
    who = jsonRes['who'];
  }

  @override
  String toString() {
    return '{"used": $used,"_id": ${id != null ? '${json.encode(id)}' : 'null'},"createdAt": ${createdAt != null ? '${json.encode(createdAt)}' : 'null'},"desc": ${desc != null ? '${json.encode(desc)}' : 'null'},"publishedAt": ${publishedAt != null ? '${json.encode(publishedAt)}' : 'null'},"source": ${source != null ? '${json.encode(source)}' : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'},"url": ${url != null ? '${json.encode(url)}' : 'null'},"who": ${who != null ? '${json.encode(who)}' : 'null'}}';
  }
}
