
import 'package:flutter_bloc/flutter_bloc.dart';

class ModifyJapanCubit extends Cubit<String> {
  ModifyJapanCubit() : super("category");

  change(String change) {
    emit(change);
  }
}