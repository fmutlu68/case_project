import 'package:flutter_case_project/models/tickets/ticket.dart';
import 'package:flutter_case_project/models/tickets/ticket_message.dart';
import 'package:flutter_case_project/services/ticket/tickets/ITicketsService.dart';
import 'package:sqflite_common/sqlite_api.dart';

class TicketsService extends ITicketsService {
  TicketsService(Database localStorage, {List<Ticket>? tickets})
      : super(localStorage, tickets: tickets);

  @override
  Future<void> addTicket(Ticket ticket) async {
    await localStorage.insert("tickets", ticket.toJson);
  }

  @override
  Future<void> deleteTicket(Ticket ticket) async {
    await localStorage.rawDelete('delete from tickets where id=${ticket.id}');
  }

  @override
  Future<List<Ticket>> getTickets() async {
    List<Map<String, Object?>> tickets = await localStorage.query("tickets");
    var gotTickets = tickets.map((e) => Ticket.fromJson(e)).toList();
    for (Ticket ticket in gotTickets) {
      List<Map<String, Object?>> messages = await localStorage
          .query('ticket_messages', where: '"ticket_id" = ${ticket.id}');
      ticket.messages = messages
          .map((e) => TicketMessage.fromJson(e))
          .toList()
          .map<int>((e) => e.id!)
          .toList();
    }
    return gotTickets;
  }

  @override
  Future<void> loadTicketsToLocalStorage() async {
    if (tickets != null) {
      for (Ticket item in tickets!) {
        await addTicket(item);
      }
    }
  }
}
