import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<CartItemStruct> _cartItems = [];
  List<CartItemStruct> get cartItems => _cartItems;
  set cartItems(List<CartItemStruct> value) {
    _cartItems = value;
  }

  void addToCartItems(CartItemStruct value) {
    cartItems.add(value);
  }

  void removeFromCartItems(CartItemStruct value) {
    cartItems.remove(value);
  }

  void removeAtIndexFromCartItems(int index) {
    cartItems.removeAt(index);
  }

  void updateCartItemsAtIndex(
    int index,
    CartItemStruct Function(CartItemStruct) updateFn,
  ) {
    cartItems[index] = updateFn(_cartItems[index]);
  }

  void insertAtIndexInCartItems(int index, CartItemStruct value) {
    cartItems.insert(index, value);
  }

  int _totalCalories = 0;
  int get totalCalories => _totalCalories;
  set totalCalories(int value) {
    _totalCalories = value;
  }
}
