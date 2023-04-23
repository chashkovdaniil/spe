import '../../../models/professional_member.dart';
import '../domain/models/chat.dart';
import '../domain/models/chat_message.dart';

abstract class ChatsApi {
  Future<List<Chat>> chats();

  Future<Chat?> chat({String? id});

  Future<void> createChat(String name, List<ProfessionalMember> members);

  Future<void> addMembers(Chat chat, List<ProfessionalMember> members);

  Future<void> removeMembers(Chat chat, List<ProfessionalMember> members);

  Future<void> sendMessage(Chat chat, ChatMessage message);

  Future<void> deleteChat(String name, List<ProfessionalMember> members);

  Stream<List<Chat>> get chatsStream;
}
