import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopnthrive/domain/models/models.dart';

class CategoriesRepository {
  final store = FirebaseFirestore.instance.collection('categories');

  Future createCategory(Category category) async {
    await store.doc(category.name.toLowerCase()).set(category.toJson());
  }

  Stream<List<Category>> getCategories() {
    return store.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Category.fromJson(doc.data())).toList());
  }
}
