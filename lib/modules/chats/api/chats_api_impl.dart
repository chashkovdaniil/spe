import '../../../models/professional_member.dart';
import '../domain/models/chat.dart';
import '../domain/models/chat_message.dart';
import 'chats_api.dart';

class ChatsApiImpl implements ChatsApi {
  @override
  Future<void> addMembers(Chat chat, List<ProfessionalMember> members) {
    // TODO: implement addMembers
    throw UnimplementedError();
  }

  @override
  Future<void> createChat(String name, List<ProfessionalMember> members) {
    // TODO: implement createChat
    throw UnimplementedError();
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
  Future<void> sendMessage(Chat chat, ChatMessage message) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}
