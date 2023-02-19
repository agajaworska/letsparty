import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GroupRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getGroupStream() {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        throw Exception('User is not logged in');
      }
      final stream =
          FirebaseFirestore.instance.collection('createdGroup').snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  // Future<void> getUser({required String groupId}) async {
  //   final userId = FirebaseAuth.instance.currentUser?.uid;
  //   if (userId == null) {
  //     throw Exception('User is not logged in');
  //   }
  //   List<dynamic> members = [];
  //   final value = await FirebaseFirestore.instance
  //       .collection('createdGroup')
  //       .doc(groupId)
  //       .get()
  //       .then(
  //     (value) {
  //       members = value.data()?['members'];
  //       print(members);
  //     },
  //   );
  // }

  Future<void> createGroup(
    String groupName,
    String userName,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }

    List<String> members = [];
    List<String> userNames = [];
    try {
      members.add(userId);
      userNames.add(userName);

      DocumentReference docRef =
          await FirebaseFirestore.instance.collection('createdGroup').add({
        'name': groupName,
        'leader': userId,
        'members': members,
        'userName': userNames,
        'groupCreate': Timestamp.now(),
      });

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('user')
          .doc(docRef.id)
          .update({'groupId': userId});
    } catch (error) {
      throw error.toString();
    }
  }

  Future<void> joinGroup(
    String groupId,
    String userName,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }

    List<String> members = [];
    List<String> userNames = [];
    try {
      members.add(userId);
      userNames.add(userName);

      await FirebaseFirestore.instance
          .collection('createdGroup')
          .doc(groupId)
          .update({'members': FieldValue.arrayUnion(members)});
      await FirebaseFirestore.instance
          .collection('createdGroup')
          .doc(groupId)
          .update({'userName': FieldValue.arrayUnion(userNames)});
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('user')
          .doc()
          .update({'groupId': groupId});
    } catch (error) {
      throw error.toString();
    }
  }
}
