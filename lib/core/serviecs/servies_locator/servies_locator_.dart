import 'package:get_it/get_it.dart';
import 'package:tageradmin/core/repos/add_product/add_product_repo.dart';
import 'package:tageradmin/core/repos/add_product/add_product_repo_impl.dart';
import 'package:tageradmin/core/repos/image_repo/image_repo.dart';
import 'package:tageradmin/core/repos/image_repo/image_repo_impt.dart';
import 'package:tageradmin/core/serviecs/data_base/database_servies.dart';
import 'package:tageradmin/core/serviecs/data_base/firebase_fire_store_serviexs.dart';
import 'package:tageradmin/core/serviecs/storage/storage_serviecs.dart';
import 'package:tageradmin/core/serviecs/storage/supaBase_storage.dart';

final getIt = GetIt.instance;
void setUP() {
  getIt.registerSingleton<StorageServiecs>(SupaBaseStorageServices());
  getIt.registerSingleton<DatabaseServies>(FirebaseFireStoreServiexs());
  getIt.registerSingleton<AddProductRepo>(
    AddProductRepoImpl(getIt.get<DatabaseServies>()),
  );
  getIt.registerSingleton<ImageRepo>(
    ImageRepoImpt(getIt.get<StorageServiecs>()),
  );
}
