
part of 'app_bloc.dart';

abstract class AppState extends Equatable {}

class AppLoading extends AppState {

  @override
  List<Object?> get props => [];
}

class AppError extends AppState {

  @override
  List<Object?> get props => [];
}

class AppLoaded extends AppState {
  final List<Spe> spes;
  final List<Category> cats;
  final List<Advertisement> advs;

  AppLoaded({
    required this.spes,
    required this.advs,
    required this.cats,
  });

  Map<String, dynamic> toJson() {
    return {
      "spes": spes.map((e) => e.toJson()).toList(),
      "cats": cats.map((e) => e.toJson()).toList(),
      "advs": advs.map((e) => e.toJson()).toList()
    };
  }

  factory AppLoaded.fromJson(Map<String, dynamic> json) {
    final spes = (json["spes"] as List).map((e) => Spe.fromJson(e)).toList();
    final cats = (json["cats"] as List).map((e) => Category.fromJson(e)).toList();
    final advs = (json["advs"] as List).map((e) => Advertisement.fromJson(e)).toList();

    return AppLoaded(
      spes: spes,
      advs: advs,
      cats: cats
    );
  }

  @override
  List<Object?> get props => [advs, spes, cats];
}
