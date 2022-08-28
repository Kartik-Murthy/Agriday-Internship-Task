import 'dart:convert';

import 'package:demo/data_modal.dart';
import 'package:demo/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Item>> futureitems;
  bool isLoaded = false;
  List<Item> allItems = [];
  List<Item> displayItemList = [];
  bool isTapped = false;

  String query = '';
  @override
  void initState() {
    futureitems = getItems(context);
    getItemList();

    super.initState();
  }

  Future<List<Item>> getItems(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/json/Fruits.json');

    final body = json.decode(data);

    return body.map<Item>(Item.fromJson).toList();
  }

  void getItemList() async {
    displayItemList = allItems = await futureitems;

    setState(() {
      isLoaded = true;
    });
  }

  void searchItem(String query) {
    final itemlist = allItems.where((element) {
      final titleLower = element.product.toLowerCase();
      final searchLower = query.toLowerCase();
      print(titleLower);
      print(query);
      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      displayItemList = itemlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? Scaffold(
            backgroundColor: Color(0XFFEDEDED),
            body: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SearchWidget(
                          text: query,
                          onChanged: searchItem,
                          hintText: 'Search'),
                    ),
                    sortWidget(context, displayItemList, setState, isTapped)
                  ],
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      HorizontalList(itemList: displayItemList),
                      VerticalList(itemList: displayItemList)
                    ],
                  ),
                )
              ],
            ),
          )
        : const Scaffold(
            body: Center(child: Text("hfvhv")),
          );
  }
}

Widget sortWidget(BuildContext context, List<Item> itemList,
    void Function(void Function()) setState, bool isTapped) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      IconButton(
          padding: const EdgeInsets.fromLTRB(0, 40, 18, 0),
          iconSize: 32,
          color: Color(0xff000000),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setState2) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * .30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Name',
                                  style: GoogleFonts.mukta(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000)),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      itemList.sort(((a, b) =>
                                          a.product.compareTo(b.product)));
                                    });
                                  },
                                  color: isTapped
                                      ? Color(0xff219653)
                                      : Color(0xff000000),
                                  icon: const Icon(
                                    Icons.arrow_upward,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        itemList.sort(((a, b) =>
                                            b.product.compareTo(a.product)));
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_downward,
                                    ))
                              ],
                            ),
                            Container(
                              color: Color(0xffC4C4C4),
                              height: 1,
                              width: MediaQuery.of(context).size.width * .7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Price',
                                  style: GoogleFonts.mukta(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000)),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      itemList.sort(((a, b) =>
                                          a.price.compareTo(b.price)));
                                    });
                                  },
                                  icon: const Icon(Icons.arrow_upward),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        itemList.sort(((a, b) =>
                                            b.price.compareTo(a.price)));
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_downward,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                });
          },
          icon: const Icon(
            Icons.sort,
          )),
      const Text(
        'sort',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16),
      )
    ],
  );
}

class HorizontalList extends StatelessWidget {
  final List<Item> itemList;
  const HorizontalList({Key? key, required this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.horizontal,
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            final item = itemList[index];

            return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/${item.product}.png",
                        fit: BoxFit.contain,
                        scale: .6,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 108,
                            width: 100,
                            color: Colors.white,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(item.product,
                            style: GoogleFonts.inter(
                                color: Color(0xff000000),
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                      )
                    ],
                  ),
                ));
          },
        ));
  }
}

class VerticalList extends StatelessWidget {
  final List<Item> itemList;
  const VerticalList({Key? key, required this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: itemList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = itemList[index];

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/enquiry', arguments: item);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    color: Color(0xffFFFFFF),
                    height: MediaQuery.of(context).size.height * .07,
                    width: MediaQuery.of(context).size.width * .95,
                    child: Text(
                      item.seller,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Color(0xff4F4F4F),
                          fontWeight: FontWeight.w400),
                    )),
                Container(
                  color: Color(0xffF4F4DD),
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.product,
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4F4F4F))),
                          Text("Product",
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.variety,
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4F4F4F))),
                          Text("Variety",
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)))
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color.fromRGBO(33, 33, 33, 0.08)),
                          height: 21,
                          width: 73,
                          child: Center(
                            child: Text("₹ ${item.price}",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff27AE60))),
                          ))
                    ],
                  ),
                ),
                Container(
                  color: Color(0xffF4F4DD),
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.avgWeight.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000))),
                          Text("Avg Weight",
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.perBox.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000))),
                          Text("Per Box",
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.boxes.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000))),
                          Text("Boxes",
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.delivery,
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000))),
                          Text("Delivery",
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
