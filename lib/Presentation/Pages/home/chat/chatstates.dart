import 'package:equatable/equatable.dart';

enum states{success , failure , loading, initial}
class ChatStates extends Equatable{
  states state;
  ChatStates({required this.state});

  @override
  // TODO: implement props
  List<Object?> get props =>[state];
}