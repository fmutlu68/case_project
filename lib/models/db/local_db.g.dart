// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalDb _$LocalDbFromJson(Map<String, dynamic> json) {
  return LocalDb(
    users: (json['users'] as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
    interestsCategories: (json['interestsCategories'] as List<dynamic>?)
        ?.map((e) => InterestCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    interests: (json['interests'] as List<dynamic>?)
        ?.map((e) => Interest.fromJson(e as Map<String, dynamic>))
        .toList(),
    tickets: (json['tickets'] as List<dynamic>?)
        ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
        .toList(),
    ticketMessages: (json['ticketMessages'] as List<dynamic>?)
        ?.map((e) => TicketMessage.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LocalDbToJson(LocalDb instance) => <String, dynamic>{
      'users': instance.users,
      'interestsCategories': instance.interestsCategories,
      'interests': instance.interests,
      'tickets': instance.tickets,
      'ticketMessages': instance.ticketMessages,
    };
