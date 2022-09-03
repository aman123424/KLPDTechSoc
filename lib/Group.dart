import 'package:techsoc_comp/User.dart';

class Group{
  String name;
  String size;
  List<User> members;

  Group({required this.name, required this.size, required this.members});
}