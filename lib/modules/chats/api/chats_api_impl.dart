import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/state/app_state_holder.dart';
import '../../../core/utils.dart';
import '../../../models/app_state.dart';
import '../../../models/professional_member.dart';
import '../../../services/firstore_service.dart';
import '../domain/models/chat.dart';
import '../domain/models/chat_message.dart';
import 'chats_api.dart';

class ChatsApiImpl implements ChatsApi {
  final FirestoreService _storageService;
  final AppStateHolder _appStateHolder;

  ChatsApiImpl(this._storageService, this._appStateHolder);

  @override
  Future<void> addMembers(Chat chat, List<ProfessionalMember> members) {
    // TODO: implement addMembers
    throw UnimplementedError();
  }

  @override
  Future<void> createChat(String name, List<ProfessionalMember> members) async {
    final currentMember = _appStateHolder.member;

    if (currentMember == null) {
      return;
    }

    final chat = Chat(
      id: uuid.v4(),
      name: name,
      members: [currentMember, ...members],
      createdAt: DateTime.now(),
      messages: [],
    );
    final chatAsJson = chat.toJson();
    chatAsJson['members'] = chat.members?.map((e) => e.ref);
    await _storageService.add(
        CollectionPaths.chats.path, id: chat.id, chatAsJson);
  }

  @override
  Future<void> deleteChat(String name, List<ProfessionalMember> members) {
    // TODO: implement deleteChat
    throw UnimplementedError();
  }

  @override
  Future<void> removeMembers(Chat chat, List<ProfessionalMember> members) {
    // TODO: implement removeMembers
    throw UnimplementedError();
  }

  @override
  Future<void> sendMessage(Chat chat, String message) async {
    final sender = _appStateHolder.member;
    if (sender == null) {
      return;
    }
    final chatMessage = ChatMessage(
      id: uuid.v4(),
      sentAt: DateTime.now(),
      message: message,
      sender: sender,
    );
    final path = '${CollectionPaths.chats.path}/${chat.id}'
        '${CollectionPaths.chatMessages.path}';

    final messageAsJson = chatMessage.toJson();
    messageAsJson['sender'] = chatMessage.sender.ref;
    await _storageService.add(path, messageAsJson, id: chatMessage.id);
  }

  @override
  Future<Chat?> chat({String? id}) async {
    final currentMember = _appStateHolder.member;
    if (currentMember == null) {
      throw StateError('Current user is null');
    }

    final doc = await _storageService.get('${CollectionPaths.chats.path}/$id');
    final data = doc?.data;

    if (data == null) {
      return null;
    }
    final members = data['members'] as List<Object?>;

    data['members'] = await members.toProfessionalMembersJson();

    return Chat.fromJson(data);
  }

  @override
  Future<List<Chat>> chats() async {
    final currentMember = _appStateHolder.member;
    if (currentMember == null) {
      throw StateError('Current user is null');
    }

    final docs = await _storageService.find(
      CollectionPaths.chats,
      'members',
      arrayContains: currentMember.ref,
    );

    return docs.map((doc) {
      doc.data?['members'] = null;
      doc.data?['messages'] = null;

      if (doc.data == null) {
        throw StateError('Chat is null');
      }
      return Chat.fromDocument(doc);
    }).toList();
  }

  @override
  Stream<List<Chat>> get chatsStream {
    final member = _appStateHolder.member;
    if (member == null) {
      throw StateError('Current member is null');
    }
    return _storageService
        .streamWhere(
          CollectionPaths.chats.path,
          'members',
          arrayContains: member.ref,
        )
        .map((documents) => documents.map((doc) {
              doc.data?['members'] = null;
              doc.data?['messages'] = null;

              return Chat.fromDocument(doc);
            }).toList());
  }

  @override
  Stream<List<ChatMessage>> messagesStream(String chatId) {
    final currentMember = _appStateHolder.member;
    if (currentMember == null) {
      throw StateError('Current user is null');
    }

    return _storageService
        .documentsStream(
      '${CollectionPaths.chats.path}/$chatId'
      '${CollectionPaths.chatMessages.path}',
      orderByField: 'sentAt',
    )
        .asyncMap((documents) async {
      final messages = <ChatMessage>[];
      for (final doc in documents) {
        final data = doc.data;
        if (data == null) {
          throw StateError('Firstore has null value');
        }
        final senderRef = data['sender'] as DocumentReference;
        final senderSnapshot = await senderRef.get();
        data['sender'] = senderSnapshot.data() as Map<String, Object?>;
        messages.add(ChatMessage.fromJson(data));
      }

      return messages;
    });
  }

  @override
  Future<List<Chat>> allChats() async {
    final currentMember = _appStateHolder.member;
    if (currentMember == null) {
      throw StateError('Current user is null');
    }

    final docs = await _storageService.find(
      CollectionPaths.chats,
      'members',
    );

    return docs.map((doc) {
      doc.data?['members'] = null;
      doc.data?['messages'] = null;

      if (doc.data == null) {
        throw StateError('Chat is null');
      }
      return Chat.fromDocument(doc);
    }).toList();
  }
}
