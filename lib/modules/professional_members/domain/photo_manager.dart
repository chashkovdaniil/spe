import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import '../../../core/state/app_state_holder.dart';
import '../../../models/professional_member.dart';
import '../../../services/storage_service.dart';
import '../api/professional_members_api.dart';
import 'professional_member_manager.dart';

class PhotoManager {
  final StorageService _storageService;
  final AppStateHolder _appStateHolder;
  final ProfessionalMemberManager _professionalMemberManager;

  PhotoManager(
    this._storageService,
    this._appStateHolder,
    this._professionalMemberManager,
  );

  Future<void> pickAndSavePhoto() async {
    final pickResult = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    final file = pickResult?.files.firstOrNull;
    if (file == null) {
      return;
    }
    final bytes = file.bytes;
    final path = file.path;
    if (bytes != null) {
      savePhoto(bytes);
    } else if (path != null) {
      final fileForUpload = File(path);
      saveFileAsPhoto(fileForUpload);
    }
  }

  Future<void> saveFileAsPhoto(File file) async {
    final currentMember = _appStateHolder.member;

    if (currentMember != null) {
      final currentUserId = currentMember.id;
      final (path, uploadStream) = _storageService.saveFile(
        '/users/$currentUserId/photo/photo-${DateTime.now().toString()}.jpg',
        file,
        SettableMetadata(contentType: 'image/jpeg'),
      );

      final sub = uploadStream.distinct().listen((event) async {
        if (event == 1) {
          final photoUrl = await path();
          _professionalMemberManager.updateAndSaveMember(
            currentMember.copyWith(
              photoUrl: photoUrl,
            ),
          );
        }
      });
      sub.onDone(() {
        sub.cancel();
      });
    }
  }

  Future<void> savePhoto(Uint8List data) async {
    final currentMember = _appStateHolder.member;

    if (currentMember != null) {
      final currentUserId = currentMember.id;
      final (path, uploadStream) = _storageService.saveBytesAsFile(
        '/users/$currentUserId/photo/photo-${DateTime.now().toString()}.jpg',
        data,
        SettableMetadata(contentType: 'image/jpeg'),
      );

      final sub = uploadStream.distinct().listen((event) async {
        if (event == 1) {
          final photoUrl = await path();
          _professionalMemberManager.updateAndSaveMember(
            currentMember.copyWith(
              photoUrl: photoUrl,
            ),
          );
        }
      });
      sub.onDone(() {
        sub.cancel();
      });
    }
  }
}
