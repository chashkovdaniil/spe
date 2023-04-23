// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatsAddState _$ChatsAddStateFromJson(Map<String, dynamic> json) {
  return _ChatsAddState.fromJson(json);
}

/// @nodoc
mixin _$ChatsAddState {
  List<ProfessionalMember> get selectedMembers =>
      throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get professionalMemberName => throw _privateConstructorUsedError;
  List<ProfessionalMember> get filteredMembers =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatsAddStateCopyWith<ChatsAddState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsAddStateCopyWith<$Res> {
  factory $ChatsAddStateCopyWith(
          ChatsAddState value, $Res Function(ChatsAddState) then) =
      _$ChatsAddStateCopyWithImpl<$Res, ChatsAddState>;
  @useResult
  $Res call(
      {List<ProfessionalMember> selectedMembers,
      String name,
      String professionalMemberName,
      List<ProfessionalMember> filteredMembers});
}

/// @nodoc
class _$ChatsAddStateCopyWithImpl<$Res, $Val extends ChatsAddState>
    implements $ChatsAddStateCopyWith<$Res> {
  _$ChatsAddStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMembers = null,
    Object? name = null,
    Object? professionalMemberName = null,
    Object? filteredMembers = null,
  }) {
    return _then(_value.copyWith(
      selectedMembers: null == selectedMembers
          ? _value.selectedMembers
          : selectedMembers // ignore: cast_nullable_to_non_nullable
              as List<ProfessionalMember>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      professionalMemberName: null == professionalMemberName
          ? _value.professionalMemberName
          : professionalMemberName // ignore: cast_nullable_to_non_nullable
              as String,
      filteredMembers: null == filteredMembers
          ? _value.filteredMembers
          : filteredMembers // ignore: cast_nullable_to_non_nullable
              as List<ProfessionalMember>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatsAddStateCopyWith<$Res>
    implements $ChatsAddStateCopyWith<$Res> {
  factory _$$_ChatsAddStateCopyWith(
          _$_ChatsAddState value, $Res Function(_$_ChatsAddState) then) =
      __$$_ChatsAddStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProfessionalMember> selectedMembers,
      String name,
      String professionalMemberName,
      List<ProfessionalMember> filteredMembers});
}

/// @nodoc
class __$$_ChatsAddStateCopyWithImpl<$Res>
    extends _$ChatsAddStateCopyWithImpl<$Res, _$_ChatsAddState>
    implements _$$_ChatsAddStateCopyWith<$Res> {
  __$$_ChatsAddStateCopyWithImpl(
      _$_ChatsAddState _value, $Res Function(_$_ChatsAddState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMembers = null,
    Object? name = null,
    Object? professionalMemberName = null,
    Object? filteredMembers = null,
  }) {
    return _then(_$_ChatsAddState(
      selectedMembers: null == selectedMembers
          ? _value._selectedMembers
          : selectedMembers // ignore: cast_nullable_to_non_nullable
              as List<ProfessionalMember>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      professionalMemberName: null == professionalMemberName
          ? _value.professionalMemberName
          : professionalMemberName // ignore: cast_nullable_to_non_nullable
              as String,
      filteredMembers: null == filteredMembers
          ? _value._filteredMembers
          : filteredMembers // ignore: cast_nullable_to_non_nullable
              as List<ProfessionalMember>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatsAddState implements _ChatsAddState {
  const _$_ChatsAddState(
      {required final List<ProfessionalMember> selectedMembers,
      required this.name,
      required this.professionalMemberName,
      required final List<ProfessionalMember> filteredMembers})
      : _selectedMembers = selectedMembers,
        _filteredMembers = filteredMembers;

  factory _$_ChatsAddState.fromJson(Map<String, dynamic> json) =>
      _$$_ChatsAddStateFromJson(json);

  final List<ProfessionalMember> _selectedMembers;
  @override
  List<ProfessionalMember> get selectedMembers {
    if (_selectedMembers is EqualUnmodifiableListView) return _selectedMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedMembers);
  }

  @override
  final String name;
  @override
  final String professionalMemberName;
  final List<ProfessionalMember> _filteredMembers;
  @override
  List<ProfessionalMember> get filteredMembers {
    if (_filteredMembers is EqualUnmodifiableListView) return _filteredMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredMembers);
  }

  @override
  String toString() {
    return 'ChatsAddState(selectedMembers: $selectedMembers, name: $name, professionalMemberName: $professionalMemberName, filteredMembers: $filteredMembers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatsAddState &&
            const DeepCollectionEquality()
                .equals(other._selectedMembers, _selectedMembers) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.professionalMemberName, professionalMemberName) ||
                other.professionalMemberName == professionalMemberName) &&
            const DeepCollectionEquality()
                .equals(other._filteredMembers, _filteredMembers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedMembers),
      name,
      professionalMemberName,
      const DeepCollectionEquality().hash(_filteredMembers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatsAddStateCopyWith<_$_ChatsAddState> get copyWith =>
      __$$_ChatsAddStateCopyWithImpl<_$_ChatsAddState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatsAddStateToJson(
      this,
    );
  }
}

abstract class _ChatsAddState implements ChatsAddState {
  const factory _ChatsAddState(
          {required final List<ProfessionalMember> selectedMembers,
          required final String name,
          required final String professionalMemberName,
          required final List<ProfessionalMember> filteredMembers}) =
      _$_ChatsAddState;

  factory _ChatsAddState.fromJson(Map<String, dynamic> json) =
      _$_ChatsAddState.fromJson;

  @override
  List<ProfessionalMember> get selectedMembers;
  @override
  String get name;
  @override
  String get professionalMemberName;
  @override
  List<ProfessionalMember> get filteredMembers;
  @override
  @JsonKey(ignore: true)
  _$$_ChatsAddStateCopyWith<_$_ChatsAddState> get copyWith =>
      throw _privateConstructorUsedError;
}
