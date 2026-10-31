// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:proj_start/data/algo_database.dart' as _i163;
import 'package:proj_start/data/algos_repository.dart' as _i844;
import 'package:proj_start/pages/home/bloc/algo_bloc.dart' as _i300;
import 'package:proj_start/theme/theme_cubit.dart' as _i103;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i103.ThemeCubit>(() => _i103.ThemeCubit());
    gh.lazySingleton<_i163.AppDatabase>(() => _i163.AppDatabase());
    gh.lazySingleton<_i844.AlgosRepository>(
      () => _i844.AlgosRepository(gh<_i163.AppDatabase>()),
    );
    gh.factory<_i300.AlgoBloc>(
      () => _i300.AlgoBloc(gh<_i844.AlgosRepository>()),
    );
    return this;
  }
}
