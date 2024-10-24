import 'dart:convert';
import 'dart:developer';

import 'package:bloc_images/domain/models/user.dart';
import 'package:http/http.dart' as http;

class UserApiRepository {
  final url = Uri.parse('http://jsonplaceholder.typicode.com/photos');

  Future<List<User>> getData() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> listOfAllData = json.decode(response.body);
      final list = listOfAllData.map((json) => User.fromJson(json)).toList();

      return list;
    } else {
      log(response.reasonPhrase.toString());
      throw Exception(response.reasonPhrase);
    }
  }
}
