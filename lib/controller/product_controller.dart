import 'package:e_commerce/services/api_service.dart';
import 'package:get/get.dart';
import 'package:e_commerce/model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var allProducts = <Product>[].obs;

  var isLoading = true.obs;

  var categories = ["All"].obs;
  var selectedCategory = "All".obs;

  var isFavorite = false.obs;

  var favoriteProducts = <Product>[].obs;

  var currentIndex = 0.obs;

  @override
  void onInit() {
    fetchProducts();
    fetchCategories();
    loadFavorites();
    super.onInit();
  }

  void loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteIds = prefs.getStringList('favoriteProducts');
    if (favoriteIds != null) {
      favoriteProducts.assignAll(
        allProducts
            .where((product) => favoriteIds.contains(product.id))
            .toList(),
      );
    }
  }

  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> favoriteIds =
        favoriteProducts.map((product) => product.id.toString()).toList();

    await prefs.setStringList('favoriteProducts', favoriteIds);
  }

  void changePage(int index) {
    currentIndex.value = index;
  }

  void toggleFavorite(Product product) async {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }
    await saveFavorites();
    update();
  }
  // void toggleFavorite(Product product) {
  //   if (favoriteProducts.contains(product)) {
  //     favoriteProducts.remove(product);
  //   } else {
  //     favoriteProducts.add(product);
  //   }
  //   update();
  // }

  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await ApiService().fetchProducts();
      if (products != null) {
        allProducts.assignAll(products); // Store all products
        productList.assignAll(products); // Initially display all products
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchCategories() async {
    var fetchedCategories = await ApiService().fetchCategories();
    if (fetchedCategories != null) {
      categories.addAll(fetchedCategories);
    }
  }

  void filterProducts(String category) {
    if (category == "All") {
      productList.assignAll(allProducts);
    } else {
      var filteredProducts =
          allProducts.where((product) => product.category == category).toList();
      productList.assignAll(filteredProducts);
    }
    selectedCategory(category);
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      productList.assignAll(allProducts);
    } else {
      var filteredProducts = allProducts
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      productList.assignAll(filteredProducts);
    }
  }
}
