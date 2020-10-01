import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
abstract class UseCaseNoReturn<Type, Params> {
  void call(Params params);
}
abstract class UseCaseStream<Type, Params> {
  Stream<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}