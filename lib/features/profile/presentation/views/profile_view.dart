import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("Profile"), centerTitle: true),
      body: Column(
        children: [
          Container(
            height: 88,
            width: 375,
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey.shade500),
            ),
            child: Row(
              children: [
                SizedBox(width: 3.5),

                //Circle Avatar
                CircleAvatar(radius: 30),
                SizedBox(width: 12.5),

                // Name & Phone Number
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("John Doe", style: textTheme.headlineSmall),
                    Text(
                      "(+1) 234 567 890",
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 95),

                // Logout Text
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Logout",
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          ProfileTile(
            icon: Icons.person,
            label: "My Account",
            onPressed: () => context.push(RoutePaths.myAccount),
          ),

          ProfileTile(
            icon: CupertinoIcons.location_solid,
            label: "Address",
            onPressed: () => context.push(RoutePaths.address),
          ),

          ProfileTile(
            icon: CupertinoIcons.gift_fill,
            label: "Offers & Promos",
            onPressed: () {},
          ),

          ProfileTile(
            icon: CupertinoIcons.heart_fill,
            label: "Your favourites",
            onPressed: () => context.push(RoutePaths.favourites),
          ),

          ProfileTile(
            icon: Icons.note_add_sharp,
            label: "Order History",
            onPressed: () => context.push(RoutePaths.orderHistory),
          ),

          ProfileTile(
            icon: CupertinoIcons.chat_bubble_text,
            label: "Help Center",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;
  const ProfileTile({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.grey50,
        ),
        child: Center(child: Icon(icon, color: AppColors.primary500)),
      ),
      title: Text(label),
      trailing: IconButton(
        icon: Icon(CupertinoIcons.forward),
        color: Colors.grey[500],
        onPressed: onPressed,
      ),
    );
  }
}
