import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwa_learn/bloc_learn/bloc_states.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(LightThemeState());

  void changeTheme() {
    if (state is DarkThemeState) {
      emit(LightThemeState());
    } else {
      emit(DarkThemeState());
    }
  }
}
