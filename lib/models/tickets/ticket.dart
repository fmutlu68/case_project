import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_case_project/core/base/model/base_model.dart';

part 'ticket.g.dart';

@JsonSerializable()
class Ticket extends BaseModel {
  int? id;
  int? userId;
  String? title;
  bool? status;
  List<int>? messages;

  Ticket({
    this.id,
    this.title,
    this.userId,
    this.status,
    this.messages,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  Map<String, dynamic> get toJson => _$TicketToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}
