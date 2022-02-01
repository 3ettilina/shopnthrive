import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopnthrive/data/data.dart';
import 'package:shopnthrive/domain/models/models.dart';

class CategoriesRepository {
  final store = FirebaseFirestore.instance.collection('categories');
  final productsRepo = ProductsRepository();

  Future createCategory(Category category) async {
    await store.doc(category.name.toLowerCase()).set(category.toJson());
  }

  Future deleteCategory(Category category, List<Product> products) async {
    for (Product product in products) {
      await productsRepo.deleteProduct(product);
    }
    await store.doc(category.name.toLowerCase()).delete();
  }

  Stream<List<Category>> getCategories() {
    return store.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Category.fromJson(doc.data())).toList());
  }
}
