import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsState {
  bool darkMode;

  PrefsState({required this.darkMode});
}

class PrefsCubit extends Cubit<PrefsState> {
  static const String darkModePrefsKey = "darkMode";

  PrefsCubit() : super(PrefsState(darkMode: false)) {
    SharedPreferences.getInstance().then((prefs) {
      final darkMode = prefs.getBool(darkModePrefsKey);
      if (!isClosed) emit(PrefsState(darkMode: darkMode ?? false));
    });
  }

  Future<bool> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkModePrefsKey) ?? false;
  }

  Future<void> setDarkMode(bool darkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(darkModePrefsKey, darkMode);
    if (!isClosed) emit(PrefsState(darkMode: darkMode));
  }
}
