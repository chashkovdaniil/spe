import 'package:cloud_firestore/cloud_firestore.dart';

enum CollectionPaths {
  users('/users'),
  chats('/chats'),
  chatMessages('/messages');

  final String path;

  const CollectionPaths(this.path);
}

class StorageService {
  final _db = FirebaseFirestore.instance;

  Future<void> init() async {
    _db.useFirestoreEmulator('127.0.0.1', 9001);
  }

  Future<Document> add(
    String collectionPath,
    Map<String, Object?> model, {
    String? id,
  }) async {
    if (id == null) {
      final ref = await _db.collection(collectionPath).add(model);
      return Document(
        data: model,
        ref: ref,
      );
    }

    final docPath = '$collectionPath/$id';
    final ref = _db.doc(docPath);
    await ref.set(model);

    return Document(
      data: model,
      ref: ref,
    );
  }

  Future<Document?> findOne(
    CollectionPaths collectionPath,
    Object field, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    Iterable<Object?>? arrayContainsAny,
    Iterable<Object?>? whereIn,
    Iterable<Object?>? whereNotIn,
    bool? isNull,
    int? limit,
  }) async {
    final docs = await find(
      collectionPath,
      field,
      isEqualTo: isEqualTo,
      isNotEqualTo: isNotEqualTo,
      isLessThan: isLessThan,
      isLessThanOrEqualTo: isLessThanOrEqualTo,
      isGreaterThan: isGreaterThan,
      arrayContains: arrayContains,
      arrayContainsAny: arrayContainsAny,
      whereIn: whereIn,
      whereNotIn: whereNotIn,
      isNull: isNull,
      limit: 1,
    );
    if (docs.isNotEmpty) {
      return docs.first;
    }
    return null;
  }

  Future<List<Document>> find(
    CollectionPaths collectionPath,
    Object field, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    Iterable<Object?>? arrayContainsAny,
    Iterable<Object?>? whereIn,
    Iterable<Object?>? whereNotIn,
    bool? isNull,
    int? limit,
  }) async {
    var query = _db.collection(collectionPath.path).where(
          field,
          isEqualTo: isEqualTo,
          isNotEqualTo: isNotEqualTo,
          isLessThan: isLessThan,
          isLessThanOrEqualTo: isLessThanOrEqualTo,
          isGreaterThan: isGreaterThan,
          arrayContains: arrayContains,
          arrayContainsAny: arrayContainsAny,
          whereIn: whereIn,
          whereNotIn: whereNotIn,
          isNull: isNull,
        );
    if (limit != null) {
      query = query.limit(limit);
    }

    final snapshot = await query.get();

    return snapshot.docs
        .map((doc) => Document(data: doc.data(), ref: doc.reference))
        .toList();
  }

  Future<bool> update(String docPath, Map<String, Object?> model) async {
    try {
      await _db.doc(docPath).update(model);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<Document?> get(String path) async {
    final doc = await _getDocument(path);
    return doc;
  }

  Future<List<Document?>> getAll(CollectionPaths collectionPath) async {
    final docs = await _getAllDocuments(collectionPath.path);

    return docs;
  }

  Future<bool> delete(String path) async {
    try {
      await _db.doc(path).delete();
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<Document?> _getDocument(String path) async {
    final snapshot = await _db.doc(path).get();
    final data = snapshot.data();
    if (data == null) {
      return null;
    }
    return Document(
      data: data,
      ref: snapshot.reference,
    );
  }

  Future<List<Document>> _getAllDocuments(String path) async {
    final result = await _db.collection(path).get();
    final docs = result.docs;

    return docs
        .map((doc) => Document(
              data: doc.data(),
              ref: doc.reference,
            ))
        .toList();
  }

  Stream<List<Document>> documentsStream(
    String collectionPath, {
    String? orderByField,
    bool descending = true,
  }) {
    final collectionRef = _db.collection(collectionPath);
    Query? query;
    if (orderByField != null) {
      query = collectionRef.orderBy(orderByField, descending: descending);
    }
    return (query ?? collectionRef)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final data = doc.data() as Map<String, Object?>;

              return Document(data: data, ref: doc.reference);
            }).toList());
  }

  Stream<Document> documentStream(String docPath) {
    final docRef = _db.doc(docPath);
    return docRef.snapshots().map((doc) {
      final data = doc.data() as Map<String, Object?>;

      return Document(data: data, ref: doc.reference);
    });
  }

  Stream<List<Document>> streamWhere(
    String collectionPath,
    Object field, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    Iterable<Object?>? arrayContainsAny,
    Iterable<Object?>? whereIn,
    Iterable<Object?>? whereNotIn,
    bool? isNull,
    int? limit,
  }) =>
      _db
          .collection(collectionPath)
          .where(
            field,
            isEqualTo: isEqualTo,
            isNotEqualTo: isNotEqualTo,
            isLessThan: isLessThan,
            isLessThanOrEqualTo: isLessThanOrEqualTo,
            isGreaterThan: isGreaterThan,
            arrayContains: arrayContains,
            arrayContainsAny: arrayContainsAny,
            whereIn: whereIn,
            whereNotIn: whereNotIn,
            isNull: isNull,
          )
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => Document(data: doc.data(), ref: doc.reference))
                .toList(),
          );
}

class Document<T> {
  final DocumentReference ref;
  final Map<String, Object?>? data;

  const Document({required this.data, required this.ref});
}
