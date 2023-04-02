// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'award_recipient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AwardRecipient _$AwardRecipientFromJson(Map<String, dynamic> json) {
  return _AwardRecipient.fromJson(json);
}

/// @nodoc
mixin _$AwardRecipient {
  ProfessionalMember get member => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  String get award => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AwardRecipientCopyWith<AwardRecipient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AwardRecipientCopyWith<$Res> {
  factory $AwardRecipientCopyWith(
          AwardRecipient value, $Res Function(AwardRecipient) then) =
      _$AwardRecipientCopyWithImpl<$Res, AwardRecipient>;
  @useResult
  $Res call({ProfessionalMember member, int year, String award});

  $ProfessionalMemberCopyWith<$Res> get member;
}

/// @nodoc
class _$AwardRecipientCopyWithImpl<$Res, $Val extends AwardRecipient>
    implements $AwardRecipientCopyWith<$Res> {
  _$AwardRecipientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? year = null,
    Object? award = null,
  }) {
    return _then(_value.copyWith(
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as ProfessionalMember,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      award: null == award
          ? _value.award
          : award // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_AwardRecipientCopyWith<$Res>
    implements $AwardRecipientCopyWith<$Res> {
  factory _$$_AwardRecipientCopyWith(
          _$_AwardRecipient value, $Res Function(_$_AwardRecipient) then) =
      __$$_AwardRecipientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProfessionalMember member, int year, String award});

  @override
  $ProfessionalMemberCopyWith<$Res> get member;
}

/// @nodoc
class __$$_AwardRecipientCopyWithImpl<$Res>
    extends _$AwardRecipientCopyWithImpl<$Res, _$_AwardRecipient>
    implements _$$_AwardRecipientCopyWith<$Res> {
  __$$_AwardRecipientCopyWithImpl(
      _$_AwardRecipient _value, $Res Function(_$_AwardRecipient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? year = null,
    Object? award = null,
  }) {
    return _then(_$_AwardRecipient(
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as ProfessionalMember,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      award: null == award
          ? _value.award
          : award // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AwardRecipient implements _AwardRecipient {
  const _$_AwardRecipient(
      {required this.member, required this.year, required this.award});

  factory _$_AwardRecipient.fromJson(Map<String, dynamic> json) =>
      _$$_AwardRecipientFromJson(json);

  @override
  final ProfessionalMember member;
  @override
  final int year;
  @override
  final String award;

  @override
  String toString() {
    return 'AwardRecipient(member: $member, year: $year, award: $award)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AwardRecipient &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.award, award) || other.award == award));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, member, year, award);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AwardRecipientCopyWith<_$_AwardRecipient> get copyWith =>
      __$$_AwardRecipientCopyWithImpl<_$_AwardRecipient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AwardRecipientToJson(
      this,
    );
  }
}

abstract class _AwardRecipient implements AwardRecipient {
  const factory _AwardRecipient(
      {required final ProfessionalMember member,
      required final int year,
      required final String award}) = _$_AwardRecipient;

  factory _AwardRecipient.fromJson(Map<String, dynamic> json) =
      _$_AwardRecipient.fromJson;

  @override
  ProfessionalMember get member;
  @override
  int get year;
  @override
  String get award;
  @override
  @JsonKey(ignore: true)
  _$$_AwardRecipientCopyWith<_$_AwardRecipient> get copyWith =>
      throw _privateConstructorUsedError;
}
