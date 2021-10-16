import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_case_project/core/base/model/base_model.dart';

part 'ticket_message.g.dart';

@JsonSerializable()
class TicketMessage extends BaseModel {
  int? id;
  int? ownerId;
  int? ticketId;
  String? message;
  String? createDate;
  TicketMessage({
    this.id,
    this.ownerId,
    this.message,
    this.createDate,
    this.ticketId,
  });

  factory TicketMessage.fromJson(Map<String, dynamic> json) =>
      _$TicketMessageFromJson(json);

  Map<String, dynamic> get toJson => _$TicketMessageToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => _$TicketMessageFromJson(json);
}
