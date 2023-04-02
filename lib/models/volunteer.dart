import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteer.freezed.dart';
part 'volunteer.g.dart';

@freezed
class Volunteer with _$Volunteer {
  const factory Volunteer({
    required String name,
    required String committee,
    required String position,
    required DateTime termBeginDate,
    required DateTime termEndDate,
  }) = _Volunteer;

  factory Volunteer.fromJson(Map<String, dynamic> json) =>
      _$VolunteerFromJson(json);
}
