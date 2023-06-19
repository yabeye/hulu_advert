class Preference {
  bool? isFirstTime;
  bool? isDarkMode;
  String? locale;
  Preference({
    this.isFirstTime,
    this.isDarkMode,
    this.locale,
  });

  Preference copyWith({
    bool? isFirstTime,
    bool? isDarkMode,
    String? locale,
  }) {
    return Preference(
      isFirstTime: isFirstTime ?? this.isFirstTime,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      locale: locale ?? this.locale,
    );
  }

  @override
  String toString() =>
      'Preference(isFirstTime: $isFirstTime, isDarkMode: $isDarkMode, locale: $locale)';
}
