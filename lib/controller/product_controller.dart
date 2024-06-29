import 'package:e_commerce/services/api_service.dart';
import 'package:get/get.dart';
import 'package:e_commerce/model/product.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var allProducts = <Product>[].obs; // List to store all products
  var isLoading = true.obs;
  var categories = ["All"].obs;
  var selectedCategory = "All".obs;
  var selectedIndex = 0.obs;

  void onItemSelectedbar(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    fetchProducts();
    fetchCategories();
    super.onInit();
  }

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
}
