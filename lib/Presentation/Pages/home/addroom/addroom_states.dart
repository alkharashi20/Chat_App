import 'package:equatable/equatable.dart';

enum state {initial,loading,success,failure}
class AddRoomStates extends Equatable{
  state stat;
  AddRoomStates({required this.stat});
  @override
  // TODO: implement props
  List<Object?> get props => [stat];


}