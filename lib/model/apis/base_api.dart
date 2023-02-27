// Describing structure of API class and functions
abstract class BaseApi {
  //main URL
  final String baseUrl = "https://api.github.com/orgs/square/repos";

  //GET DATA FUNC
  Future<dynamic> fetchData();
}
