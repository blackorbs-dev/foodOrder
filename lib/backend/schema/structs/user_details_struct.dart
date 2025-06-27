// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDetailsStruct extends FFFirebaseStruct {
  UserDetailsStruct({
    Gender? gender,
    double? weight,
    double? height,
    double? age,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _gender = gender,
        _weight = weight,
        _height = height,
        _age = age,
        super(firestoreUtilData);

  // "gender" field.
  Gender? _gender;
  Gender? get gender => _gender;
  set gender(Gender? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;

  void incrementWeight(double amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  set height(double? val) => _height = val;

  void incrementHeight(double amount) => height = height + amount;

  bool hasHeight() => _height != null;

  // "age" field.
  double? _age;
  double get age => _age ?? 0.0;
  set age(double? val) => _age = val;

  void incrementAge(double amount) => age = age + amount;

  bool hasAge() => _age != null;

  static UserDetailsStruct fromMap(Map<String, dynamic> data) =>
      UserDetailsStruct(
        gender: data['gender'] is Gender
            ? data['gender']
            : deserializeEnum<Gender>(data['gender']),
        weight: castToType<double>(data['weight']),
        height: castToType<double>(data['height']),
        age: castToType<double>(data['age']),
      );

  static UserDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'gender': _gender?.serialize(),
        'weight': _weight,
        'height': _height,
        'age': _age,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'gender': serializeParam(
          _gender,
          ParamType.Enum,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'height': serializeParam(
          _height,
          ParamType.double,
        ),
        'age': serializeParam(
          _age,
          ParamType.double,
        ),
      }.withoutNulls;

  static UserDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDetailsStruct(
        gender: deserializeParam<Gender>(
          data['gender'],
          ParamType.Enum,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.double,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'UserDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDetailsStruct &&
        gender == other.gender &&
        weight == other.weight &&
        height == other.height &&
        age == other.age;
  }

  @override
  int get hashCode => const ListEquality().hash([gender, weight, height, age]);
}

UserDetailsStruct createUserDetailsStruct({
  Gender? gender,
  double? weight,
  double? height,
  double? age,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserDetailsStruct(
      gender: gender,
      weight: weight,
      height: height,
      age: age,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserDetailsStruct? updateUserDetailsStruct(
  UserDetailsStruct? userDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserDetailsStructData(
  Map<String, dynamic> firestoreData,
  UserDetailsStruct? userDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userDetails == null) {
    return;
  }
  if (userDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userDetailsData =
      getUserDetailsFirestoreData(userDetails, forFieldValue);
  final nestedData =
      userDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserDetailsFirestoreData(
  UserDetailsStruct? userDetails, [
  bool forFieldValue = false,
]) {
  if (userDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userDetails.toMap());

  // Add any Firestore field values
  userDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserDetailsListFirestoreData(
  List<UserDetailsStruct>? userDetailss,
) =>
    userDetailss?.map((e) => getUserDetailsFirestoreData(e, true)).toList() ??
    [];
