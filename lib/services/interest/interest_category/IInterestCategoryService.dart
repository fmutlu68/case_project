import 'package:flutter_case_project/models/interest_category.dart';
import 'package:sqflite/sqflite.dart';

abstract class IInterestCategoryService {
  final List<InterestCategory>? interestCategories;
  final Database localStorage;
  IInterestCategoryService(this.localStorage, {this.interestCategories});

  Future<void> addInterestCategory(InterestCategory category);
  Future<void> deleteInterestCategory(InterestCategory category);
  Future<void> loadInterestCategoriesToLocalStorage();
  Future<List<InterestCategory>> getInterestCategories();
}
