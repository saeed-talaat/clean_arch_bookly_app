import 'package:clean_artc_bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failure, T>> call([Param parm]);
}

class NoParm {}
