import 'package:dio/dio.dart';

Future<Map> getData() async {
  var response = await Dio()
      .get("http://api.hgbrasil.com/weather?key=c1c052ee&woeid=456596");

  return response.data;
}
