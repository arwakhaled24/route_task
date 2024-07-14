
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../model/product_respond.dart';
@singleton
class ApiManager {
  static const String baseURl = 'dummyjson.com';
  static const String productsEndPoint = 'products';

 Future<ProductRespond?> getProducts() async {
    var url = Uri.https(baseURl, productsEndPoint);
    try {
      var response = await http.get(url);
      if(response.statusCode == 200) {
      var body=  response.body;
      var json = jsonDecode(body);
      var products = ProductRespond.fromJson(json);
        return products;
      }
    }
     catch (e) {
      throw Exception('Failed to load data!!!!');
    }


  }


}