import 'package:dio/dio.dart';

import '../../models/user_model.dart';

class UserService {
  Dio dio = Dio();

  static const baseUrl = 'https://reqres.in/api/users';

  Future<UserModel> fetchListUser() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }

  Future<Datum> fetchDetailUser(int id) async {
    try {
      final response = await dio.get('$baseUrl/$id');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Datum.fromJson(response.data['data']);
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
