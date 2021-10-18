import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/models.dart';
import 'package:e_commerce_app/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishListLoading());

  Stream<WishlistState> _mapWishlistStartedToState() async* {
    yield WishListLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield WishListLoaded();
    } catch (_) {
      yield WishListError();
    }
  }


  Stream<WishlistState> _mapWishlistProductAddedToState(
      WishlistProductAdded event,
      WishlistState state,) async* {
    if (state is WishListLoaded) {
      try {
        yield WishListLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)
              ..add(event.product),
          ),
        );
      } on Exception {
        yield WishListError();
      }
    }
  }

  Stream<WishlistState> _mapWishlistProductRemovedToState(
      WishlistProductRemoved event,
      WishlistState state,) async* {
    if (state is WishListLoaded) {
      try {
        yield WishListLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)
              ..remove(event.product),
          ),
        );
      } on Exception {
        yield WishListError();
      }
    }
  }

  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event,) async* {
    if (event is WishlistStarted) {
      yield* _mapWishlistStartedToState();
    }
    else if (event is WishlistProductAdded) {
      yield* _mapWishlistProductAddedToState(event, state);
    }
    else if (event is WishlistProductRemoved) {
      yield* _mapWishlistProductRemovedToState(event, state);
    }
  }
}