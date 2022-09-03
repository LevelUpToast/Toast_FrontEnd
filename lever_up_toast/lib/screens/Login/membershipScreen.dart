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
    String id, password, name, gender, email, phoneNB, address;

    final TextEditingController _idController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _checkPasswordController =
        TextEditingController();
    final TextEditingController _phoneNumberController =
        TextEditingController();
    final TextEditingController _addressController = TextEditingController();

    TextTheme textTheme = Theme.of(context).textTheme;
    Api api = Provider.of<Api>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 10, 12, 10),
        child: ListView(
          children: [
            const SizedBox(
              height: Sizes.HEIGHT_50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  StringConst.SignUP,
                  style: textTheme.bodyText1?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_28,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            // 아이디
            SizedBox(
              height: 60,
              child: TextFormField(
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
                    onPressed: () => _idController.clear(),
                    color: Colors.grey,
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                    } else {}
                  });
                },
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            // 이메일
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 0, 3, 0),
                    child: SizedBox(
                      height: 60,
                      child: TextFormField(
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
                            onPressed: () => _idController.clear(),
                            color: Colors.grey,
                            icon: const Icon(Icons.clear),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            if (value.isNotEmpty) {
                            } else {}
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3.0, 0, 3, 0),
                      child: OutlinedButton(
                          child: SizedBox(
                            height: 60,
                            child: Center(
                              child: Text(
                                StringConst.email_check,
                                style: textTheme.bodyText1?.copyWith(
                                  fontSize: Sizes.TEXT_SIZE_20,
                                  fontWeight: FontWeight.w200,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.thirdColor,
                          ),
                          onPressed: () {}),
                    )),
              ],
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            // 성별 체크
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4,0,4,0),
                      child: OutlinedButton(
                          child: SizedBox(
                            height: 60,
                            child: Center(
                              child: Text(
                                StringConst.gender_Man,
                                style: textTheme.bodyText1?.copyWith(
                                  fontSize: Sizes.TEXT_SIZE_20,
                                  fontWeight: FontWeight.w200,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.thirdColor,
                          ),
                          onPressed: () {}),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4,0,4,0),
                      child: OutlinedButton(
                          child: SizedBox(
                            height: 60,
                            child: Center(
                              child: Text(
                                StringConst.gender_Woman,
                                style: textTheme.bodyText1?.copyWith(
                                  fontSize: Sizes.TEXT_SIZE_20,
                                  fontWeight: FontWeight.w200,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.thirdColor,
                          ),
                          onPressed: () {}),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            // 전화번호
            SizedBox(
              height: 60,
              child: TextFormField(
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
                    onPressed: () => _idController.clear(),
                    color: Colors.grey,
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                    } else {}
                  });
                },
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            // 주소
            SizedBox(
              height: 60,
              child: TextFormField(
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
                    onPressed: () => _idController.clear(),
                    color: Colors.grey,
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                    } else {}
                  });
                },
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            //비밀번호
            SizedBox(
              height: 60,
              child: TextFormField(
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
                    onPressed: () => _idController.clear(),
                    color: Colors.grey,
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                    } else {}
                  });
                },
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            // 비밀번호 확인
            SizedBox(
              height: 60,
              child: TextFormField(
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
                    onPressed: () => _idController.clear(),
                    color: Colors.grey,
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                    } else {}
                  });
                },
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            // 가입확인
            OutlinedButton(
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      StringConst.signUP_accept,
                      style: textTheme.bodyText1?.copyWith(
                        fontSize: Sizes.TEXT_SIZE_20,
                        fontWeight: FontWeight.w200,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.thirdColor,
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
