import 'dart:convert';

import 'package:flutter_clean_arch_flutterando/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String img;
  final String title;
  final String content;

  ResultSearchModel({this.img, this.title, this.content});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'img': img,
    };
  }

  static ResultSearchModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultSearchModel(
      title: map['title'],
      content: map['content'],
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  static ResultSearchModel fromJson(String source) =>
      fromMap(json.decode(source));
}
