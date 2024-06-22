// singleOrNullWhere
extension ListExt<T> on List<T> {
  T? singleOrNullWhere(bool Function(T) test) {
    final list = where(test).toList();
    if (list.length == 1) {
      return list.first;
    }
    return null;
  }
}
