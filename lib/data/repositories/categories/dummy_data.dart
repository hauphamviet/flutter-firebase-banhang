import 'package:doan/utils/constants/image_strings.dart';

import '../../../features/shop/models/category_model.dart';

class TDummyData {

  /// List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '2', image: TImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '3', image: TImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '4', image: TImages.clothIcon, name: 'Clothes',isFeatured: true),
    CategoryModel(id: '5', image: TImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7',  image: TImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),

    /// Subcategories
    CategoryModel(id: '8', image: TImages.sportIcon, name: 'Sports shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: TImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: TImages.sportIcon, name: 'Sports Equipments',  parentId: '1', isFeatured: false),

    /// furniture
    CategoryModel(id: '11', image: TImages.furnitureIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '12', image: TImages.furnitureIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '13', image: TImages.furnitureIcon, name: 'Office furniture', parentId: '5', isFeatured: false),

    CategoryModel(id: '14', image: TImages.electronicsIcon, name: 'Laptop', isFeatured: false),
    CategoryModel(id: '15', image: TImages.electronicsIcon, name: 'Mobile', isFeatured: false),

    CategoryModel(id: '16', image: TImages.clothIcon, name: 'Shirts', parentId: '3', isFeatured: false),







  ];

}