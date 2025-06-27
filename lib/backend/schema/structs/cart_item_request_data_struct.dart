// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CartItemRequestDataStruct extends FFFirebaseStruct {
  CartItemRequestDataStruct({
    String? name,
    int? totalPrice,
    int? quantity,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _totalPrice = totalPrice,
        _quantity = quantity,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "total_price" field.
  int? _totalPrice;
  int get totalPrice => _totalPrice ?? 0;
  set totalPrice(int? val) => _totalPrice = val;

  void incrementTotalPrice(int amount) => totalPrice = totalPrice + amount;

  bool hasTotalPrice() => _totalPrice != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  static CartItemRequestDataStruct fromMap(Map<String, dynamic> data) =>
      CartItemRequestDataStruct(
        name: data['name'] as String?,
        totalPrice: castToType<int>(data['total_price']),
        quantity: castToType<int>(data['quantity']),
      );

  static CartItemRequestDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CartItemRequestDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'total_price': _totalPrice,
        'quantity': _quantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'total_price': serializeParam(
          _totalPrice,
          ParamType.int,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
      }.withoutNulls;

  static CartItemRequestDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CartItemRequestDataStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        totalPrice: deserializeParam(
          data['total_price'],
          ParamType.int,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CartItemRequestDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartItemRequestDataStruct &&
        name == other.name &&
        totalPrice == other.totalPrice &&
        quantity == other.quantity;
  }

  @override
  int get hashCode => const ListEquality().hash([name, totalPrice, quantity]);
}

CartItemRequestDataStruct createCartItemRequestDataStruct({
  String? name,
  int? totalPrice,
  int? quantity,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartItemRequestDataStruct(
      name: name,
      totalPrice: totalPrice,
      quantity: quantity,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartItemRequestDataStruct? updateCartItemRequestDataStruct(
  CartItemRequestDataStruct? cartItemRequestData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartItemRequestData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartItemRequestDataStructData(
  Map<String, dynamic> firestoreData,
  CartItemRequestDataStruct? cartItemRequestData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartItemRequestData == null) {
    return;
  }
  if (cartItemRequestData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartItemRequestData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartItemRequestDataData =
      getCartItemRequestDataFirestoreData(cartItemRequestData, forFieldValue);
  final nestedData =
      cartItemRequestDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      cartItemRequestData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartItemRequestDataFirestoreData(
  CartItemRequestDataStruct? cartItemRequestData, [
  bool forFieldValue = false,
]) {
  if (cartItemRequestData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartItemRequestData.toMap());

  // Add any Firestore field values
  cartItemRequestData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartItemRequestDataListFirestoreData(
  List<CartItemRequestDataStruct>? cartItemRequestDatas,
) =>
    cartItemRequestDatas
        ?.map((e) => getCartItemRequestDataFirestoreData(e, true))
        .toList() ??
    [];
