import 'package:bloc_images/domain/models/user.dart';

abstract class UserState {}

class UserStartState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> listOfUsers;

  UserLoadedState({required this.listOfUsers});
}

class UserErrorState extends UserState {}

class UserEmptyState extends UserState {}
