
import 'package:japanimationbloc/data/datasource/advertisement_datasource/advertisement_datasource.dart';
import 'package:japanimationbloc/data/datasource/advertisement_datasource/mock_advertisement_datasource.dart';
import 'package:japanimationbloc/data/datasource/category_datasource/category_datasource.dart';
import 'package:japanimationbloc/data/datasource/category_datasource/mock_category_datasource.dart';
import 'package:japanimationbloc/data/datasource/login_datasource.dart/login_datasource.dart';
import 'package:japanimationbloc/data/datasource/spe_datasource/mock_spe_datasource.dart';
import 'package:japanimationbloc/data/datasource/spe_datasource/spe_datasource.dart';

class DataSource {
  static late final AdvertisementDataSource adv;
  static late final CategoryDataSource cat;
  static late final SpeDataSource spe;
  static late final LoginDataSource login;

  static final DataSource _singleton = DataSource._internal();

  factory DataSource() {
    return _singleton;
  }

  DataSource._internal();

  void init({required bool mock}) {
    if(mock) {
      adv = MockAdvertisementDataSource();
      cat = MockCategoryDataSource();
      spe = MockSpeDataSource();
      login = LoginDataSource();
    } else {
      adv = AdvertisementDataSource();
      cat = CategoryDataSource();
      spe = SpeDataSource();
      login = LoginDataSource();
    }
  }
}
