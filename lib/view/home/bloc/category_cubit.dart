
import 'package:bloc/bloc.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';

class CategoryCubit extends Cubit<Category?> {
  CategoryCubit() : super(null);

  void change(Category? e) {
    emit(e);
  }
}
