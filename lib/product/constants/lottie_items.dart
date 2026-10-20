enum LottieItems { themeChange, loading }

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.themeChange:
        return 'theme_change';
      case LottieItems.loading:
        return 'loading';
    }
  }

  String get lottiePath => 'assets/lotties/${_path()}.json';
}
