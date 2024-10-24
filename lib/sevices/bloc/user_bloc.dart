import 'dart:developer';

import 'package:bloc_images/domain/models/user.dart';
import 'package:bloc_images/sevices/bloc/events/user_event.dart';
import 'package:bloc_images/sevices/bloc/states/user_state.dart';
import 'package:bloc_images/sevices/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserStartState()) {
    on<UserClearEvent>(
      (event, emit) async {
        emit(UserEmptyState());
      },
    );
    on<UserLoadEvent>(
      (event, emit) async {
        emit(UserLoadingState());
        try {
          List<User> listOfUsers = await userRepository.getUsers();
          emit(UserLoadedState(listOfUsers: listOfUsers));
        } catch (e) {
          emit(UserErrorState());
          log(e.toString());
          Exception(e);
        }
      },
    );
  }
}
