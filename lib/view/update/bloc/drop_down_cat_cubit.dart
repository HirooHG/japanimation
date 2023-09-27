
import 'package:bloc/bloc.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';

class DropDownCatCubit extends Cubit<Category?> {
  DropDownCatCubit() : super(null);

  void change(Category? cat) {
    emit(cat);
  }
}
