import 'package:chat_app/Presentation/Pages/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeStates>{
  HomeViewModel():super(HomeStates(state: states.initial));
}