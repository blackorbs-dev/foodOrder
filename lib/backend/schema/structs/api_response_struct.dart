// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ApiResponseStruct extends FFFirebaseStruct {
  ApiResponseStruct({
    bool? result,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _result = result,
        super(firestoreUtilData);

  // "result" field.
  bool? _result;
  bool get result => _result ?? false;
  set result(bool? val) => _result = val;

  bool hasResult() => _result != null;

  static ApiResponseStruct fromMap(Map<String, dynamic> data) =>
      ApiResponseStruct(
        result: data['result'] as bool?,
      );

  static ApiResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? ApiResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'result': _result,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'result': serializeParam(
          _result,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ApiResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      ApiResponseStruct(
        result: deserializeParam(
          data['result'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ApiResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ApiResponseStruct && result == other.result;
  }

  @override
  int get hashCode => const ListEquality().hash([result]);
}

ApiResponseStruct createApiResponseStruct({
  bool? result,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ApiResponseStruct(
      result: result,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ApiResponseStruct? updateApiResponseStruct(
  ApiResponseStruct? apiResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    apiResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addApiResponseStructData(
  Map<String, dynamic> firestoreData,
  ApiResponseStruct? apiResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (apiResponse == null) {
    return;
  }
  if (apiResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && apiResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final apiResponseData =
      getApiResponseFirestoreData(apiResponse, forFieldValue);
  final nestedData =
      apiResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = apiResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getApiResponseFirestoreData(
  ApiResponseStruct? apiResponse, [
  bool forFieldValue = false,
]) {
  if (apiResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(apiResponse.toMap());

  // Add any Firestore field values
  apiResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getApiResponseListFirestoreData(
  List<ApiResponseStruct>? apiResponses,
) =>
    apiResponses?.map((e) => getApiResponseFirestoreData(e, true)).toList() ??
    [];
