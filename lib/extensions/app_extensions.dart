extension StringHelper on String? {
  bool isNullOrEmpty() {
    return ['', null].contains(this);
  }
}
