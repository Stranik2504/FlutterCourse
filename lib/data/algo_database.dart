import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';

part 'algo_database.g.dart';

// Таблица алгоритмов
@DataClassName('AlgoRow')
class Algos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get subTitle => text()();
  TextColumn get description => text()();
  TextColumn get imgPath => text()();
}


/// Drift-база
@lazySingleton
@DriftDatabase(tables: [Algos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'algos_drift'));

  @override
  int get schemaVersion => 1;

  /// Стратегия миграций и первичное заполнение
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      // создаем все таблицы
      await m.createAll();

      // Первоначальное заполнение (как раньше наш List<Term>)
      await batch((batch) {
        //batch — объект типа Batch, который предоставляет удобный способ
        //выполнить несколько SQL-операций за один проход
        batch.insertAll(algos, [
          AlgosCompanion.insert(
            title: '1. Пузырьковая сортировка',
            subTitle: 'Пузырьковая сортировка. 1',
            description: 'Пузырьковая сортировка — это простой алгоритм сортировки, который многократно проходит по списку, сравнивает соседние элементы и меняет их местами, если они находятся в неправильном порядке. Проходы по списку повторяются до тех пор, пока список не будет отсортирован.',
            imgPath: 'assets/imgs/1.jpg',
          ),
          AlgosCompanion.insert(
            title: '2. Сортировка вставками',
            subTitle: 'Сортировка вставками. 2',
            description: 'Сортировка вставками — это алгоритм сортировки, который постепенно формирует отсортированный массив, вставляя каждый новый элемент на правильную позицию.',
            imgPath: 'assets/imgs/2.jpg',
          ),
          AlgosCompanion.insert(
            title: '3. Quick sort',
            subTitle: 'Quick sort. 3',
            description: 'Quick sort — это эффективный алгоритм сортировки, который использует стратегию «разделяй и властвуй». Он выбирает определенный элемент (опорный) и разделяет массив на две части: элементы меньше опорного и элементы больше опорного.',
            imgPath: 'assets/imgs/3.jpg',
          ),
        ]);
      });
    }
  );
}

/// Функция открытия соединения (для Flutter)
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return driftDatabase(
      name: "alogs_drift.db",
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,  //возвращает системную папку
      )
    );
  });
}