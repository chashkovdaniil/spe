// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  DateTime get sentAt => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ProfessionalMember get sender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call({DateTime sentAt, String message, ProfessionalMember sender});

  $ProfessionalMemberCopyWith<$Res> get sender;
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentAt = null,
    Object? message = null,
    Object? sender = null,
  }) {
    return _then(_value.copyWith(
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as ProfessionalMember,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfessionalMemberCopyWith<$Res> get sender {
    return $ProfessionalMemberCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatMessageCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$_ChatMessageCopyWith(
          _$_ChatMessage value, $Res Function(_$_ChatMessage) then) =
      __$$_ChatMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime sentAt, String message, ProfessionalMember sender});

  @override
  $ProfessionalMemberCopyWith<$Res> get sender;
}

/// @nodoc
class __$$_ChatMessageCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$_ChatMessage>
    implements _$$_ChatMessageCopyWith<$Res> {
  __$$_ChatMessageCopyWithImpl(
      _$_ChatMessage _value, $Res Function(_$_ChatMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentAt = null,
    Object? message = null,
    Object? sender = null,
  }) {
    return _then(_$_ChatMessage(
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as ProfessionalMember,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatMessage implements _ChatMessage {
  const _$_ChatMessage(
      {required this.sentAt, required this.message, required this.sender});

  factory _$_ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_ChatMessageFromJson(json);

  @override
  final DateTime sentAt;
  @override
  final String message;
  @override
  final ProfessionalMember sender;

  @override
  String toString() {
    return 'ChatMessage(sentAt: $sentAt, message: $message, sender: $sender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatMessage &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.sender, sender) || other.sender == sender));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sentAt, message, sender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatMessageCopyWith<_$_ChatMessage> get copyWith =>
      __$$_ChatMessageCopyWithImpl<_$_ChatMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatMessageToJson(
      this,
    );
  }
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage(
      {required final DateTime sentAt,
      required final String message,
      required final ProfessionalMember sender}) = _$_ChatMessage;

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$_ChatMessage.fromJson;

  @override
  DateTime get sentAt;
  @override
  String get message;
  @override
  ProfessionalMember get sender;
  @override
  @JsonKey(ignore: true)
  _$$_ChatMessageCopyWith<_$_ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
