import 'dart:convert';

import 'package:e_book/utils/constants.dart';
import 'package:e_book/widgets/book_item.dart';
import 'package:e_book/widgets/custom_app_bar.dart';
import 'package:e_book/widgets/custom_tab.dart';
import 'package:e_book/widgets/scrollable_images.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List _popularBooks = [];
  List _books = [];
  late ScrollController _scrollController;
  late TabController _tabController;

  void _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/json/popular_books.json')
        .then((value) {
      setState(() {
        _popularBooks = json.decode(value);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString('assets/json/books.json')
        .then((value) {
      setState(() {
        _books = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    _readData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: const Text(
                'Popular Books',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ScrollableImages(popularBooks: _popularBooks),
            Expanded(
              child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: sliverBackgroundColor,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(50),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20, left: 10),
                        child: TabBar(
                          controller: _tabController,
                          isScrollable: true,
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 7,
                              ),
                            ],
                          ),
                          tabs: const [
                            CustomTab(
                              label: 'New',
                              backgroundColor: menu1Color,
                            ),
                            CustomTab(
                              label: 'Popular',
                              backgroundColor: menu2Color,
                            ),
                            CustomTab(
                              label: 'Trending',
                              backgroundColor: menu3Color,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _books.length,
                      itemBuilder: (context, index) => BookItem(
                        books: _books,
                        index: index,
                      ),
                    ),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
