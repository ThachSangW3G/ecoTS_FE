import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel(
      {required int id,
      required double points,
      required String exchangePointLocation,
      required int userId,
      required DateTime createdAt}) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, Object?> json) =>
      _$NotificationModelFromJson(json);
}
