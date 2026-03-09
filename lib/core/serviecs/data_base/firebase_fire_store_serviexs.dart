import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tageradmin/core/serviecs/data_base/database_servies.dart';

class FirebaseFireStoreServiexs implements DatabaseServies {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docID,
  }) async {
    if (docID == null) {
      await firestore.collection(path).doc(docID).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }
}
