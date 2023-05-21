// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professional_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfessionalMember _$$_ProfessionalMemberFromJson(
        Map<String, dynamic> json) =>
    _$_ProfessionalMember(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      patronymic: json['patronymic'] as String,
      currentMember: json['currentMember'] as bool,
      yearsOfMembership: json['yearsOfMembership'] as int,
      memberSince: DateTime.parse(json['memberSince'] as String),
      paidThrough: DateTime.parse(json['paidThrough'] as String),
      specialMembershipCategory: json['specialMembershipCategory'] as String,
      newMember: json['newMember'] as bool,
      recentGrad: json['recentGrad'] as bool,
      youngProfessional: json['youngProfessional'] as bool,
      seniorProfessional: json['seniorProfessional'] as bool,
      transferFrom: json['transferFrom'] as String,
      affiliateMember: json['affiliateMember'] as bool,
      awardRecipient: json['awardRecipient'] as bool,
      author: json['author'] as bool,
      currentOrPastVolunteer: json['currentOrPastVolunteer'] as bool,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      primaryEmployer: json['primaryEmployer'] as String,
      primaryTechinalDiscipline: json['primaryTechinalDiscipline'] as String,
      jobClassification: json['jobClassification'] as String,
      companyCategory: json['companyCategory'] as String,
      email: json['email'] as String,
      role:
          $enumDecodeNullable(_$ProfessionalMemberRolesEnumMap, json['role']) ??
              ProfessionalMemberRoles.user,
    );

Map<String, dynamic> _$$_ProfessionalMemberToJson(
        _$_ProfessionalMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'patronymic': instance.patronymic,
      'currentMember': instance.currentMember,
      'yearsOfMembership': instance.yearsOfMembership,
      'memberSince': instance.memberSince.toIso8601String(),
      'paidThrough': instance.paidThrough.toIso8601String(),
      'specialMembershipCategory': instance.specialMembershipCategory,
      'newMember': instance.newMember,
      'recentGrad': instance.recentGrad,
      'youngProfessional': instance.youngProfessional,
      'seniorProfessional': instance.seniorProfessional,
      'transferFrom': instance.transferFrom,
      'affiliateMember': instance.affiliateMember,
      'awardRecipient': instance.awardRecipient,
      'author': instance.author,
      'currentOrPastVolunteer': instance.currentOrPastVolunteer,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'primaryEmployer': instance.primaryEmployer,
      'primaryTechinalDiscipline': instance.primaryTechinalDiscipline,
      'jobClassification': instance.jobClassification,
      'companyCategory': instance.companyCategory,
      'email': instance.email,
      'role': _$ProfessionalMemberRolesEnumMap[instance.role]!,
    };

const _$ProfessionalMemberRolesEnumMap = {
  ProfessionalMemberRoles.user: 'user',
  ProfessionalMemberRoles.admin: 'admin',
};
