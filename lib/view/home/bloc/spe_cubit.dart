import 'package:bloc/bloc.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';

class SpeCubit extends Cubit<Spe?> {
  SpeCubit() : super(null);

  void change(Spe? e) {
    emit(e);
  }
}
