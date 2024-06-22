enum Options {
  animation,
  category,
  specification;

  String get name => toString().split('.').last;
}
