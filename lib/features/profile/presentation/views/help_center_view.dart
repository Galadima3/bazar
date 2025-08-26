import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HelpCenterView extends ConsumerStatefulWidget {
  const HelpCenterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HelpCenterViewState();
}

class _HelpCenterViewState extends ConsumerState<HelpCenterView> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Help Center"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(CupertinoIcons.chat_bubble_2) ,),
    );
  }
}