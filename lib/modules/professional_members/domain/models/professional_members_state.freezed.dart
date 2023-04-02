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
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ProfessionalMember> members) $default, {
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ProfessionalMember> members)? $default, {
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ProfessionalMember> members)? $default, {
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProfessionalMembersState value) $default, {
    required TResult Function(_ProfessionalMembersStateEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProfessionalMembersState value)? $default, {
    TResult? Function(_ProfessionalMembersStateEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProfessionalMembersState value)? $default, {
    TResult Function(_ProfessionalMembersStateEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfessionalMembersStateCopyWith<$Res> {
  factory $ProfessionalMembersStateCopyWith(ProfessionalMembersState value,
          $Res Function(ProfessionalMembersState) then) =
      _$ProfessionalMembersStateCopyWithImpl<$Res, ProfessionalMembersState>;
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
}

/// @nodoc
abstract class _$$_ProfessionalMembersStateCopyWith<$Res> {
  factory _$$_ProfessionalMembersStateCopyWith(
          _$_ProfessionalMembersState value,
          $Res Function(_$_ProfessionalMembersState) then) =
      __$$_ProfessionalMembersStateCopyWithImpl<$Res>;
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

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ProfessionalMember> members) $default, {
    required TResult Function() empty,
  }) {
    return $default(members);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ProfessionalMember> members)? $default, {
    TResult? Function()? empty,
  }) {
    return $default?.call(members);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ProfessionalMember> members)? $default, {
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(members);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProfessionalMembersState value) $default, {
    required TResult Function(_ProfessionalMembersStateEmpty value) empty,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProfessionalMembersState value)? $default, {
    TResult? Function(_ProfessionalMembersStateEmpty value)? empty,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProfessionalMembersState value)? $default, {
    TResult Function(_ProfessionalMembersStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ProfessionalMembersState implements ProfessionalMembersState {
  const factory _ProfessionalMembersState(
          {required final List<ProfessionalMember> members}) =
      _$_ProfessionalMembersState;

  List<ProfessionalMember> get members;
  @JsonKey(ignore: true)
  _$$_ProfessionalMembersStateCopyWith<_$_ProfessionalMembersState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ProfessionalMembersStateEmptyCopyWith<$Res> {
  factory _$$_ProfessionalMembersStateEmptyCopyWith(
          _$_ProfessionalMembersStateEmpty value,
          $Res Function(_$_ProfessionalMembersStateEmpty) then) =
      __$$_ProfessionalMembersStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ProfessionalMembersStateEmptyCopyWithImpl<$Res>
    extends _$ProfessionalMembersStateCopyWithImpl<$Res,
        _$_ProfessionalMembersStateEmpty>
    implements _$$_ProfessionalMembersStateEmptyCopyWith<$Res> {
  __$$_ProfessionalMembersStateEmptyCopyWithImpl(
      _$_ProfessionalMembersStateEmpty _value,
      $Res Function(_$_ProfessionalMembersStateEmpty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ProfessionalMembersStateEmpty
    implements _ProfessionalMembersStateEmpty {
  const _$_ProfessionalMembersStateEmpty();

  @override
  String toString() {
    return 'ProfessionalMembersState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfessionalMembersStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ProfessionalMember> members) $default, {
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ProfessionalMember> members)? $default, {
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ProfessionalMember> members)? $default, {
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProfessionalMembersState value) $default, {
    required TResult Function(_ProfessionalMembersStateEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProfessionalMembersState value)? $default, {
    TResult? Function(_ProfessionalMembersStateEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProfessionalMembersState value)? $default, {
    TResult Function(_ProfessionalMembersStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _ProfessionalMembersStateEmpty
    implements ProfessionalMembersState {
  const factory _ProfessionalMembersStateEmpty() =
      _$_ProfessionalMembersStateEmpty;
}
