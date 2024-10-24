import 'package:bloc_images/domain/models/user.dart';
import 'package:bloc_images/sevices/bloc/states/user_state.dart';
import 'package:bloc_images/sevices/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListUsers extends StatelessWidget {
  const ListUsers({super.key});
  Future<void> _showAlertDialog(BuildContext context, User user) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(user.title),
          content: Image.network(user.urlBigImage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserStartState) {
          return const Center(
            child: FittedBox(
              child: Text('Rasmlarni internetdan yuklochi app'),
            ),
          );
        }

        if (state is UserErrorState) {
          return const Center(
            child: FittedBox(
              child: Text('Internetda muammo'),
            ),
          );
        }

        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserEmptyState) {
          return const Center(
            child: FittedBox(
              child: Text('Ma`lumotlar o`chirildi'),
            ),
          );
        }

        if (state is UserLoadedState) {
          return ListView.builder(
              itemCount: state.listOfUsers.length,
              itemBuilder: (context, index) {
                final user = state.listOfUsers[index];
                return ListTile(
                  onTap: () {
                    _showAlertDialog(context, user);
                  },
                  leading: Image.network(user.urlSmallImage),
                  title: Text(user.title),
                  trailing: Text(user.id.toString()),
                );
              });
        }
        return const SizedBox.shrink();
      },
      listener: (context, state) {
        if (state is UserLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Data has loaded'),
            ),
          );
        }
      },
    );
  }
}
