import 'package:japanimationbloc/domain/entities/advertisement/advertisement.dart';
import 'package:japanimationbloc/domain/entities/category/category.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';

class AdvertisementUseCase {

  List<Advertisement> filterAdvertisementByCat(List<Advertisement> advs, Category? category) {
    return (category == null) ? advs : advs.where((element) => element.category == category).toList();
  }

  List<Advertisement> filterAdvertisementBySpe(List<Advertisement> advs, Spe? spe) {
    return (spe == null) ? advs : advs.where((element) => element.spe == spe).toList();
  }
}
