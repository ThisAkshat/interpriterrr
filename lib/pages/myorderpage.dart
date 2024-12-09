import 'package:flutter/material.dart';
import 'package:interpriter/bloc.navigation_bloc/navigation_bloc.dart';

class MyOrderPage extends StatelessWidget implements NavigationStates {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: const Text(
          'Select Language',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: const Text(
            "Select Language",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
          ),
        ),
      ),
    );
  }
}
