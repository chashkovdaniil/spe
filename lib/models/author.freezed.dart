// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return _Author.fromJson(json);
}

/// @nodoc
mixin _$Author {
  ProfessionalMember get member => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get speManuscriptNumber => throw _privateConstructorUsedError;
  String get paperTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorCopyWith<Author> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) then) =
      _$AuthorCopyWithImpl<$Res, Author>;
  @useResult
  $Res call(
      {ProfessionalMember member,
      int year,
      int speManuscriptNumber,
      String paperTitle});

  $ProfessionalMemberCopyWith<$Res> get member;
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res, $Val extends Author>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? year = null,
    Object? speManuscriptNumber = null,
    Object? paperTitle = null,
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
      speManuscriptNumber: null == speManuscriptNumber
          ? _value.speManuscriptNumber
          : speManuscriptNumber // ignore: cast_nullable_to_non_nullable
              as int,
      paperTitle: null == paperTitle
          ? _value.paperTitle
          : paperTitle // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$$_AuthorCopyWith(_$_Author value, $Res Function(_$_Author) then) =
      __$$_AuthorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProfessionalMember member,
      int year,
      int speManuscriptNumber,
      String paperTitle});

  @override
  $ProfessionalMemberCopyWith<$Res> get member;
}

/// @nodoc
class __$$_AuthorCopyWithImpl<$Res>
    extends _$AuthorCopyWithImpl<$Res, _$_Author>
    implements _$$_AuthorCopyWith<$Res> {
  __$$_AuthorCopyWithImpl(_$_Author _value, $Res Function(_$_Author) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
    Object? year = null,
    Object? speManuscriptNumber = null,
    Object? paperTitle = null,
  }) {
    return _then(_$_Author(
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as ProfessionalMember,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      speManuscriptNumber: null == speManuscriptNumber
          ? _value.speManuscriptNumber
          : speManuscriptNumber // ignore: cast_nullable_to_non_nullable
              as int,
      paperTitle: null == paperTitle
          ? _value.paperTitle
          : paperTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Author implements _Author {
  const _$_Author(
      {required this.member,
      required this.year,
      required this.speManuscriptNumber,
      required this.paperTitle});

  factory _$_Author.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorFromJson(json);

  @override
  final ProfessionalMember member;
  @override
  final int year;
  @override
  final int speManuscriptNumber;
  @override
  final String paperTitle;

  @override
  String toString() {
    return 'Author(member: $member, year: $year, speManuscriptNumber: $speManuscriptNumber, paperTitle: $paperTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Author &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.speManuscriptNumber, speManuscriptNumber) ||
                other.speManuscriptNumber == speManuscriptNumber) &&
            (identical(other.paperTitle, paperTitle) ||
                other.paperTitle == paperTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, member, year, speManuscriptNumber, paperTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthorCopyWith<_$_Author> get copyWith =>
      __$$_AuthorCopyWithImpl<_$_Author>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorToJson(
      this,
    );
  }
}

abstract class _Author implements Author {
  const factory _Author(
      {required final ProfessionalMember member,
      required final int year,
      required final int speManuscriptNumber,
      required final String paperTitle}) = _$_Author;

  factory _Author.fromJson(Map<String, dynamic> json) = _$_Author.fromJson;

  @override
  ProfessionalMember get member;
  @override
  int get year;
  @override
  int get speManuscriptNumber;
  @override
  String get paperTitle;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorCopyWith<_$_Author> get copyWith =>
      throw _privateConstructorUsedError;
}
