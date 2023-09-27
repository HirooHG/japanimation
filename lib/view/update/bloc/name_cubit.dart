
import 'package:bloc/bloc.dart';

class NameCubit extends Cubit<String> {
  NameCubit() : super("");

  void change(String name) {
    emit(name);
  }
}
