// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Education _$EducationFromJson(Map<String, dynamic> json) {
  return _Education.fromJson(json);
}

/// @nodoc
mixin _$Education {
  ProfessionalMember get member => throw _privateConstructorUsedError;
  String get degree => throw _privateConstructorUsedError;
  String get fieldOfStudy => throw _privateConstructorUsedError;
  String get university => throw _privateConstructorUsedError;
  DateTime get graduationDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EducationCopyWith<Education> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationCopyWith<$Res> {
  factory $EducationCopyWith(Education value, $Res Function(Education) then) =
      _$EducationCopyWithImpl<$Res, Education>;
  @useResult
  $Res call(
      {ProfessionalMember member,
      String degree,
      String fieldOfStudy,
      String university,
      DateTime graduationDate});

  $ProfessionalMemberCopyWith<$Res> get member;
}

/// @nodoc
class _$EducationCopyWithImpl<$Res, $Val extends Education>
    implements $EducationCopyWith<$Res> {
  _$EducationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? degree = null,
    Object? fieldOfStudy = null,
    Object? university = null,
    Object? graduationDate = null,
  }) {
    return _then(_value.copyWith(
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as ProfessionalMember,
      degree: null == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String,
      fieldOfStudy: null == fieldOfStudy
          ? _value.fieldOfStudy
          : fieldOfStudy // ignore: cast_nullable_to_non_nullable
              as String,
      university: null == university
          ? _value.university
          : university // ignore: cast_nullable_to_non_nullable
              as String,
      graduationDate: null == graduationDate
          ? _value.graduationDate
          : graduationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfessionalMemberCopyWith<$Res> get member {
    return $ProfessionalMemberCopyWith<$Res>(_value.member, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EducationCopyWith<$Res> implements $EducationCopyWith<$Res> {
  factory _$$_EducationCopyWith(
          _$_Education value, $Res Function(_$_Education) then) =
      __$$_EducationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProfessionalMember member,
      String degree,
      String fieldOfStudy,
      String university,
      DateTime graduationDate});

  @override
  $ProfessionalMemberCopyWith<$Res> get member;
}

/// @nodoc
class __$$_EducationCopyWithImpl<$Res>
    extends _$EducationCopyWithImpl<$Res, _$_Education>
    implements _$$_EducationCopyWith<$Res> {
  __$$_EducationCopyWithImpl(
      _$_Education _value, $Res Function(_$_Education) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? degree = null,
    Object? fieldOfStudy = null,
    Object? university = null,
    Object? graduationDate = null,
  }) {
    return _then(_$_Education(
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as ProfessionalMember,
      degree: null == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String,
      fieldOfStudy: null == fieldOfStudy
          ? _value.fieldOfStudy
          : fieldOfStudy // ignore: cast_nullable_to_non_nullable
              as String,
      university: null == university
          ? _value.university
          : university // ignore: cast_nullable_to_non_nullable
              as String,
      graduationDate: null == graduationDate
          ? _value.graduationDate
          : graduationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Education implements _Education {
  const _$_Education(
      {required this.member,
      required this.degree,
      required this.fieldOfStudy,
      required this.university,
      required this.graduationDate});

  factory _$_Education.fromJson(Map<String, dynamic> json) =>
      _$$_EducationFromJson(json);

  @override
  final ProfessionalMember member;
  @override
  final String degree;
  @override
  final String fieldOfStudy;
  @override
  final String university;
  @override
  final DateTime graduationDate;

  @override
  String toString() {
    return 'Education(member: $member, degree: $degree, fieldOfStudy: $fieldOfStudy, university: $university, graduationDate: $graduationDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Education &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.fieldOfStudy, fieldOfStudy) ||
                other.fieldOfStudy == fieldOfStudy) &&
            (identical(other.university, university) ||
                other.university == university) &&
            (identical(other.graduationDate, graduationDate) ||
                other.graduationDate == graduationDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, member, degree, fieldOfStudy, university, graduationDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EducationCopyWith<_$_Education> get copyWith =>
      __$$_EducationCopyWithImpl<_$_Education>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EducationToJson(
      this,
    );
  }
}

abstract class _Education implements Education {
  const factory _Education(
      {required final ProfessionalMember member,
      required final String degree,
      required final String fieldOfStudy,
      required final String university,
      required final DateTime graduationDate}) = _$_Education;

  factory _Education.fromJson(Map<String, dynamic> json) =
      _$_Education.fromJson;

  @override
  ProfessionalMember get member;
  @override
  String get degree;
  @override
  String get fieldOfStudy;
  @override
  String get university;
  @override
  DateTime get graduationDate;
  @override
  @JsonKey(ignore: true)
  _$$_EducationCopyWith<_$_Education> get copyWith =>
      throw _privateConstructorUsedError;
}
