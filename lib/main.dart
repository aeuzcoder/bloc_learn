import 'package:bloc_images/presentation/pages/home_page.dart';
import 'package:bloc_images/sevices/bloc/user_bloc.dart';
import 'package:bloc_images/sevices/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => UserBloc(userRepository: userRepository),
        child: const HomePage(),
      ),
    );
  }
}
