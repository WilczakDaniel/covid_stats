import 'dart:convert';

import 'package:covid/model/world_stats_model.dart';
import 'package:covid/services/app_url.dart';
import 'package:http/http.dart' as http;

class StatsService {
  Future<WorldStatsModel> fetchWorldStatsRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatsApi));

    var data = jsonDecode(response.body);

    return WorldStatsModel.fromJson(data);
  }

  Future<List<dynamic>> countriesListApi() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    var data = jsonDecode(response.body);

    return data;
  }
}
