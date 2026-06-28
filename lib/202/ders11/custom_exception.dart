class CustomException implements Exception {
  @override
  String toString() {
    return 'File Download has failed';
  }
}
