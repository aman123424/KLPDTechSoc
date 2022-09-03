import 'User.dart';

class expense{
  String description;
  User paidBy;
  List<User>splitTo;

  expense({required this.splitTo,required this.paidBy,required this.description});
}