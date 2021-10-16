import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_case_project/core/base/model/base_model.dart';
import 'package:flutter_case_project/models/interest.dart';
import 'package:flutter_case_project/models/interest_category.dart';
import 'package:flutter_case_project/models/tickets/ticket.dart';
import 'package:flutter_case_project/models/tickets/ticket_message.dart';
import 'package:flutter_case_project/models/users/user.dart';

part 'local_db.g.dart';

@JsonSerializable()
class LocalDb extends BaseModel<LocalDb> {
  List<User>? users;
  List<InterestCategory>? interestsCategories;
  List<Interest>? interests;
  List<Ticket>? tickets;
  List<TicketMessage>? ticketMessages;

  LocalDb({
    this.users,
    this.interestsCategories,
    this.interests,
    this.tickets,
    this.ticketMessages,
  });

  @override
  factory LocalDb.fromJson(Map<String, dynamic> json) =>
      _$LocalDbFromJson(json);
  @override
  LocalDb fromJson(Map<String, dynamic> json) => _$LocalDbFromJson(json);

  @override
  Map<String, dynamic> get toJson => _$LocalDbToJson(this);
}
