
enum Routes {
  home(RouteType.parent),
  update(RouteType.parent),
  thing(RouteType.child);

  const Routes(this.type);

  final RouteType type;

  String getPath() => type == RouteType.parent 
    ? "/$name"
    : name;
}

enum RouteType {
  child,
  parent
}
