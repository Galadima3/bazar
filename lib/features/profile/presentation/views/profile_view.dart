import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/themes/app_colors.dart';
import 'package:bazar/features/profile/presentation/widgets/profile_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Card
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Enhanced Circle Avatar
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary500.withValues(alpha: 0.2),
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.primary500.withValues(alpha: 0.1),
                      child: Text(
                        'JD',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),

                  // Name & Phone Number
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Doe",
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "(+1) 234 567 890",
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Enhanced Logout Button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Logout",
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Menu Items Container
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ProfileTile(
                    icon: Icons.person_outline,
                    label: "My Account",
                    onPressed: () => context.push(RoutePaths.myAccount),
                    isFirst: true,
                  ),

                  ProfileTile(
                    icon: CupertinoIcons.location,
                    label: "Address",
                    onPressed: () => context.push(RoutePaths.address),
                  ),

                  ProfileTile(
                    icon: CupertinoIcons.gift,
                    label: "Offers & Promos",
                    onPressed: () => context.push(RoutePaths.offersPromo),
                  ),

                  ProfileTile(
                    icon: CupertinoIcons.heart,
                    label: "Your favourites",
                    onPressed: () => context.push(RoutePaths.favourites),
                  ),

                  ProfileTile(
                    icon: CupertinoIcons.time,
                    label: "Order History",
                    onPressed: () => context.push(RoutePaths.orderHistory),
                  ),

                  ProfileTile(
                    icon: CupertinoIcons.chat_bubble_2,
                    label: "Help Center",
                    onPressed: () => context.push(RoutePaths.helpCenter),
                    isLast: true,
                  ),
                ],
              ),
            ),

            SizedBox(height: 32),

    
          ],
        ),
      ),
    );
  }
}

