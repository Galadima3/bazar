// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class ScaffoldWithNavBar extends StatelessWidget {
//   final StatefulNavigationShell navigationShell;
//   const ScaffoldWithNavBar({super.key, required this.navigationShell});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: navigationShell, // keeps state alive
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: navigationShell.currentIndex,
//         onTap: (index) => navigationShell.goBranch(
//           index,
//           initialLocation: index == navigationShell.currentIndex,
//         ),
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
//           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  void _onItemTapped(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell, // child = the current route content
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart_fill),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
