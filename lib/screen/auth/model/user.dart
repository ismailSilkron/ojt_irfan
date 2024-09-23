import 'package:ojt_irfan/service/database/table/user_table.dart';

class User {
  final int userId;
  final DateTime created;
  final DateTime updated;
  final String email;
  final String password;
  final String? name;

  final String? remark;
  final String? reference;
  final int isDeleted;

  User({
    required this.userId,
    required this.created,
    required this.updated,
    required this.email,
    required this.password,
    this.name,
    this.remark,
    this.reference,
    required this.isDeleted,
  });

  static Future<User> fromDatabase(Map<String, dynamic> json) async {
    final UserTable userTable = UserTable.instance;

    return User(
      userId: json[userTable.idCol],
      created: DateTime.parse(json[userTable.createdCol]),
      updated: DateTime.parse(json[userTable.updatedCol]),
      email: json[userTable.emailCol],
      password: json[userTable.passwordCol],
      name: json[userTable.nameCol],
      remark: json[userTable.remarkCol],
      reference: json[userTable.referenceCol],
      isDeleted: json[userTable.isDeletedCol],
    );
  }

  static Future<User?> addNewUser({
    required String username,
    required String email,
    required String password,
  }) async {
    var result = await UserTable.addUser(
      username: username,
      email: email,
      password: password,
      catchErrMsg: true,
    );

    if (result == null) {
      return null;
    }

    return await fromDatabase(result);
  }
}
