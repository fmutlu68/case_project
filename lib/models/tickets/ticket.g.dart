// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return Ticket(
    id: json['id'] as int?,
    title: json['title'] as String?,
    userId: json['user_id'] as int?,
    status: json['status'] == 1,
  );
}

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'status': instance.status == true ? 1 : 0,
    };
