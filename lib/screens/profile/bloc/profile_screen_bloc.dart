import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_screen_event.dart';
part 'profile_screen_state.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  ProfileScreenBloc() : super(ProfileScreenLoading()) {
    on<ProfileScreenEvent>((event, emit) async {
      if (event is ProfileScreenStarted) {
        emit(ProfileScreenLoading());
        await Future.delayed(Duration(seconds: 3));
        emit(ProfileScreenSuccess());
      }
    });
  }
}
