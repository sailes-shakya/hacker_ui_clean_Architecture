import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hackernews/app/search/domain/entities/new_enitity.dart';
import 'package:hackernews/app/search/domain/use_cases/fetch_news_use_case.dart';
import 'package:hackernews/app/search/domain/use_cases/search_use_case.dart';
import 'package:hackernews/core/enum/enum_utilis.dart';
import 'package:injectable/injectable.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

@injectable
class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardLoadState> {
  FetchNewsUseCase fetchNewsUseCase;
  SearchUseCase searchUseCase;
  DashBoardBloc(this.fetchNewsUseCase, this.searchUseCase)
      : super(DashBoardLoadState()) {
    on<FrontPageLoadEvent>(onDashBoardLoaded);
    on<SearchEvent>(onDashBoardSeach);
    on<FrontPageInitialEvent>(onDashBoardInitial);
  }

  Future<FutureOr<void>> onDashBoardLoaded(
      FrontPageLoadEvent event, Emitter<DashBoardLoadState> emit) async {
    if ((!(state.isLoading == Operation.loading) && state.hasMore)) {
      emit(state.copyWith(isLoading: Operation.loading));
      var pageNum = state.currentPage;
      var response = await fetchNewsUseCase.call(Param(pageNum.toString()));

      response.fold(
          (l) => null,
          (r) => emit(state.copyWith(
              hitEnititys: [...state.hitEnititys, ...r.hits!],
              currentPage: r.page! + 1,
              hasMore: (r.nbPages! >= r.page!),
              isLoading: Operation.loaded)));
    }
  }

  Future<FutureOr<void>> onDashBoardSeach(
      SearchEvent event, Emitter<DashBoardLoadState> emit) async {
    emit(state.copyWith(isLoading: Operation.loading, hitEnititys: []));

    var response = await searchUseCase.call(SearchParam(event.searchKey));

    response.fold(
        (l) => null,
        (r) => emit(state.copyWith(
            hitEnititys: [...r.hits!],
            currentPage: 0,
            hasMore: false,
            isLoading: Operation.loaded)));
  }

  FutureOr<void> onDashBoardInitial(
      FrontPageInitialEvent event, Emitter<DashBoardLoadState> emit) async {
    emit(state.copyWith(isLoading: Operation.loading, hitEnititys: []));
    var pageNum = state.currentPage;
    var response = await fetchNewsUseCase.call(Param(pageNum.toString()));

    response.fold(
        (l) => null,
        (r) => emit(state.copyWith(
            hitEnititys: [...state.hitEnititys, ...r.hits!],
            currentPage: r.page! + 1,
            hasMore: (r.nbPages! >= r.page!),
            isLoading: Operation.loaded)));
  }
}
