import 'dart:io';

import 'package:protextile/server/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> uploadImage({
  required String storageBucket,
  required String storagePath,
  required String imageLocalPath,
}) async {
  final supabase = sl<SupabaseClient>();
  final imageFile = File(imageLocalPath);
  final String userId = supabase.auth.currentUser!.id;
  final imagePath = '$userId/$storagePath';
  await supabase.storage.from(storageBucket).upload(
        imagePath,
        imageFile,
        fileOptions: FileOptions(
          cacheControl: '3600',
          upsert: true,
          contentType: 'image/${imageLocalPath.split('.').last}',
        ),
      );
  String imageUrl =
      supabase.storage.from(storageBucket).getPublicUrl(imagePath);
  imageUrl = Uri.parse(imageUrl).replace(
    queryParameters: {'t': DateTime.now().millisecondsSinceEpoch.toString()},
  ).toString();

  return imageUrl;
}
