import 'package:flutter/material.dart';
import 'package:khetipoint_assignment/services/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khetipoint_assignment/services/item_fetcher.dart';
import 'package:khetipoint_assignment/services/item_model.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class ExploreScreen extends StatefulWidget {
  static const String id = 'ExploreScreen';
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  bool showSpinner = false;
  ItemFetcher _itemFetcher = ItemFetcher();
  List<Item> allItems;

  Future<Null> refreshList() async {
    await fetchItemList();
    return null;
  }

  fetchItemList() async {
    setState(() {
      showSpinner = true;
    });
    await _itemFetcher.fetchAllItems();
    allItems = _itemFetcher.items;
    setState(() {
      showSpinner = false;
    });
  }

  @override
  void initState() {
    setState(() {
      showSpinner = true;
    });
    //The meeting data gets populated here in the data variable
    fetchItemList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Trending'),
        ),
        body: Container(
          height: 300,
          child: showSpinner
              ? Container(
                  child: Center(
                    child: SpinKitWave(
                      color: Colors.grey[350],
                      size: 50.0,
                    ),
                  ),
                )
              //This is the List builder for meetings

              : RefreshIndicator(
                  onRefresh: refreshList,
                  child: ListView.builder(
                    itemCount: allItems == null ? 0 : allItems.length,
                    itemBuilder: (context, index) {
                      return Container(child: Text(allItems[index].name));
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
