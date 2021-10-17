import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    Category(
        name: 'Soft Drinks',
        imageUrl:
            'https://avatars.mds.yandex.net/get-zen_doc/3725151/pub_5ffcbcf4f988451a42c46e5e_5ffcbcfdaeef3c7829ff299f/scale_1200'),
    Category(
        name: 'Smoothies',
        imageUrl:
            'https://kopilka-kulinara.ru/upload/information_system_58/3/5/9/item_3594/item_3594.jpg'),
    Category(
        name: 'Water',
        imageUrl:
            'https://moscow-airports.com/wp-content/uploads/2018/06/skolko-vody-mozhno-vzyat-v-samolet1-e1529295684842.jpg'),
  ];
}
