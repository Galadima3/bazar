import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VendorView extends ConsumerStatefulWidget {
  const VendorView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VendorViewState();
}

class _VendorViewState extends ConsumerState<VendorView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      log("Selected Index: ${_tabController.index}");
    });
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
        surfaceTintColor: Colors.transparent,
        leading: BackButton(),
        title: Text("Vendors"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: const Icon(CupertinoIcons.search),
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
            Tab(text: "Books"),
            Tab(text: "Poems"),
            Tab(text: "Special for you"),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text("All")),
          Center(child: Text("Books")),
          Center(child: Text("Poems")),
          Center(child: Text("Special for you")),
        ],
      ),
    );
  }
}
