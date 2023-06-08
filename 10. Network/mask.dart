import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/mask.dart';

Future<Mask> getMasks(int page, int limit) async {
  final http.Response response = await http.get(
      Uri.parse('http://104.198.248.76:3000/mask?page=$page&limit=$limit'));
  // utf8.decode : 한글깨짐 해결
  final masks = jsonDecode(utf8.decode(response.bodyBytes));

  return Mask.fromJson(masks);
}

void main() async {
  final masks = await getMasks(1, 40);

  // null이 포함된 마스크 정보 개수
  print('null이 포함된 마스크 정보 개수 : ${masks.stores.length}');

  // null 데이터 필터링
  final filterdMasks = masks.stores.where((x) =>
      (x.createdAt != null && x.remainStat != null && x.stockAt != null));

  // null 필터링 후 마스크 정보 개수
  print('null 필터링 후 마스크 정보 개수 : ${filterdMasks.length}');
  filterdMasks.forEach(print);
}
