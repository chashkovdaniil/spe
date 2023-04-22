import 'package:cloud_firestore/cloud_firestore.dart';

enum CollectionPaths {
  users('/users'),
  chats('/chats');

  final String path;

  const CollectionPaths(this.path);
}

class StorageService {
  final _db = FirebaseFirestore.instance;

  Future<void> init() async {
    _db.useFirestoreEmulator('127.0.0.1', 8080);
  }

  Future<Document> add(
    CollectionPaths collectionPath,
    String id,
    Map<String, Object?> model,
  ) async {
    final docPath = '${collectionPath.path}/$id';
    await _db.doc(docPath).set(model);

    return Document(
      data: model,
      path: docPath,
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
        .map((doc) => Document(data: doc.data(), path: doc.reference.path))
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
    final ref = await _db.doc(path).get();
    final data = ref.data();
    if (data == null) {
      return null;
    }
    return Document(
      data: data,
      path: ref.reference.path,
    );
  }

  Future<List<Document>> _getAllDocuments(String path) async {
    final result = await _db.collection(path).get();
    final docs = result.docs;

    return docs
        .map((doc) => Document(
              data: doc.data(),
              path: doc.reference.path,
            ))
        .toList();
  }
}

class Document {
  final String path;
  final Map<String, Object?>? data;

  const Document({
    required this.data,
    required this.path,
  });
}
