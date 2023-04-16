import 'package:cloud_firestore/cloud_firestore.dart';

enum CollectionPaths {
  users('/users');

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
