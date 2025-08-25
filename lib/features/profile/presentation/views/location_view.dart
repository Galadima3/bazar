import 'package:bazar/core/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationView extends ConsumerStatefulWidget {
  const LocationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationViewState();
}

class _LocationViewState extends ConsumerState<LocationView> {
  bool _showBottomSheet = false;

  void _toggleBottomSheet() {
    setState(() {
      _showBottomSheet = !_showBottomSheet;
    });
  }

  String selectedOption = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Location"),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Address on Map
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(height: 223, width: 327, color: Colors.black),
              ),
            ],
          ),
          // Persistent Bottom Sheet
          if (_showBottomSheet)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 405,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 16),
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Detail Address',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        GestureDetector(
                          onTap: _toggleBottomSheet,
                          child: Icon(Icons.location_pin, color: AppColors.primary500,),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Location Tile
                    ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grey50,
                        ),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.location,
                            color: AppColors.primary500,
                          ),
                        ),
                      ),

                      title: Text("Utama Street No.20"),
                      subtitle: Text(
                        "state Street No.15, New York 10001, United States",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Save Address As ",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        spacing: 8.0, 
                        children: [
                          ChoiceChip(
                            label: Text("Home"),
                            selected: selectedOption == "Home",
                            onSelected: (bool selected) {
                              setState(() {
                                selectedOption = selected ? "Home" : "";
                              });
                            },
                            selectedColor: Colors.blueAccent,
                          ),
                          ChoiceChip(
                            label: Text("Office"),
                            selected: selectedOption == "Office",
                            onSelected: (bool selected) {
                              setState(() {
                                selectedOption = selected ? "Office" : "";
                              });
                            },
                            selectedColor: Colors.green,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 75),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle confirmation logic here

                          // Close the bottom sheet after confirmation
                          _toggleBottomSheet();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary400,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Confirmation',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),

      floatingActionButton: _showBottomSheet
          ? null
          : FloatingActionButton(
              backgroundColor: AppColors.primary400,
              onPressed: _toggleBottomSheet,
              child: Icon(Icons.location_pin, color: Colors.white),
            ),
    );
  }
}
