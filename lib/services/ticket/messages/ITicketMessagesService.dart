import 'package:flutter_case_project/models/tickets/ticket_message.dart';
import 'package:sqflite/sqflite.dart';

abstract class ITicketMessagesService {
  final List<TicketMessage>? ticketMessages;
  final Database localStorage;
  ITicketMessagesService(this.localStorage, {this.ticketMessages});

  Future<void> addTicketMessage(TicketMessage ticketMessage);
  Future<void> deleteTicketMessage(TicketMessage ticketMessage);
  Future<void> loadTicketMessagesToLocalStorage();
  Future<List<TicketMessage>> getTicketMessages();
}
