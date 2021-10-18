import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/bloc/wishlist/wishlist_bloc.dart';
import 'package:e_commerce_app/models/models.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ProductScreen(product: product));
  }

  final Product product;

  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                  )),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state){
                return IconButton(
                    onPressed: () {
                      context.read<WishlistBloc>().add(WishlistProductAdded(product));
                      
                      final snackBar = SnackBar(content: Text('Added to your wishlist'),   backgroundColor: Colors.redAccent,);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ));}
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Text(
                    'ADD TO CART',
                    style: Theme.of(context).textTheme.headline3,
                  ))
            ],
          ),
        ),
      ),
      body: ListView(children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.7,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlay: true,
          ),
          items: [
            HeroCarouselCard(
              product: product,
              category: null,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.bottomCenter,
                color: Colors.black,
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width - 10,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '${product.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ExpansionTile(
            initiallyExpanded: true,
            title: Text(
              'Product information',
              style: Theme.of(context).textTheme.headline3,
            ),
            children: [
              ListTile(
                title: Text(
                  'A soft drink is a drink that usually contains water (often carbonated), a sweetener, and a natural and/or artificial flavoring. The sweetener may be a sugar, high-fructose corn syrup, fruit juice, a sugar substitute (in the case of diet drinks), or some combination of these. Soft drinks may also contain caffeine, colorings, preservatives, and/or other ingredients.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ExpansionTile(
            title: Text(
              'Delivery information',
              style: Theme.of(context).textTheme.headline3,
            ),
            children: [
              ListTile(
                title: Text(
                  'A soft drink is a drink that usually contains water (often carbonated), a sweetener, and a natural and/or artificial flavoring. The sweetener may be a sugar, high-fructose corn syrup, fruit juice, a sugar substitute (in the case of diet drinks), or some combination of these. Soft drinks may also contain caffeine, colorings, preservatives, and/or other ingredients.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
