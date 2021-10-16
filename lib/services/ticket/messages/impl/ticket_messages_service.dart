import 'package:flutter_case_project/models/tickets/ticket_message.dart';
import 'package:flutter_case_project/services/ticket/messages/ITicketMessagesService.dart';
import 'package:sqflite_common/sqlite_api.dart';

class TicketMessagesService extends ITicketMessagesService {
  TicketMessagesService(Database localStorage,
      {List<TicketMessage>? ticketMessages})
      : super(localStorage, ticketMessages: ticketMessages);

  @override
  Future<void> addTicketMessage(TicketMessage ticketMessage) async {
    await localStorage.insert("ticket_messages", ticketMessage.toJson);
  }

  @override
  Future<void> deleteTicketMessage(TicketMessage ticketMessage) async {
    await localStorage
        .rawDelete('delete from ticket_messages where id=${ticketMessage.id}');
  }

  @override
  Future<List<TicketMessage>> getTicketMessages() async {
    List<Map<String, Object?>> tickets =
        await localStorage.query("ticket_messages");
    return tickets.map((e) => TicketMessage.fromJson(e)).toList();
  }

  @override
  Future<void> loadTicketMessagesToLocalStorage() async {
    if (ticketMessages != null) {
      for (TicketMessage item in ticketMessages!) {
        await addTicketMessage(item);
      }
    }
  }
}
