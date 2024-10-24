import 'package:bloc_images/presentation/widgets/buttons.dart';
import 'package:bloc_images/presentation/widgets/list_users.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const Buttons(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: const Text(
          'S H O W  I M A G E S',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Expanded(
            child: ListUsers(),
          ),
        ],
      ),
    );
  }
}
