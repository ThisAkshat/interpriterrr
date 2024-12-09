import 'package:flutter/material.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';

class MyAccountsPage extends StatelessWidget implements NavigationStates {
  const MyAccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the sidebar
          },
        ),
        title: const Text(
          'Reviews',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: const Text(
          "Reviews",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 28,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
