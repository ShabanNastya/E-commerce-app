import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];

  static List<Product> products = [
    Product(
        name: 'Soft Drinks #1',
        category: 'Soft Drinks',
        imageUrl:
            'https://previews.123rf.com/images/9dreamstudio/9dreamstudio1903/9dreamstudio190302000/119339860-tomato-juice-for-summer-healthy-drink-on-red-table-background.jpg',
        price: 5.99,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Soft Drinks #2',
        category: 'Soft Drinks',
        imageUrl:
            'https://t4.ftcdn.net/jpg/03/59/99/91/360_F_359999110_65wGn372X4yY4yTf4rcho15bNyA6FkmC.jpg',
        price: 11.87,
        isRecommended: false,
        isPopular: true),
    Product(
        name: 'Soft Drinks #3',
        category: 'Soft Drinks',
        imageUrl:
            'https://c8.alamy.com/zooms/9/04c769c92674429b82ffea3b27ac74f5/penpr8.jpg',
        price: 9.67,
        isRecommended: true,
        isPopular: true),
    Product(
        name: 'Smoothies #1',
        category: 'Smoothies',
        imageUrl:
            'https://www.tasteofhome.com/wp-content/uploads/2018/01/Mango-Smoothies_exps40117_RDS2677379B02_15_5bC_RMS-5.jpg',
        price: 18.30,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Smoothies #2',
        category: 'Smoothies',
        imageUrl:
            'https://img.freepik.com/free-photo/colorful-fruit-smoothies-composition-wooden-background_23-2148227532.jpg?size=626&ext=jpg',
        price: 12.98,
        isRecommended: false,
        isPopular: false),
  ];
}
