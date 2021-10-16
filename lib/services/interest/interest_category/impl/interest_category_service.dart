import 'package:sqflite/sqflite.dart';
import 'package:flutter_case_project/models/interest_category.dart';
import '../IInterestCategoryService.dart';

class InterestCategoryService extends IInterestCategoryService {
  InterestCategoryService(Database localStorage,
      {List<InterestCategory>? interestCategories})
      : super(localStorage, interestCategories: interestCategories);

  @override
  Future<void> addInterestCategory(InterestCategory category) async {
    await localStorage.insert("interest_categories", category.toJson);
  }

  @override
  Future<void> deleteInterestCategory(InterestCategory category) async {
    await localStorage
        .rawDelete("delete from interest_categories where id=${category.id}");
  }

  @override
  Future<List<InterestCategory>> getInterestCategories() async {
    List<Map<String, Object?>> tickets =
        await localStorage.query("interest_categories");
    return tickets.map((e) => InterestCategory.fromJson(e)).toList();
  }

  @override
  Future<void> loadInterestCategoriesToLocalStorage() async {
    if (interestCategories != null) {
      for (var interest_category in interestCategories!) {
        await addInterestCategory(interest_category);
      }
    }
  }
}
