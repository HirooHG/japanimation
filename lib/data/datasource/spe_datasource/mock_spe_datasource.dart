
import 'package:japanimationbloc/data/datasource/spe_datasource/spe_datasource.dart';
import 'package:japanimationbloc/data/model/spe/spe_model.dart';
import 'package:uuid/uuid.dart';

class MockSpeDataSource extends SpeDataSource {

  @override
  Future<List<SpeModel>> getSpes() async {
    return [
      "en cours",
      "terminé",
      "veux voir",
    ].map((e) => SpeModel(id: const Uuid().v1(), name: e)).toList();
  }
}
