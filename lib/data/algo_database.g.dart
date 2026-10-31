// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'algo_database.dart';

// ignore_for_file: type=lint
class $AlgosTable extends Algos with TableInfo<$AlgosTable, AlgoRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlgosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subTitleMeta = const VerificationMeta(
    'subTitle',
  );
  @override
  late final GeneratedColumn<String> subTitle = GeneratedColumn<String>(
    'sub_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imgPathMeta = const VerificationMeta(
    'imgPath',
  );
  @override
  late final GeneratedColumn<String> imgPath = GeneratedColumn<String>(
    'img_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    subTitle,
    description,
    imgPath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'algos';
  @override
  VerificationContext validateIntegrity(
    Insertable<AlgoRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('sub_title')) {
      context.handle(
        _subTitleMeta,
        subTitle.isAcceptableOrUnknown(data['sub_title']!, _subTitleMeta),
      );
    } else if (isInserting) {
      context.missing(_subTitleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('img_path')) {
      context.handle(
        _imgPathMeta,
        imgPath.isAcceptableOrUnknown(data['img_path']!, _imgPathMeta),
      );
    } else if (isInserting) {
      context.missing(_imgPathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AlgoRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlgoRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      subTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sub_title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      imgPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}img_path'],
      )!,
    );
  }

  @override
  $AlgosTable createAlias(String alias) {
    return $AlgosTable(attachedDatabase, alias);
  }
}

class AlgoRow extends DataClass implements Insertable<AlgoRow> {
  final int id;
  final String title;
  final String subTitle;
  final String description;
  final String imgPath;
  const AlgoRow({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imgPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['sub_title'] = Variable<String>(subTitle);
    map['description'] = Variable<String>(description);
    map['img_path'] = Variable<String>(imgPath);
    return map;
  }

  AlgosCompanion toCompanion(bool nullToAbsent) {
    return AlgosCompanion(
      id: Value(id),
      title: Value(title),
      subTitle: Value(subTitle),
      description: Value(description),
      imgPath: Value(imgPath),
    );
  }

  factory AlgoRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlgoRow(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      subTitle: serializer.fromJson<String>(json['subTitle']),
      description: serializer.fromJson<String>(json['description']),
      imgPath: serializer.fromJson<String>(json['imgPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'subTitle': serializer.toJson<String>(subTitle),
      'description': serializer.toJson<String>(description),
      'imgPath': serializer.toJson<String>(imgPath),
    };
  }

  AlgoRow copyWith({
    int? id,
    String? title,
    String? subTitle,
    String? description,
    String? imgPath,
  }) => AlgoRow(
    id: id ?? this.id,
    title: title ?? this.title,
    subTitle: subTitle ?? this.subTitle,
    description: description ?? this.description,
    imgPath: imgPath ?? this.imgPath,
  );
  AlgoRow copyWithCompanion(AlgosCompanion data) {
    return AlgoRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      subTitle: data.subTitle.present ? data.subTitle.value : this.subTitle,
      description: data.description.present
          ? data.description.value
          : this.description,
      imgPath: data.imgPath.present ? data.imgPath.value : this.imgPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlgoRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('subTitle: $subTitle, ')
          ..write('description: $description, ')
          ..write('imgPath: $imgPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, subTitle, description, imgPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlgoRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.subTitle == this.subTitle &&
          other.description == this.description &&
          other.imgPath == this.imgPath);
}

class AlgosCompanion extends UpdateCompanion<AlgoRow> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> subTitle;
  final Value<String> description;
  final Value<String> imgPath;
  const AlgosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.subTitle = const Value.absent(),
    this.description = const Value.absent(),
    this.imgPath = const Value.absent(),
  });
  AlgosCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String subTitle,
    required String description,
    required String imgPath,
  }) : title = Value(title),
       subTitle = Value(subTitle),
       description = Value(description),
       imgPath = Value(imgPath);
  static Insertable<AlgoRow> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? subTitle,
    Expression<String>? description,
    Expression<String>? imgPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (subTitle != null) 'sub_title': subTitle,
      if (description != null) 'description': description,
      if (imgPath != null) 'img_path': imgPath,
    });
  }

  AlgosCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? subTitle,
    Value<String>? description,
    Value<String>? imgPath,
  }) {
    return AlgosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      description: description ?? this.description,
      imgPath: imgPath ?? this.imgPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subTitle.present) {
      map['sub_title'] = Variable<String>(subTitle.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imgPath.present) {
      map['img_path'] = Variable<String>(imgPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlgosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('subTitle: $subTitle, ')
          ..write('description: $description, ')
          ..write('imgPath: $imgPath')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AlgosTable algos = $AlgosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [algos];
}

typedef $$AlgosTableCreateCompanionBuilder =
    AlgosCompanion Function({
      Value<int> id,
      required String title,
      required String subTitle,
      required String description,
      required String imgPath,
    });
typedef $$AlgosTableUpdateCompanionBuilder =
    AlgosCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> subTitle,
      Value<String> description,
      Value<String> imgPath,
    });

class $$AlgosTableFilterComposer extends Composer<_$AppDatabase, $AlgosTable> {
  $$AlgosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subTitle => $composableBuilder(
    column: $table.subTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imgPath => $composableBuilder(
    column: $table.imgPath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AlgosTableOrderingComposer
    extends Composer<_$AppDatabase, $AlgosTable> {
  $$AlgosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subTitle => $composableBuilder(
    column: $table.subTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imgPath => $composableBuilder(
    column: $table.imgPath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AlgosTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlgosTable> {
  $$AlgosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get subTitle =>
      $composableBuilder(column: $table.subTitle, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imgPath =>
      $composableBuilder(column: $table.imgPath, builder: (column) => column);
}

class $$AlgosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlgosTable,
          AlgoRow,
          $$AlgosTableFilterComposer,
          $$AlgosTableOrderingComposer,
          $$AlgosTableAnnotationComposer,
          $$AlgosTableCreateCompanionBuilder,
          $$AlgosTableUpdateCompanionBuilder,
          (AlgoRow, BaseReferences<_$AppDatabase, $AlgosTable, AlgoRow>),
          AlgoRow,
          PrefetchHooks Function()
        > {
  $$AlgosTableTableManager(_$AppDatabase db, $AlgosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlgosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlgosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlgosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> subTitle = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> imgPath = const Value.absent(),
              }) => AlgosCompanion(
                id: id,
                title: title,
                subTitle: subTitle,
                description: description,
                imgPath: imgPath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String subTitle,
                required String description,
                required String imgPath,
              }) => AlgosCompanion.insert(
                id: id,
                title: title,
                subTitle: subTitle,
                description: description,
                imgPath: imgPath,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AlgosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlgosTable,
      AlgoRow,
      $$AlgosTableFilterComposer,
      $$AlgosTableOrderingComposer,
      $$AlgosTableAnnotationComposer,
      $$AlgosTableCreateCompanionBuilder,
      $$AlgosTableUpdateCompanionBuilder,
      (AlgoRow, BaseReferences<_$AppDatabase, $AlgosTable, AlgoRow>),
      AlgoRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AlgosTableTableManager get algos =>
      $$AlgosTableTableManager(_db, _db.algos);
}
