import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

typedef DownloadLink = Future<String> Function();
typedef UploadInPercent = Stream<double>;
typedef SavingData = (DownloadLink, UploadInPercent);

class StorageService {
  final _instance = FirebaseStorage.instance;

  StorageService() {
    assert(() {
      // _instance.useStorageEmulator('127.0.0.1', 9199);
      return true;
    }());
  }

  SavingData saveFile(
    String path,
    File file, [
    SettableMetadata? metadata,
  ]) {
    final ref = _instance.ref().child(path);
    final task = ref.putFile(file, metadata);

    return (() => task.snapshot.ref.getDownloadURL(), _getResult(task));
  }

  SavingData saveBytesAsFile(
    String path,
    Uint8List data, [
    SettableMetadata? metadata,
  ]) {
    final ref = _instance.ref().child(path);
    final task = ref.putData(data, metadata);

    return (() => task.snapshot.ref.getDownloadURL(), _getResult(task));
  }

  UploadInPercent _getResult(UploadTask task) {
    final bytesTransferedStream = task.snapshotEvents.map(
      (snapshot) =>
          (snapshot.bytesTransferred / snapshot.totalBytes).clamp(0.0, 1.0),
    );
    return bytesTransferedStream;
  }
}
