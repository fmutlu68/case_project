// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketMessage _$TicketMessageFromJson(Map<String, dynamic> json) {
  return TicketMessage(
    id: json['id'] as int?,
    ownerId: json['owner_id'] as int?,
    message: json['message'] as String?,
    createDate: json['create_date'] as String?,
    ticketId: json["ticket_id"] as int?,
  );
}

Map<String, dynamic> _$TicketMessageToJson(TicketMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'message': instance.message,
      'create_date': instance.createDate,
      'ticket_id': instance.ticketId,
    };
