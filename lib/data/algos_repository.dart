import 'package:injectable/injectable.dart';
import '../models/algo.dart';
import 'algo_database.dart' as db;

@lazySingleton
class AlgosRepository {
  final db.AppDatabase _database;

  AlgosRepository(this._database);

  Future<List<Algo>> getAlgos() async {
    final algoRows = await _database.select(_database.algos).get();

    return algoRows.map((row) => Algo(
      id: row.id,
      title: row.title,
      subTitle: row.subTitle,
      description: row.description,
      imgPath: row.imgPath,
    )).toList();
  }
}