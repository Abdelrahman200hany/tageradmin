import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tageradmin/core/errors/faulire.dart';
import 'package:tageradmin/core/repos/image_repo/image_repo.dart';
import 'package:tageradmin/core/serviecs/storage/storage_serviecs.dart';

class ImageRepoImpt implements ImageRepo {
  final StorageServiecs storageServiecs;

  ImageRepoImpt(this.storageServiecs);
  @override
  Future<Either<Faulire, String>> upLoaded(File iamgeFile) async {
    try {
      String url = await storageServiecs.upLoadFile(iamgeFile, 'images');
      return right(url);
    } catch (e) {
      return left(ServierFaulire('opps! falied to  upload file  try again'));
    }
  }
}
