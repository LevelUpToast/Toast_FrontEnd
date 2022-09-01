// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lever_up_toast/API/api.dart';
import 'package:lever_up_toast/values/values.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class MembershipScreen extends StatefulWidget {
  @override
  _MembershipScreenState createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  @override
  Widget build(BuildContext context) {
    String id, name, password, phoneNB, home;

    final TextEditingController _idController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _checkPasswordController = TextEditingController();
    final TextEditingController _phoneNumberController = TextEditingController();
    final TextEditingController _homeController = TextEditingController();

    TextTheme textTheme = Theme.of(context).textTheme;
    Api api = Provider.of<Api>(context, listen: false);

    return Scaffold(
      body: ListView(
        children: [

          TextFormField(
            controller: _idController,
            style: textTheme.bodyText1?.copyWith(
              fontSize: Sizes.TEXT_SIZE_16,
              fontWeight: FontWeight.w200,
              color: AppColors.grey,
            ),
            decoration: InputDecoration(
              labelText: "아이디 (이메일)",
              labelStyle: textTheme.bodyText1?.copyWith(
                fontSize: Sizes.TEXT_SIZE_16,
                fontWeight: FontWeight.w600,
                color: AppColors.grey,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () => _passwordController.clear(),
                color: Colors.grey,
                icon: const Icon(Icons.clear),
              ),
            ),
            onChanged: (value) {
              setState(() {
                if (value.isNotEmpty) {
                } else {
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
