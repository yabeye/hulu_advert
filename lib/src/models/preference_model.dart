import 'package:hulu_advert/src/models/models.dart';

class Preference {
  bool? isFirstTime;
  bool? isDarkMode;
  String? locale;
  UserModel? currentUser;

  Preference({
    this.isFirstTime,
    this.isDarkMode,
    this.locale,
    this.currentUser,
  });

  Preference copyWith({
    bool? isFirstTime,
    bool? isDarkMode,
    String? locale,
    UserModel? currentUser,
  }) {
    return Preference(
      isFirstTime: isFirstTime ?? this.isFirstTime,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      locale: locale ?? this.locale,
      currentUser: currentUser ?? this.currentUser,
    );
  }

  @override
  String toString() {
    return 'Preference(isFirstTime: $isFirstTime, isDarkMode: $isDarkMode, locale: $locale, currentUser: $currentUser)';
  }
}
