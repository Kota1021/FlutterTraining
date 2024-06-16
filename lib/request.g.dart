// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      area: json['area'] as String,
      date: const DateTimeConverter().fromJson(json['date'] as String),
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'area': instance.area,
      'date': const DateTimeConverter().toJson(instance.date),
    };
