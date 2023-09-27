
import 'package:bloc/bloc.dart';

class UpdateOptionsCubit extends Cubit<UpdateOptions> {
  UpdateOptionsCubit() : super(UpdateOptions.add);

  void change(UpdateOptions opt) {
    emit(opt);
  }
}

enum UpdateOptions {
  add,
  modify,
  delete
}
