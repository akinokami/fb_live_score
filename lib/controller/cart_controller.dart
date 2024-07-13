import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/status_model.dart';

class CartController extends GetxController {
  final box = GetStorage();
  RxList<Elements> cartList = <Elements>[].obs;
  final cart = ''.obs;

  @override
  void onInit() {
    getCarts();
    super.onInit();
  }

  void getCarts() {
    cart.value = box.read('carts') ?? '[]';
    cartList.addAll(jsonDecode(cart.value).map<Elements>((item) {
      return Elements.fromJson(item);
    }));
  }

  void addToCart(Elements cartItem) {
    cartList.contains(cartItem)
        ? cartList.remove(cartItem)
        : cartList.add(cartItem);
    box.write('carts', jsonEncode(cartList));
    cart.value = box.read('carts') ?? '[]';
    print(cart.value);
  }

  // void removeFromCart(Elements cartItem) {
  //   cartList.remove(cartItem);
  //   box.write('carts', jsonEncode(cartList));
  // }
}
