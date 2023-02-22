abstract class BaseApi {
  final String baseUrl = "https://api.github.com/orgs/square/repos";

  Future<dynamic> fetchAPIData();
}
