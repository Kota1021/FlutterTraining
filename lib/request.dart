import 'package:flutter_training/datetime_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class Request {
  Request({required this.area, required this.date});
  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);
  Map<String, dynamic> toJson() => _$RequestToJson(this);
  final String area;

  @DateTimeConverter()
  final DateTime date;
}
