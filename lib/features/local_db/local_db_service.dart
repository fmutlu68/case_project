import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_case_project/core/local_storage/sqflite/ISqfliteStorageHelper.dart';
import 'package:flutter_case_project/core/local_storage/sqflite/sqflite_storage_helper.dart';
import 'package:flutter_case_project/core/start/cache/preferences_manager.dart';
import 'package:flutter_case_project/features/enum/preferences_keys.dart';
import 'package:flutter_case_project/models/db/local_db.dart';
import 'package:flutter_case_project/models/interest.dart';
import 'package:flutter_case_project/models/interest_category.dart';
import 'package:flutter_case_project/models/tickets/ticket.dart';
import 'package:flutter_case_project/models/tickets/ticket_message.dart';
import 'package:flutter_case_project/models/users/user.dart';
import 'package:flutter_case_project/services/interest/interest_category/IInterestCategoryService.dart';
import 'package:flutter_case_project/services/interest/interest_category/impl/interest_category_service.dart';
import 'package:flutter_case_project/services/interest/interests/IInterestService.dart';
import 'package:flutter_case_project/services/interest/interests/impl/interest_service.dart';
import 'package:flutter_case_project/services/ticket/messages/ITicketMessagesService.dart';
import 'package:flutter_case_project/services/ticket/messages/impl/ticket_messages_service.dart';
import 'package:flutter_case_project/services/ticket/tickets/ITicketsService.dart';
import 'package:flutter_case_project/services/ticket/tickets/impl/tickets_service.dart';
import 'package:flutter_case_project/services/user/IUserService.dart';
import 'package:flutter_case_project/services/user/impl/user_service.dart';
import 'package:sqflite_common/sqlite_api.dart';

class LocalDbService {
  static LocalDbService? _instance;
  static LocalDbService get instance {
    if (_instance == null) _instance = LocalDbService._init();
    return _instance!;
  }

  LocalDbService._init();

  late ISqfliteStorageHelper _databaseHelper;
  IUserService? _userService;
  ITicketsService? _ticketsService;
  ITicketMessagesService? _ticketMessagesService;
  IInterestCategoryService? _interestCategoryService;
  IInterestService? _interestService;

  LocalDb? _DB;
  Map<String, dynamic>? dbJson;

  initService() async {
    /// Sorun İstek Şikayet
    _databaseHelper = SqfliteStorageHelper("case_app", onDatabaseCreating);
    await _databaseHelper.initDb();
    await PreferencesManager.preferencesInit();
    if (PreferencesManager.instance
            .getObject<bool?>(PreferencesKeys.SQFLITE_INITIALIZED.rawValue) ==
        true) {
      _DB = await loadDB();
    } else {
      String data = await rootBundle.loadString("assets/json/jsonfile1.json");
      dbJson = json.decode(data);
      _DB = LocalDb.fromJson(dbJson!);
      _DB!.tickets = await loadTickets();
      initializeDatabaseServices(false);
      await initializeDatabaseData();
    }

    if (PreferencesManager.instance
            .getObject<bool?>(PreferencesKeys.SQFLITE_INITIALIZED.rawValue) !=
        true) {
      PreferencesManager.instance
          .setBool(PreferencesKeys.SQFLITE_INITIALIZED.rawValue, true);
    }
  }

  Future<FutureOr<void>> onDatabaseCreating(Database db, int version) async {
    List<String> queries = [];
    queries.addAll([
      getUsersTableQuery,
      getInterestCategoriesTableQuery,
      getInterestsTableQuery,
      getTicketsTableQuery,
      getTicketMessagesTableQuery,
    ]);
    for (var query in queries) {
      await db.execute(query);
    }
  }

  String get getUsersTableQuery =>
      'CREATE TABLE users(id INTEGER primary key, username TEXT, password TEXT, role TEXT)';

  String get getInterestCategoriesTableQuery =>
      'CREATE TABLE interest_categories(id INTEGER primary key, name TEXT)';

  String get getInterestsTableQuery =>
      'CREATE TABLE interests(id INTEGER primary key, interests TEXT, category_id INTEGER)';

  String get getTicketsTableQuery =>
      'CREATE TABLE tickets(id INTEGER primary key, user_id INTEGER, title TEXT, status INTEGER)';

  String get getTicketMessagesTableQuery =>
      'CREATE TABLE ticket_messages(id INTEGER primary key, owner_id INTEGER, ticket_id INTEGER, message TEXT, create_date TEXT)';

  Future<LocalDb> loadDB() async {
    initializeDatabaseServices(true);
    List<User> users = await _userService!.getUsers();
    List<Ticket> tickets = await _ticketsService!.getTickets();
    List<TicketMessage> ticketMessages =
        await _ticketMessagesService!.getTicketMessages();
    List<Interest> interests = await _interestService!.getInterests();
    List<InterestCategory> categories =
        await _interestCategoryService!.getInterestCategories();

    return LocalDb(
      tickets: tickets,
      users: users,
      ticketMessages: ticketMessages,
      interests: interests,
      interestsCategories: categories,
    );
  }

  initializeDatabaseServices(bool isSqfliteInitialized) {
    _userService = UserService(_databaseHelper.db!,
        users: isSqfliteInitialized ? null : _DB!.users!);
    _ticketsService = TicketsService(
      _databaseHelper.db!,
      tickets: isSqfliteInitialized ? null : _DB!.tickets!,
    );
    _ticketMessagesService = TicketMessagesService(
      _databaseHelper.db!,
      ticketMessages: isSqfliteInitialized ? null : _DB!.ticketMessages!,
    );
    _interestCategoryService = InterestCategoryService(
      _databaseHelper.db!,
      interestCategories:
          isSqfliteInitialized ? null : _DB!.interestsCategories!,
    );
    _interestService = InterestService(_databaseHelper.db!,
        interests: isSqfliteInitialized ? null : _DB!.interests!);
  }

  Future<void> initializeDatabaseData() async {
    await _userService?.loadUsersToLocalStorage();
    await _interestCategoryService?.loadInterestCategoriesToLocalStorage();
    await _ticketMessagesService?.loadTicketMessagesToLocalStorage();
    await _ticketsService?.loadTicketsToLocalStorage();
    await _interestService?.loadInterestsToLocalStorage();
  }

  Future<List<Ticket>>? loadTickets() async {
    List<Ticket>? tickets = _DB?.tickets;
    if (tickets != null) {
      for (Ticket ticket in tickets) {
        ticket.messages = _DB!.ticketMessages!
            .where((element) => element.ticketId == ticket.id)
            .map<int>((e) => e.id!)
            .toList();
      }
    }
    return tickets!;
  }
}
