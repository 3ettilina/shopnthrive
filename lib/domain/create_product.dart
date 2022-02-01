import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shopnthrive/data/api/api.dart';
import 'package:shopnthrive/data/models/models.dart';
import 'package:shopnthrive/strings.dart';

class CreateProduct {
  final repo = ProductsRepository();

  CreateProduct();

  Future<String> execute(String name, Category? category, File? image) async {
    if (name.isNotEmpty && category != null && image != null) {
      final fileName = '${name}_image';
      final destination = 'files/$fileName';

      UploadTask? task = repo.uploadFile(destination, image);

      final imageSnapshot = await task!.whenComplete(() => {});
      final imageUrl = await imageSnapshot.ref.getDownloadURL();

      final product = Product(name: name, category: category, image: imageUrl);
      await repo.createProduct(product);
      return ShopNThriveStrings.productAdded(name);
    } else {
      return ShopNThriveStrings.productFieldsMissing();
    }
  }
}
