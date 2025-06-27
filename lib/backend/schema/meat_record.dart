import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeatRecord extends FirestoreRecord {
  MeatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "food_name" field.
  String? _foodName;
  String get foodName => _foodName ?? '';
  bool hasFoodName() => _foodName != null;

  // "calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  bool hasCalories() => _calories != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  void _initializeFields() {
    _foodName = snapshotData['food_name'] as String?;
    _calories = castToType<int>(snapshotData['calories']);
    _imageUrl = snapshotData['image_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meat');

  static Stream<MeatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeatRecord.fromSnapshot(s));

  static Future<MeatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeatRecord.fromSnapshot(s));

  static MeatRecord fromSnapshot(DocumentSnapshot snapshot) => MeatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeatRecordData({
  String? foodName,
  int? calories,
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'food_name': foodName,
      'calories': calories,
      'image_url': imageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeatRecordDocumentEquality implements Equality<MeatRecord> {
  const MeatRecordDocumentEquality();

  @override
  bool equals(MeatRecord? e1, MeatRecord? e2) {
    return e1?.foodName == e2?.foodName &&
        e1?.calories == e2?.calories &&
        e1?.imageUrl == e2?.imageUrl;
  }

  @override
  int hash(MeatRecord? e) =>
      const ListEquality().hash([e?.foodName, e?.calories, e?.imageUrl]);

  @override
  bool isValidKey(Object? o) => o is MeatRecord;
}
