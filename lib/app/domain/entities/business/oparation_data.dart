import 'package:equatable/equatable.dart';






class OperationData extends Equatable {
  final int? id;
  final int? businessId;
  final Day? day;
  final String? openTime;
  final String? closedTime;

  const OperationData({
    this.id,
    this.businessId,
    this.day,
    this.openTime,
    this.closedTime,
  });

  factory OperationData.fromJson(Map<String, dynamic> json) => OperationData(
    id: json["id"],
    businessId: json["business_id"],
    day: dayValues.map[json["day"]]!,
    openTime: json["open_time"],
    closedTime: json["closed_time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "day": dayValues.reverse[day],
    "open_time": openTime,
    "closed_time": closedTime,
  };

  OperationData copyWith({
    int? id,
    int? businessId,
    Day? day,
    String? openTime,
    String? closedTime,
  }) =>
      OperationData(
        id: id ?? this.id,
        businessId: businessId ?? this.businessId,
        day: day ?? this.day,
        openTime: openTime ?? this.openTime,
        closedTime: closedTime ?? this.closedTime,
      );

  @override
  List<Object?> get props => [id, businessId, day, openTime, closedTime];
}
enum Day {
  FRI,
  MON,
  SAT,
  SUN,
  THU,
  TUE,
  WED
}
final dayValues = EnumValues({
  "Fri": Day.FRI,
  "Mon": Day.MON,
  "Sat": Day.SAT,
  "Sun": Day.SUN,
  "Thu": Day.THU,
  "Tue": Day.TUE,
  "Wed": Day.WED,
});
class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}