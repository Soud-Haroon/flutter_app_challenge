import 'package:flutter_app_challenge/model/apis/main_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //Unit testing API for Data correction
  test("Testing API Response", () async {
    //step 1
    MainAppFetch mainAppFetch = MainAppFetch();
    //step 2
    List<dynamic> list = await mainAppFetch.fetchData();
    //step 3
    expect(list[0]["id"], 274562);
  });
}
