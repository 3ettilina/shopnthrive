import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnthrive/common/router_state.dart';
import 'package:shopnthrive/strings.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(const ListOfProductsScreen());

  String screenTitle = ShopNThriveStrings.productsListScreenTitle();

  void goToCreateProductScreen() {
    screenTitle = ShopNThriveStrings.createProductScreenTitle();
    emit(const CreateProductScreen());
  }

  void goToCreateCategoryScreen() {
    screenTitle = ShopNThriveStrings.createCategoryScreenTitle();
    emit(const CreateCategoryScreen());
  }

  void goToListOfProductsScreen() {
    screenTitle = ShopNThriveStrings.productsListScreenTitle();
    emit(const ListOfProductsScreen());
  }

  void goToListOfFavoritesScreen() {
    screenTitle = ShopNThriveStrings.favoritesListScreenTitle();
    emit(const ListOfFavoritesScreen());
  }
}
