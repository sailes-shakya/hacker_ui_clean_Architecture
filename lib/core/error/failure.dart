import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

//General Failures
class ServerFailure extends Failure {
  ServerFailure({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

class CacheFailure extends Failure {}

class DioFailure extends Failure {
  DioFailure({required this.error});

  final DioException error;

  @override
  List<Object?> get props => [error];
}

class DateParseFailure extends Failure {
  DateParseFailure({required this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
