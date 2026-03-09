import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tageradmin/core/errors/faulire.dart';

abstract class ImageRepo {
  Future<Either<Faulire,String>>upLoaded(File iamgeFile);
}


