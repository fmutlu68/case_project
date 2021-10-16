import 'package:flutter_case_project/models/interest.dart';
import 'package:sqflite/sqflite.dart';

abstract class IInterestService {
  final List<Interest>? interests;
  final Database localStorage;
  IInterestService(this.localStorage, {this.interests});

  Future<void> addInterest(Interest interest);
  Future<void> deleteInterest(Interest interest);
  Future<void> loadInterestsToLocalStorage();
  Future<List<Interest>> getInterests();
}
