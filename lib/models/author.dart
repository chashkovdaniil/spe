import 'package:freezed_annotation/freezed_annotation.dart';
import 'professional_member.dart';

part 'author.freezed.dart';
part 'author.g.dart';

@freezed
class Author with _$Author {
  const factory Author({
    required ProfessionalMember member,
    required int year,
    required int speManuscriptNumber,
    required String paperTitle,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
