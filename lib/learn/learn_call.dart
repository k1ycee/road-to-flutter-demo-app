import 'dart:convert';

import 'package:road_to_flutter_demo/learn/learn_model.dart';
import 'package:http/http.dart' as http;

class RatesProvider{
  String url = 'http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=0033eec1ce834b8f93dbd041496980c9';

  Future<Rates> getRates() async{
    final call = await http.get(url);
    print(call.toString());
    if (call.statusCode == 200){
      return Rates.fromJson(jsonDecode(call.body));
    }
    else {
      return null;
    }
  }
}