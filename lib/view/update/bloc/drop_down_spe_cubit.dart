
import 'package:bloc/bloc.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';

class DropDownSpeCubit extends Cubit<Spe?> {
  DropDownSpeCubit() : super(null);

  void change(Spe? spe) {
    emit(spe);
  }
}
