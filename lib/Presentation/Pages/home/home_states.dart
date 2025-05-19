import 'package:equatable/equatable.dart';

enum states {success , failure , loading, initial}

class HomeStates extends Equatable{
  final states state;
  HomeStates({required this.state});
  @override
  List<Object?> get props => [state];
}