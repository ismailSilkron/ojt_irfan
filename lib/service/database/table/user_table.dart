import 'package:logger/logger.dart';
import 'package:ojt_irfan/service/database/table.dart';
import 'package:sqflite/sqflite.dart';

class UserTable extends Table {
  final String nameCol;
  final String emailCol;
  final String passwordCol;

  const UserTable._internal()
      : nameCol = "name",
        emailCol = "email",
        passwordCol = "password",
        super(
          tableName: "user",
        );

  static UserTable instance = const UserTable._internal();

  @override
  String getCreateTableQuery() {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
        $idCol INTEGER PRIMARY KEY AUTOINCREMENT,
        $createdCol TEXT NOT NULL,
        $updatedCol TEXT NOT NULL,
        $emailCol TEXT NOT NULL,
        $passwordCol TEXT NOT NULL,
        $nameCol TEXT,
        $remarkCol TEXT,
        $referenceCol TEXT,
        $isDeletedCol INTEGER NOT NULL DEFAULT 0
      )
    ''';
  }

  static Future<Map<String, dynamic>?> addUser({
    required String username,
    required String email,
    required String password,
    bool catchErrMsg = false,
  }) async {
    try {
      final UserTable userTable = UserTable.instance;

      final Database db = await userTable.database;

      final userExistingData = await db.query(
        userTable.tableName,
        where: "${userTable.emailCol} = ?",
        whereArgs: [email],
      );

      if (userExistingData.isNotEmpty) {
        throw Exception("Account registered with this email already exist");
      }

      final int userId = await userTable.insertRecord({
        userTable.nameCol: username,
        userTable.emailCol: email,
        userTable.passwordCol: password,
      });

      if (userId == -1) {
        throw Exception("Failed to add user.");
      }

      final Map<String, dynamic>? userData =
          await userTable.getOneRecord(userId);

      if (userData == null) {
        throw Exception("User not found after insertion");
      }

      return userData;
    } catch (e) {
      Logger().f("Failed to register user, $e");
      if (catchErrMsg) {
        rethrow;
      }

      return null;
    }
  }
}
