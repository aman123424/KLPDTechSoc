import 'User.dart';

class expense{
  String description;
  User paidBy;
  List<User>splitTo;
  int amount;

  expense({required this.splitTo,required this.paidBy,required this.description,required this.amount});
}