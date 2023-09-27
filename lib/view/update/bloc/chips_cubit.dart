
import 'package:bloc/bloc.dart';

class ChipsCubit extends Cubit<TypeOptions> {
  ChipsCubit() : super(TypeOptions.advertisement);

  void change(TypeOptions type) {
    emit(type);
  }
}

enum TypeOptions {
  advertisement,
  spe,
  category
}
