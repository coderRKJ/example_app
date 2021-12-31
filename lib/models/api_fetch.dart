import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchApiData() async {
  const url =
      "https://raw.githubusercontent.com/coderRKJ/SavedModels/main/test_JSON_data.json";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode != 200) {
    return null;
  }

  Map<String, dynamic> jsonData = json.decode(response.body);

  return RowDataList.fromList(jsonData["rows"]);
}

/*
{"reviewerID":"A94QU4C90B1AX",
"asin":"1384719342",
"reviewerName":"SEAN MASLANKA",
"helpful":[0,0],
"reviewText":"This pop filter is great. It looks and performs like a studio filter. If you're recording vocals this will eliminate the pops that gets recorded when you sing.",
"overall":5.0,
"summary":"No more pops when I record my vocals.",
"unixReviewTime":1392940800,
"reviewTime":"02 21, 2014"}
*/
class RowData {
  final String? reviewerName;
  final List<dynamic>? helpful;
  final String? reviewText;
  final double? overall;
  final String? summary;

  RowData(
      {this.reviewerName,
      this.helpful,
      this.reviewText,
      this.overall,
      this.summary});

  factory RowData.fromJson(Map<String, dynamic> json) {
    return RowData(
      reviewerName: json["reviewerName"] as String?,
      helpful: json["helpful"] as List<dynamic>?,
      reviewText: json["reviewText"] as String?,
      overall: json["overall"] as double?,
      summary: json["summary"] as String?,
    );
  }
}

class RowDataList {
  List<RowData> rowDataList;

  RowDataList({required this.rowDataList});

  factory RowDataList.fromList(List apiData) {
    return RowDataList(
        rowDataList: apiData.map((e) => RowData.fromJson(e)).toList());
  }
}
