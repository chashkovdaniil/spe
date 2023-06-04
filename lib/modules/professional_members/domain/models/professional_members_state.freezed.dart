// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'professional_members_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfessionalMembersState {
  List<ProfessionalMember> get members => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfessionalMembersStateCopyWith<ProfessionalMembersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfessionalMembersStateCopyWith<$Res> {
  factory $ProfessionalMembersStateCopyWith(ProfessionalMembersState value,
          $Res Function(ProfessionalMembersState) then) =
      _$ProfessionalMembersStateCopyWithImpl<$Res, ProfessionalMembersState>;
  @useResult
  $Res call({List<ProfessionalMember> members});
}

/// @nodoc
class _$ProfessionalMembersStateCopyWithImpl<$Res,
        $Val extends ProfessionalMembersState>
    implements $ProfessionalMembersStateCopyWith<$Res> {
  _$ProfessionalMembersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<ProfessionalMember>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfessionalMembersStateCopyWith<$Res>
    implements $ProfessionalMembersStateCopyWith<$Res> {
  factory _$$_ProfessionalMembersStateCopyWith(
          _$_ProfessionalMembersState value,
          $Res Function(_$_ProfessionalMembersState) then) =
      __$$_ProfessionalMembersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProfessionalMember> members});
}

/// @nodoc
class __$$_ProfessionalMembersStateCopyWithImpl<$Res>
    extends _$ProfessionalMembersStateCopyWithImpl<$Res,
        _$_ProfessionalMembersState>
    implements _$$_ProfessionalMembersStateCopyWith<$Res> {
  __$$_ProfessionalMembersStateCopyWithImpl(_$_ProfessionalMembersState _value,
      $Res Function(_$_ProfessionalMembersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
  }) {
    return _then(_$_ProfessionalMembersState(
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<ProfessionalMember>,
    ));
  }
}

/// @nodoc

class _$_ProfessionalMembersState implements _ProfessionalMembersState {
  const _$_ProfessionalMembersState(
      {required final List<ProfessionalMember> members})
      : _members = members;

  final List<ProfessionalMember> _members;
  @override
  List<ProfessionalMember> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'ProfessionalMembersState(members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfessionalMembersState &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfessionalMembersStateCopyWith<_$_ProfessionalMembersState>
      get copyWith => __$$_ProfessionalMembersStateCopyWithImpl<
          _$_ProfessionalMembersState>(this, _$identity);
}

abstract class _ProfessionalMembersState implements ProfessionalMembersState {
  const factory _ProfessionalMembersState(
          {required final List<ProfessionalMember> members}) =
      _$_ProfessionalMembersState;

  @override
  List<ProfessionalMember> get members;
  @override
  @JsonKey(ignore: true)
  _$$_ProfessionalMembersStateCopyWith<_$_ProfessionalMembersState>
      get copyWith => throw _privateConstructorUsedError;
}
