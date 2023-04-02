// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Author _$$_AuthorFromJson(Map<String, dynamic> json) => _$_Author(
      member:
          ProfessionalMember.fromJson(json['member'] as Map<String, dynamic>),
      year: json['year'] as int,
      speManuscriptNumber: json['speManuscriptNumber'] as int,
      paperTitle: json['paperTitle'] as String,
    );

Map<String, dynamic> _$$_AuthorToJson(_$_Author instance) => <String, dynamic>{
      'member': instance.member,
      'year': instance.year,
      'speManuscriptNumber': instance.speManuscriptNumber,
      'paperTitle': instance.paperTitle,
    };
