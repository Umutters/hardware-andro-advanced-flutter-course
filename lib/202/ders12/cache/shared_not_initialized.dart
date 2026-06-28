class SharedNotInitialized implements Exception {
  @override
  String toString() {
    return "SharedNotInitialized: Shared instance is not initialized.";
  }
}
