part of 'profile_screen_bloc.dart';

sealed class ProfileScreenState extends Equatable {
  const ProfileScreenState();

  @override
  List<Object> get props => [];
}

final class ProfileScreenLoading extends ProfileScreenState {}

final class ProfileScreenSuccess extends ProfileScreenState {}

final class ProfileScreenError extends ProfileScreenState {}
