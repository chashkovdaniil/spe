import 'package:freezed_annotation/freezed_annotation.dart';
import 'professional_member.dart';

part 'award_recipient.freezed.dart';
part 'award_recipient.g.dart';

@freezed
class AwardRecipient with _$AwardRecipient {
  const factory AwardRecipient({
    required ProfessionalMember member,
    required int year,
    required String award,
  }) = _AwardRecipient;

  factory AwardRecipient.fromJson(Map<String, dynamic> json) =>
      _$AwardRecipientFromJson(json);
}
