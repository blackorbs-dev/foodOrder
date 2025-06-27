// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CartItemStruct extends FFFirebaseStruct {
  CartItemStruct({
    String? name,
    int? calories,
    String? image,
    int? quantity,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _calories = calories,
        _image = image,
        _quantity = quantity,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  set calories(int? val) => _calories = val;

  void incrementCalories(int amount) => calories = calories + amount;

  bool hasCalories() => _calories != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  static CartItemStruct fromMap(Map<String, dynamic> data) => CartItemStruct(
        name: data['name'] as String?,
        calories: castToType<int>(data['calories']),
        image: data['image'] as String?,
        quantity: castToType<int>(data['quantity']),
      );

  static CartItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? CartItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'calories': _calories,
        'image': _image,
        'quantity': _quantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'calories': serializeParam(
          _calories,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
      }.withoutNulls;

  static CartItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartItemStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        calories: deserializeParam(
          data['calories'],
          ParamType.int,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CartItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartItemStruct &&
        name == other.name &&
        calories == other.calories &&
        image == other.image &&
        quantity == other.quantity;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, calories, image, quantity]);
}

CartItemStruct createCartItemStruct({
  String? name,
  int? calories,
  String? image,
  int? quantity,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartItemStruct(
      name: name,
      calories: calories,
      image: image,
      quantity: quantity,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartItemStruct? updateCartItemStruct(
  CartItemStruct? cartItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartItemStructData(
  Map<String, dynamic> firestoreData,
  CartItemStruct? cartItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartItem == null) {
    return;
  }
  if (cartItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartItemData = getCartItemFirestoreData(cartItem, forFieldValue);
  final nestedData = cartItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartItemFirestoreData(
  CartItemStruct? cartItem, [
  bool forFieldValue = false,
]) {
  if (cartItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartItem.toMap());

  // Add any Firestore field values
  cartItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartItemListFirestoreData(
  List<CartItemStruct>? cartItems,
) =>
    cartItems?.map((e) => getCartItemFirestoreData(e, true)).toList() ?? [];
