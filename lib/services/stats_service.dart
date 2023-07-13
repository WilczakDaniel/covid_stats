import 'dart:convert';

import 'package:covid/model/worldstats_model.dart';
import 'package:covid/services/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatsModel> fetchWorldStatsRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatsApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return WorldStatsModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('Error');
    }
  }
}
