import 'package:bloc_images/sevices/bloc/events/user_event.dart';
import 'package:bloc_images/sevices/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.deepPurple[300],
          onPressed: () {
            bloc.add(UserLoadEvent());
          },
          child: const Icon(
            Icons.download,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        FloatingActionButton(
          backgroundColor: Colors.deepPurple[300],
          onPressed: () {
            bloc.add(UserClearEvent());
          },
          child: const Icon(
            Icons.clear,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
