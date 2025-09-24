import 'dart:developer';

import 'package:bazar/features/category/presentation/views/all_category_view.dart';
import 'package:bazar/features/category/presentation/views/novel_category_view.dart';
import 'package:bazar/features/category/presentation/views/romance_category_view.dart';
import 'package:bazar/features/category/presentation/views/science_category_view.dart';
import 'package:bazar/features/category/presentation/views/self_love_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // ignore: unused_field
  int _selectedIndex = 0;
  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      log("Selected Index: ${_tabController.index}");
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
        leading: const Icon(CupertinoIcons.search),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: const Icon(CupertinoIcons.bell),
          ),
        ],
        bottom: TabBar(
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.label,
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          isScrollable: true, // 👈 important
          labelColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Theme.of(context).colorScheme.primary,
          tabs: const [
            Tab(text: "All"),
            Tab(text: "Novels"),
            Tab(text: "Self Love"),
            Tab(text: "Science"),
            Tab(text: "Romance"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          //Center(child: Text("All")),
          AllCategoryView(),
          NovelCategoryView(),
          SelfLoveCategory(),
          ScienceCategoryView(),
          RomanceCategoryView()
        ],
      ),
    );
  }
}
