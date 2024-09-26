import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_firebase_process/core/helper/AssetsData.dart';

FirebaseFirestore myFireStore = FirebaseFirestore.instance;
CollectionReference collRef = myFireStore.collection('Employee');

class Services {
  static Future<void> addEmp({
    required String name,
    required String? gender,
    required String? image,
    required String position,
    required String contactNum,
  }) async {
    DocumentReference docRef = collRef.doc();
    Map<String, dynamic> data = {
      'id': docRef.id,
      'name': name,
      'gender': gender ?? 'No gender',
      'image': image ?? AssetsData.kImageProfile,
      'position': position,
      'contactNum': contactNum,
      'createdAt': DateTime.now(),
    };
    await docRef.set(data);
  }

  static Future<void> updateEmp({
    required String id,
    required String name,
    required String? gender,
    required String? image,
    required String position,
    required String contactNum,
  }) async {
    DocumentReference docRef = collRef.doc(id);
    Map<String, dynamic> data = {
      'id': id,
      'name': name,
      'gender': gender ?? 'No gender',
      'image': image ?? AssetsData.kImageProfile,
      'position': position,
      'contactNum': contactNum,
    };
    await docRef.update(data);
  }

  static Future<void> deleteEmp({
    required String id,
  }) async {
    DocumentReference docRef = collRef.doc(id);
    await docRef.delete();
  }

  static Future<void> deleteAllEmp() async {
    QuerySnapshot querySnapshot = await collRef.get();
    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }

  static Stream<QuerySnapshot> fetchEmp() {
    CollectionReference copyCollRef = collRef;
    var result = copyCollRef.orderBy('createdAt', descending: true).snapshots();
    return result;
  }
}
