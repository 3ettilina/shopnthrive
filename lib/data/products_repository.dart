import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shopnthrive/domain/models/models.dart';

class ProductsRepository {
  final store = FirebaseFirestore.instance.collection('products');
  final storage = FirebaseStorage.instance;

  Future createProduct(Product product) async {
    await store.doc(product.name.toLowerCase()).set(product.toJson());
  }

  Stream<List<Product>> getProducts() {
    return store.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
  }

  UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = storage.ref(destination);
      return ref.putFile(file);
    } on FirebaseException catch (_) {
      return null;
    }
  }

  Future deleteProduct(Product product) async {
    await store.doc(product.name.toLowerCase()).delete();
  }

  Future addFavoriteProduct(Product product) async {
    await store.doc(product.name.toLowerCase()).update({'isFavorite': true});
  }

  Future removeFavoriteProduct(Product product) async {
    await store.doc(product.name.toLowerCase()).update({'isFavorite': false});
  }

  Stream<List<Product>> getFavoriteProducts() {
    return store.where('isFavorite', isEqualTo: true).snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
  }
}
