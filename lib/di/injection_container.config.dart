// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/search/data/data_sources/news_datasource.dart' as _i4;
import '../app/search/data/repositories/NewsRepositoryImpl.dart' as _i6;
import '../app/search/domain/repositories/news_repository.dart' as _i5;
import '../app/search/domain/use_cases/fetch_news_use_case.dart' as _i8;
import '../app/search/domain/use_cases/search_use_case.dart' as _i7;
import '../app/search/presentation/bloc/home_page_bloc.dart' as _i9;
import '../core/third_party/third_party.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioBase = _$DioBase();
    gh.lazySingleton<_i3.Dio>(() => dioBase.dio);
    gh.lazySingleton<_i4.NewsDataSource>(
        () => _i4.NewsDataSourceImpl(dio: gh<_i3.Dio>()));
    gh.lazySingleton<_i5.NewsRepository>(
        () => _i6.NewsRepositoryImpl(gh<_i4.NewsDataSource>()));
    gh.lazySingleton<_i7.SearchUseCase>(
        () => _i7.SearchUseCase(newsRepository: gh<_i5.NewsRepository>()));
    gh.lazySingleton<_i8.FetchNewsUseCase>(
        () => _i8.FetchNewsUseCase(newsRepository: gh<_i5.NewsRepository>()));
    gh.factory<_i9.DashBoardBloc>(() => _i9.DashBoardBloc(
          gh<_i8.FetchNewsUseCase>(),
          gh<_i7.SearchUseCase>(),
        ));
    return this;
  }
}

class _$DioBase extends _i10.DioBase {}
