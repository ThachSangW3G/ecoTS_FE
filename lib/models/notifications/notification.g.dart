// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: (json['id'] as num).toInt(),
      points: (json['points'] as num).toDouble(),
      exchangePointLocation: json['exchangePointLocation'] as String,
      userId: (json['userId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'points': instance.points,
      'exchangePointLocation': instance.exchangePointLocation,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
