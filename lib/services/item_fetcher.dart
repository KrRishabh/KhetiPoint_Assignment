import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:khetipoint_assignment/services/item_model.dart';
import 'dart:convert';

class ItemFetcher {
  List<Item> _allItems = <Item>[];
  String apiUrl =
      'https://private-anon-764531e222-githubtrendingapi.apiary-mock.com/repositories';

  Future<int> fetchAllItems() async {
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List;
      // iterate over the list and map each object in list to Img by calling Img.fromJson
      _allItems = list.map((i) => Item.fromJson(i)).toList();
    } else {
      print('Came into Else on Item provider');
    }
    return response.statusCode;
  }

  List<Item> get items {
    return [..._allItems];
  }
}
