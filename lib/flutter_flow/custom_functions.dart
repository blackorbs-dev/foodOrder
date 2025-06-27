import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

bool isInCart(
  List<CartItemStruct> cartItems,
  String itemName,
) {
  // check if app state variable cartItems contains a item with specified name property value
  return cartItems.any((item) => item.name == itemName);
}

int amountInCart(
  List<CartItemStruct> cartItems,
  String itemName,
) {
  // find the item with the specified name parameter and return the amountInCart parameter value of that item or zero if item is not in the list
// Find the item with the specified name and return its cartAmount or zero if not found
  final item = cartItems.firstWhere(
    (item) => item.name == itemName,
    orElse: () =>
        CartItemStruct(), // Return a default CartItemStruct if not found
  );
  return item.quantity; // Return the cartAmount of the found item
}

int getCartItemIndex(
  List<CartItemStruct> cartItems,
  String itemName,
) {
  // get the index of the item
// Find the index of the item with the specified name parameter
  return cartItems.indexWhere((item) => item.name == itemName);
}

bool isUserDetailsComplete(UserDetailsStruct? userDetails) {
  // return true if all the parameters of userDetails has been set, otherwise return false
  return userDetails != null &&
      userDetails.hasGender() &&
      userDetails.hasWeight() &&
      userDetails.hasHeight() &&
      userDetails.hasAge();
}

int getTotalCaloroes(UserDetailsStruct userDetails) {
  // - **For women**, calories = ((655.1) + (9.56 x [USER weight in KG]) + (1.85 x [USER height in cm]) - (4.67 x USER age in years]))- **For men**, calories= ((666.47) + (13.75 x [USER weight in KG]) + (5 x [USER height in cm]) - (6.75 x [USER age in years]))
  if (!isUserDetailsComplete(userDetails)) {
    return 0; // Return 0 if user details are incomplete
  }

  double calories;
  if (userDetails.gender == Gender.Female) {
    calories = (655.1) +
        (9.56 * userDetails.weight) +
        (1.85 * userDetails.height) -
        (4.67 * userDetails.age);
  } else {
    calories = (666.47) +
        (13.75 * userDetails.weight) +
        (5 * userDetails.height) -
        (6.75 * userDetails.age);
  }

  return calories.round();
}

int getCurrentCalories(List<CartItemStruct> cartItems) {
  // get the total calories, take the item quantity into consideration
  int totalCalories = 0; // Initialize total calories
  for (var item in cartItems) {
    totalCalories += item.calories * item.quantity; // Calculate total calories
  }
  return totalCalories; // Return the total calories
}

int getTotalPrice(
  List<CartItemStruct> cartItems,
  int price,
) {
  // get total price
  int totalPrice = 0;
  for (var item in cartItems) {
    totalPrice += item.quantity * price;
  }
  return totalPrice;
}

bool isHealthyOrder(
  int currentCalories,
  int totalCalories,
) {
  // return true if current is with 10% below or above total, otherwise false
  return (currentCalories >= totalCalories * 0.9) &&
      (currentCalories <= totalCalories * 1.1);
}

List<CartItemRequestDataStruct> mapToRequestData(
  List<CartItemStruct> cartItems,
  int price,
) {
  // map to CartIteRequestData, name, total_price, quantity
  return cartItems.map((item) {
    return CartItemRequestDataStruct(
      name: item.name,
      totalPrice: item.quantity * price,
      quantity: item.quantity,
    );
  }).toList();
}
