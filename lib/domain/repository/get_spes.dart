
import 'package:japanimationbloc/data/datasource/spe_datasource/spe_datasource.dart';
import 'package:japanimationbloc/domain/entities/spe/spe.dart';

class GetSpes {
  const GetSpes({required this.dataSource});

  final SpeDataSource dataSource;

  Future<List<Spe>> getSpes() async {
    final spes = await dataSource.getSpes();
    return spes.map((e) => e.toEntity()).toList();
  }

  Future<bool> postSpe(Spe spe) async {
    return await dataSource.postSpe(spe);
  }

  Future<bool> putSpe(Spe spe) async {
    return await dataSource.putSpe(spe);
  }

  Future<bool> deleteSpe(Spe spe) async {
    return await dataSource.deleteSpe(spe);
  }
}
