import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quize_joy/models/quize_model.dart';

class FirebaseQuizeController {
  final _quizeCollection = FirebaseFirestore.instance.collection("quizes");

  // Firestore'dan quizelarni stream ko'rinishida qaytarish
  Stream<List<QuizeModel>> getQuize() {
    return _quizeCollection.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        // Hujjatning id'si bilan birga xarita qilish
        final data = doc.data();
        return QuizeModel.fromMap(data)..id = doc.id;
      }).toList();
    });
  }

  // Quize qo'shish
  Future<String> addQuize(QuizeModel quize) async {
    try {
      var newQuize = await _quizeCollection.add(quize.toMap());
      await _quizeCollection.doc(newQuize.id).update({
        "id": newQuize.id, // Firestore hujjatining id'si
      });
      return newQuize.id;
    } catch (e) {
      // ignore: avoid_print
      print("Add qilishda xatolik: $e");
      rethrow;
    }
  }

  // Quize o'chirish
  Future<void> deleteQuize(String id) async {
    try {
      await _quizeCollection.doc(id).delete();
    } catch (e) {
      // ignore: avoid_print
      print("Delete qilishda xatolik: $e");
      rethrow;
    }
  }
}
