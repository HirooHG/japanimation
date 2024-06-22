import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japanimationbloc/controller/cubit/bottomsheet/options.dart';

class BottomSheetCubit extends Cubit<Options> {
  BottomSheetCubit() : super(Options.animation);

  change(Options change) {
    emit(change);
  }
}
