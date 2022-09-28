import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:letsparty/domain/models/theme_model.dart';

class ThemePhotosRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getThemeStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    try {
      final stream = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('themePhotos')
          .snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addThemePhoto({
    required String imageUrl,
  }) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('themePhotos')
        .add(
      {
        'image_url': imageUrl,
      },
    );
  }

  Future<ThemeModel> getPhoto(
      {required String id, required String imageUrl}) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('themePhotos')
        .doc(id)
        .get();
    return ThemeModel(
      id: id,
      imageUrl: imageUrl,
    );
  }

  Future<void> removeThemePhoto({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('themePhotos')
        .doc(id)
        .delete();
  }
}
