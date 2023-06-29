part of 'home_page_bloc.dart';

class DashBoardLoadState extends Equatable {
  final List<HitEnitity> hitEnititys;
  final bool hasMore;
  final Operation isLoading;
  final int currentPage;
  @override
  List<Object?> get props => [hitEnititys, hasMore, currentPage, isLoading];
  DashBoardLoadState copyWith({
    List<HitEnitity>? hitEnititys,
    bool? hasMore,
    int? currentPage,
    Operation? isLoading,
  }) {
    return DashBoardLoadState(
        hitEnititys: hitEnititys ?? this.hitEnititys,
        hasMore: hasMore ?? this.hasMore,
        isLoading: isLoading ?? this.isLoading,
        currentPage: currentPage ?? this.currentPage);
  }

  const DashBoardLoadState({
    this.hitEnititys = const <HitEnitity>[],
    this.hasMore = true,
    this.currentPage = 0,
    this.isLoading = Operation.loaded,
  });
}
