// import 'package:bazar/features/home/presentation/widgets/authors_widget.dart';
// import 'package:bazar/features/home/presentation/widgets/best_vendors_widget.dart';
// import 'package:bazar/features/home/presentation/widgets/weekly_top.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Home"),
//         leading: Icon(CupertinoIcons.search),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10.0),
//             child: Badge(
//               backgroundColor: Colors.red,
//               label: Text("3"),
//               child: Icon(CupertinoIcons.bell),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Special Offers Box
//             Container(height: 150, width: 327, color: Colors.black),
//             SizedBox(height: 27),

//             // Top of the week
//             TopOfTheWeek(),
//             SizedBox(height: 32),

//             //Best Vendors
//             BestVendors(),

//             SizedBox(height: 32),
//             //Authors
//             AuthorsWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:bazar/features/home/presentation/widgets/authors_widget.dart';
import 'package:bazar/features/home/presentation/widgets/best_vendors_widget.dart';
import 'package:bazar/features/home/presentation/widgets/weekly_top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        // AppBar (sliver-based so it integrates with scroll)
        SliverAppBar(
          floating: true,
          snap: true,
          centerTitle: true,
          title: const Text("Home"),
          leading: const Icon(CupertinoIcons.search),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Badge(
                backgroundColor: Colors.red,
                label: const Text("3"),
                child: const Icon(CupertinoIcons.bell),
              ),
            ),
          ],
        ),

        // Main content
        SliverToBoxAdapter(
          child: Column(
            children: [
              // Special Offers Box
              const SizedBox(height: 16),
              const _SpecialOfferBox(),
              const SizedBox(height: 27),

              // Top of the week
              TopOfTheWeek(),
              const SizedBox(height: 32),

              // Best Vendors
              const BestVendors(),
              const SizedBox(height: 32),

              // Authors
              AuthorsWidget(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }
}

class _SpecialOfferBox extends StatelessWidget {
  const _SpecialOfferBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 327,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: const Text(
        "Special Offer",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

