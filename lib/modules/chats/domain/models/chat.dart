import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/professional_member.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    required String name,
    required List<ProfessionalMember> members,
    required DateTime createdAt,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
