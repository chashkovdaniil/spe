import 'package:cloud_firestore/cloud_firestore.dart';

class StorageService {
  final _db = FirebaseFirestore.instance;

  Future<Document> add(String path, Map<String, dynamic> model) async {
    final doc = await _db.collection(path).add(model);
    final ref = await doc.get();

    return Document(
      data: ref.data() ?? {},
      path: doc.path,
    );
  }

  Future<Document?> get(String path) async {
    final doc = await _getDocument(path);
    return doc;
  }

  Future<List<Document?>> getAll(String path) async {
    final docs = await _getAllDocuments(path);

    return docs;
  }

  Future<void> delete(String path) async {
    await _db.doc(path).delete();
  }

  Future<Document> _getDocument(String path) async {
    final ref = await _db.doc(path).get();
    final data = ref.data();

    return Document(
      data: data ?? {},
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
  final Map<String, dynamic> data;

  const Document({
    required this.data,
    required this.path,
  });
}
