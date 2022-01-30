import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnthrive/data/models/models.dart';

class ProductListCubit extends Cubit<List<ExpansionPanelCategoryItem>> {
  ProductListCubit() : super([]);

  void getProductsList() {
    // Call method to fetch from API
  }
}
