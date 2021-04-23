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
  List<bool> isCollapsed = [];
  bool networkError = true;
  int errorCode;

  void fillBoolean(int count) {
    for (int i = 0; i < count; i++) {
      isCollapsed.add(true);
    }
  }

  Future<Null> refreshList() async {
    await fetchItemList();
    return null;
  }

  fetchItemList() async {
    setState(() {
      showSpinner = true;
    });
    try {
      int responseCode = await _itemFetcher.fetchAllItems();
      if (responseCode == 200) {
        allItems = _itemFetcher.items;
        fillBoolean(allItems.length);
        setState(() {
          networkError = false;
          showSpinner = false;
        });
      } else {
        //Something went wrong.
        setState(() {
          showSpinner = false;
          errorCode = responseCode;
          networkError = true;
        });
      }
    } catch (e) {
      setState(() {
        showSpinner = false;
        errorCode = 400;
        networkError = true;
        print(e.toString());
      });
    }
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
    double cwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black54),
          title: Text(
            'Trending',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Color.fromARGB(255, 250, 250, 250),
        ),
        body: Container(
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

              : networkError
                  ? Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                              image: AssetImage(
                                  'illustration/nointernet_connection.png'),
                              width: 350,
                            ),
                            Text(
                              'Something Went Wrong',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            Text(
                              'Error Code: $errorCode',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 20),
                            ),
                            FlatButton(
                              onPressed: refreshList,
                              child: Container(
                                  height: 50,
                                  width: 300,
                                  color: Colors.green,
                                  child: Center(
                                      child: Text(
                                    'Retry',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ))),
                            ),
                          ],
                        ),
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: refreshList,
                      child: ListView.builder(
                        itemCount: allItems == null ? 0 : allItems.length,
                        itemBuilder: (context, index) {
                          return isCollapsed[index]
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isCollapsed[index] = !isCollapsed[index];
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                          width: cwidth,
                                          height: 80,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 15),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    allItems[index].avatar),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    allItems[index].author,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    allItems[index].name,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                      Divider(
                                        height: 5,
                                        thickness: 1,
                                      ),
                                    ],
                                  ))
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isCollapsed[index] = !isCollapsed[index];
                                    });
                                  },
                                  child: Container(
                                    width: cwidth,
                                    child: Column(
                                      children: [
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 15),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      allItems[index].avatar),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      allItems[index].author,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                    Text(
                                                      allItems[index].name,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black87,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Container(
                                                      width: 300,
                                                      child: Text(
                                                        allItems[index]
                                                            .description,
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black54,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 4,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    //Row for the color circles
                                                    Row(
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .circle,
                                                          size: 20,
                                                          color: Colors.red,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(allItems[index]
                                                            .language),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons.star,
                                                          color: Colors.yellow,
                                                          size: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(allItems[index]
                                                            .stars
                                                            .toString()),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .github,
                                                          color: Colors.black54,
                                                          size: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(allItems[index]
                                                            .forks
                                                            .toString())
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Divider(
                                          height: 5,
                                          thickness: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                        },
                      ),
                    ),
        ),
      ),
    );
  }
}
