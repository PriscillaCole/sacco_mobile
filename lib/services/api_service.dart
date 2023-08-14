import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'https://sacco.ugnews24.info/api';
  final Dio dio = Dio();
  final String apiUrl;

  ApiService(this.apiUrl);

  Future<void> createUser(Map<String, dynamic> userData) async {
    print(baseUrl + apiUrl);
    try {
      final response = await dio.post(
        baseUrl + apiUrl,
        data: userData,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('User created successfully');
      } else {
        print('User creation failed with status code: ${response.statusCode}');
        print('Response data: ${response.data}');
      }
    } catch (error) {
    // Handle DioException
    // ignore: deprecated_member_use
    if (error is DioError) {
      print('DioError: ${error.message}');
      if (error.response != null) {
        print('Response data: ${error.response?.data}');
      }
    } else {
      // Handle other exceptions
      print('Error creating user: $error');
    }
  }
}

  Future<List<Map<String, dynamic>>> getUsers() async {
    try {
      final response = await dio.get(baseUrl + apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> usersData = response.data;
        return usersData.cast<Map<String, dynamic>>();
      } else {
        print('Failed to fetch users with status code: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching users: $error');
      return [];
    }
  }

  Future<void> updateUser(int userId, Map<String, dynamic> updatedData) async {
    try {
      final response = await dio.put(
        '$baseUrl + $apiUrl/$userId',
        data: updatedData,
      );

      if (response.statusCode == 200) {
        print('User updated successfully');
      } else {
        print('User update failed with status code: ${response.statusCode}');
        print('Response data: ${response.data}');
      }
    } catch (error) {
      print('Error updating user: $error');
    }
  }

  Future<void> deleteUser(int userId) async {
    try {
      final response = await dio.delete('$baseUrl + $apiUrl/$userId');

      if (response.statusCode == 200) {
        print('User deleted successfully');
      } else {
        print('User deletion failed with status code: ${response.statusCode}');
        print('Response data: ${response.data}');
      }
    } catch (error) {
      print('Error deleting user: $error');
    }
  }
}
