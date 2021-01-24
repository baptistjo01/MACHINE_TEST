import 'package:json_app/dataBase.dart';
import 'package:json_app/db_provider.dart';
import 'package:dio/dio.dart';

class EmployeeApiProvider {
  Future<List<FetchData>> getAllData() async {
    var url = "https://reqres.in/api/users?page=2";
    Response response = await Dio().get(url);

    return (response.data['data'] as List).map((myDb) {
      DBProvider.db.createSQL(FetchData.fromJson(myDb));
    }).toList();
  }
}
