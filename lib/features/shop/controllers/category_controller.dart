import 'package:doan/common/widgets/loaders/loader.dart';
import 'package:doan/data/repositories/categories/category_repository.dart';
import 'package:doan/data/repositories/product/product_repository.dart';
import 'package:doan/features/shop/models/category_model.dart';
import 'package:doan/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();

  }

  // Load category data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;
      
      // Fetch categories from data source
      final categories = await _categoryRepository.getAllCategories();
      
      // Update the categories list
      allCategories.assignAll(categories);
      
      //Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  // Load selected category data

  // Get category or Sub-category Product
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
  }




}