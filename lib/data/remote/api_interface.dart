abstract class ApiInterface {
  static const baseUrl = "https://reqres.in/api/";

  Future<dynamic>? getUsers();
}
