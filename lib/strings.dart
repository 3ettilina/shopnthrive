class ShopNThriveStrings {
  // ADD PRODUCT
  static productAdded(String name) => 'Product added successfuly: $name';
  static productRemoved(String name) => 'Product removed successfuly: $name';
  static productFieldsMissing() =>
      'One or more fields are missing, please fill them all :)';
  static productDuplicated() =>
      'There\'s another product with the same name, please change it.';

  // ADD CATEGORY
  static categoryAdded(String name) => 'New category added: $name';
  static categoryNameMissing() =>
      'The category must have a name, please add one :)';
  static categoryNameDuplicated() =>
      'There\'s another category with the same name, please choose another :)';

  static somethingWentWrong() =>
      'Ups, something went wrong, please try again :)';

  // SCREEN TITLE
  static createProductScreenTitle() => 'Create product';
  static createCategoryScreenTitle() => 'Create category';
  static productsListScreenTitle() => 'All products';
  static favoritesListScreenTitle() => 'Favorite products';
}
