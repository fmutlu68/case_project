import 'package:flutter_case_project/models/interest.dart';
import 'package:flutter_case_project/services/interest/interests/IInterestService.dart';
import 'package:sqflite/sqflite.dart';

class InterestService extends IInterestService {
  InterestService(Database localStorage, {List<Interest>? interests})
      : super(localStorage, interests: interests);

  @override
  Future<void> addInterest(Interest interest) async {
    await localStorage.insert("interests", interest.toJson);
  }

  @override
  Future<void> deleteInterest(Interest interest) async {
    await localStorage
        .rawDelete("delete from interests where id=${interest.id}");
  }

  @override
  Future<List<Interest>> getInterests() async {
    List<Map<String, Object?>> tickets = await localStorage.query("interests");
    return tickets.map((e) => Interest.fromJson(e)).toList();
  }

  @override
  Future<void> loadInterestsToLocalStorage() async {
    if (interests != null) {
      for (Interest item in interests!) {
        await addInterest(item);
      }
    }
  }
}
