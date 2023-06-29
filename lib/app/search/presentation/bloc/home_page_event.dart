part of 'home_page_bloc.dart';

abstract class DashBoardEvent extends Equatable {
  const DashBoardEvent();
}

class FrontPageLoadEvent extends DashBoardEvent {
  @override
  List<Object?> get props => throw UnimplementedError();

  const FrontPageLoadEvent();
}

class FrontPageInitialEvent extends DashBoardEvent {
  @override
  List<Object?> get props => throw UnimplementedError();

  const FrontPageInitialEvent();
}

class SearchEvent extends DashBoardEvent {
  final String searchKey;
  @override
  List<Object?> get props => throw UnimplementedError();

  const SearchEvent(this.searchKey);
}
