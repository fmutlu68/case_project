import 'package:flutter_case_project/models/tickets/ticket.dart';
import 'package:sqflite/sqflite.dart';

abstract class ITicketsService {
  final List<Ticket>? tickets;
  final Database localStorage;
  ITicketsService(this.localStorage, {this.tickets});

  Future<void> addTicket(Ticket ticket);
  Future<void> deleteTicket(Ticket ticket);
  Future<void> loadTicketsToLocalStorage();
  Future<List<Ticket>> getTickets();
}
