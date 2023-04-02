import 'package:freezed_annotation/freezed_annotation.dart';

import 'professional_member.dart';

part 'education.freezed.dart';
part 'education.g.dart';

@freezed
class Education with _$Education {
  const factory Education({
    required ProfessionalMember member,
    required String degree,
    required String fieldOfStudy,
    required String university,
    required DateTime graduationDate,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}
