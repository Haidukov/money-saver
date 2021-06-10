import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:money/models/MonoPersonalInfo.dart';

Future<MonoPersonalInfo> getPersonalInfo(String token) async {
  return http
      .get(Uri.https('api.monobank.ua', '/personal/client-info'), headers: {
    'X-Token': token
  }).then((response) => MonoPersonalInfo.fromJson(jsonDecode(response.body)));
}
