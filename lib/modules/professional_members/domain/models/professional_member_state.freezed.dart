// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'professional_member_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfessionalMemberState {
  ProfessionalMember? get authorizedMember =>
      throw _privateConstructorUsedError;
  ProfessionalMember? get member => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfessionalMemberStateCopyWith<ProfessionalMemberState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfessionalMemberStateCopyWith<$Res> {
  factory $ProfessionalMemberStateCopyWith(ProfessionalMemberState value,
          $Res Function(ProfessionalMemberState) then) =
      _$ProfessionalMemberStateCopyWithImpl<$Res, ProfessionalMemberState>;
  @useResult
  $Res call(
      {ProfessionalMember? authorizedMember,
      ProfessionalMember? member,
      bool isEditing,
      bool isSaving});

  $ProfessionalMemberCopyWith<$Res>? get authorizedMember;
  $ProfessionalMemberCopyWith<$Res>? get member;
}

/// @nodoc
class _$ProfessionalMemberStateCopyWithImpl<$Res,
        $Val extends ProfessionalMemberState>
    implements $ProfessionalMemberStateCopyWith<$Res> {
  _$ProfessionalMemberStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizedMember = freezed,
    Object? member = freezed,
    Object? isEditing = null,
    Object? isSaving = null,
  }) {
    return _then(_value.copyWith(
      authorizedMember: freezed == authorizedMember
          ? _value.authorizedMember
          : authorizedMember // ignore: cast_nullable_to_non_nullable
              as ProfessionalMember?,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as ProfessionalMember?,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfessionalMemberCopyWith<$Res>? get authorizedMember {
    if (_value.authorizedMember == null) {
      return null;
    }

    return $ProfessionalMemberCopyWith<$Res>(_value.authorizedMember!, (value) {
      return _then(_value.copyWith(authorizedMember: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfessionalMemberCopyWith<$Res>? get member {
    if (_value.member == null) {
      return null;
    }

    return $ProfessionalMemberCopyWith<$Res>(_value.member!, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfessionalMemberStateCopyWith<$Res>
    implements $ProfessionalMemberStateCopyWith<$Res> {
  factory _$$_ProfessionalMemberStateCopyWith(_$_ProfessionalMemberState value,
          $Res Function(_$_ProfessionalMemberState) then) =
      __$$_ProfessionalMemberStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProfessionalMember? authorizedMember,
      ProfessionalMember? member,
      bool isEditing,
      bool isSaving});

  @override
  $ProfessionalMemberCopyWith<$Res>? get authorizedMember;
  @override
  $ProfessionalMemberCopyWith<$Res>? get member;
}

/// @nodoc
class __$$_ProfessionalMemberStateCopyWithImpl<$Res>
    extends _$ProfessionalMemberStateCopyWithImpl<$Res,
        _$_ProfessionalMemberState>
    implements _$$_ProfessionalMemberStateCopyWith<$Res> {
  __$$_ProfessionalMemberStateCopyWithImpl(_$_ProfessionalMemberState _value,
      $Res Function(_$_ProfessionalMemberState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizedMember = freezed,
    Object? member = freezed,
    Object? isEditing = null,
    Object? isSaving = null,
  }) {
    return _then(_$_ProfessionalMemberState(
      authorizedMember: freezed == authorizedMember
          ? _value.authorizedMember
          : authorizedMember // ignore: cast_nullable_to_non_nullable
              as ProfessionalMember?,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as ProfessionalMember?,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProfessionalMemberState extends _ProfessionalMemberState {
  const _$_ProfessionalMemberState(
      {this.authorizedMember = null,
      this.member = null,
      this.isEditing = false,
      this.isSaving = false})
      : super._();

  @override
  @JsonKey()
  final ProfessionalMember? authorizedMember;
  @override
  @JsonKey()
  final ProfessionalMember? member;
  @override
  @JsonKey()
  final bool isEditing;
  @override
  @JsonKey()
  final bool isSaving;

  @override
  String toString() {
    return 'ProfessionalMemberState(authorizedMember: $authorizedMember, member: $member, isEditing: $isEditing, isSaving: $isSaving)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfessionalMemberState &&
            (identical(other.authorizedMember, authorizedMember) ||
                other.authorizedMember == authorizedMember) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, authorizedMember, member, isEditing, isSaving);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfessionalMemberStateCopyWith<_$_ProfessionalMemberState>
      get copyWith =>
          __$$_ProfessionalMemberStateCopyWithImpl<_$_ProfessionalMemberState>(
              this, _$identity);
}

abstract class _ProfessionalMemberState extends ProfessionalMemberState {
  const factory _ProfessionalMemberState(
      {final ProfessionalMember? authorizedMember,
      final ProfessionalMember? member,
      final bool isEditing,
      final bool isSaving}) = _$_ProfessionalMemberState;
  const _ProfessionalMemberState._() : super._();

  @override
  ProfessionalMember? get authorizedMember;
  @override
  ProfessionalMember? get member;
  @override
  bool get isEditing;
  @override
  bool get isSaving;
  @override
  @JsonKey(ignore: true)
  _$$_ProfessionalMemberStateCopyWith<_$_ProfessionalMemberState>
      get copyWith => throw _privateConstructorUsedError;
}
