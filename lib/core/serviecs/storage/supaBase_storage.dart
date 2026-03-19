import 'dart:io';

import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tageradmin/core/serviecs/storage/storage_serviecs.dart';

class SupaBaseStorageServices implements StorageServiecs {
  static late Supabase _supabase;

  static Future initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://vlxpydkwmcdqgrnzypuc.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZseHB5ZGt3bWNkcWdybnp5cHVjIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MzE2MzM3NiwiZXhwIjoyMDg4NzM5Mzc2fQ.laMazbo8t90-tYEQeDq2NF0UNW9I1NkplM8AFEnXd3E',
    );
  }

  // to create bucket insteal of create one in dashBoard
  static Future createBuckets(String bucketName) async {
    List<Bucket> buckets = await _supabase.client.storage.listBuckets();
    bool isBucketISexits = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketISexits = true;
        break;
      }
    }
    if (!isBucketISexits) {
      _supabase.client.storage.createBucket(bucketName);
    }
  }

  // to upload file and get the  url of file

  @override
  Future<String> upLoadFile(File file, String pathUrl) async {
    String fileName = b.basename(file.path);
    String extension = b.extension(file.path);
    await _supabase.client.storage
        .from('fruitImages')
        .upload('$pathUrl/$fileName.$extension', file);
    final String fileUrl = _supabase.client.storage
        .from('fruitImages')
        .getPublicUrl('avatar1.png');
    return fileUrl;
  }
}
