import 'package:techsoc_comp/User.dart';

import 'expenseClass.dart';

class Group{
  String name;
  String size;
  List<User> members;
  List<expense> expenses;

  Group({required this.name, required this.size, required this.members,required this.expenses});
}