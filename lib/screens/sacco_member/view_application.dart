import 'package:flutter/material.dart';
import 'package:sacco/services/api_service.dart';
import '../../constants.dart';

class UsersListScreen extends StatefulWidget {
  static String routeName = "/sacco_members_list";

  @override
  _UsersListScreenState createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final ApiService apiService = ApiService('/sacco_members');
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      final fetchedUser =
          await apiService.getUserById('6'); // Fetch a single user

      if (fetchedUser.isNotEmpty) {
        setState(() {
          users = [fetchedUser]; // Store the single user in the users list
        });
      } else {
        print('No user found.');
      }
    } catch (error) {
      print('Error fetching user: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Sacco Applications'),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(users[index]['full_name'].toString()),
              subtitle: Text('Status: ${users[index]['status']}'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Handle edit icon tap
                  // You can open an edit screen or perform any action here
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
