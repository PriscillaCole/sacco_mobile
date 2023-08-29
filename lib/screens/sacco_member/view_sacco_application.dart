import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sacco/services/api_service.dart';
import 'package:sacco/screens/sacco_member/components/edit.dart';
import '../../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sacco/components/custom_text_fields.dart';

import '../../database/sacco_member_registration.dart';

class UsersListScreen extends StatefulWidget {
  static String routeName = "/sacco_members_list";

  @override
  _UsersListScreenState createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final _apiService = ApiService('/sacco_members');

  void _handleEditUser(Map<String, dynamic> userData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Body(userData: userData),
      ),
    );
  }

  void _handleDeleteUser(int index) async {
    setState(() {
      _isLoading = true;
    });

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString('user');
    int memberId = 0;
    if (user != null) {
      memberId = jsonDecode(user)['id'];
    }
    try {
      print(memberId);
      // Call your API service's delete method
      await _apiService.deleteUser(memberId);

      // Delete user from SQLite
      final DatabaseHelper databaseHelper = DatabaseHelper();
      await databaseHelper.initialize();
      await databaseHelper.deleteSaccoMember(memberId);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Member deleted successfully')),
      );

      setState(() {
        _isLoading = false;
        users.removeAt(index); // Remove the user from the local list
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to delete user')),
      );

      setState(() {
        _isLoading = false;
      });
    }
  }

  final ApiService apiService = ApiService('/sacco_members');
  List<Map<String, dynamic>> users = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString('user');
    int userId = 0;
    if (user != null) {
      userId = jsonDecode(user)['id'];
    }
    print('Fetching user with ID: $userId');
    try {
      final fetchedUser = await apiService
          .getUserById(userId.toString()); // Fetch a single user

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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : users.isEmpty
              ? Center(child: Text('No applications found'))
              : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(users[index]['full_name'].toString()),
                        subtitle: Text('Status: ${users[index]['status']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                _handleEditUser(users[index]);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _handleDeleteUser(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
