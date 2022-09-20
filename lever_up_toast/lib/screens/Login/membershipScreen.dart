// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lever_up_toast/API/api.dart';
import 'package:lever_up_toast/values/values.dart';
import 'package:provider/provider.dart';

class MembershipScreen extends StatefulWidget {
  @override
  _MembershipScreenState createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _emailNumberController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _checkPasswordController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool _gendercheck = true;
  bool _pwcheck = false;
  String gender = 'M';

  @override
  Widget build(BuildContext context) {

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
                  color: AppColors.grey300,
                ),
                decoration: InputDecoration(
                  labelText: "아이디 입력",
                  labelStyle: textTheme.bodyText1?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey300,
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
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            // 이름
            SizedBox(
              height: 60,
              child: TextFormField(
                controller: _nameController,
                style: textTheme.bodyText1?.copyWith(
                  fontSize: Sizes.TEXT_SIZE_16,
                  fontWeight: FontWeight.w200,
                  color: AppColors.grey300,
                ),
                decoration: InputDecoration(
                  labelText: "이름 입력",
                  labelStyle: textTheme.bodyText1?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey300,
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
                    onPressed: () => _nameController.clear(),
                    color: Colors.grey,
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            // 이메일
            Row(
              children: [
                api.checkmembership
                    ? Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(3.0, 0, 3, 0),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white60,
                            ),
                            child: Center(child: Text(_emailController.text)),
                          ),
                        ),
                      )
                    : Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(3.0, 0, 3, 0),
                          child: SizedBox(
                            height: 60,
                            child: TextFormField(
                              controller: _emailController,
                              style: textTheme.bodyText1?.copyWith(
                                fontSize: Sizes.TEXT_SIZE_16,
                                fontWeight: FontWeight.w200,
                                color: AppColors.grey300,
                              ),
                              decoration: InputDecoration(
                                labelText: "이메일 입력",
                                labelStyle: textTheme.bodyText1?.copyWith(
                                  fontSize: Sizes.TEXT_SIZE_16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey300,
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
                                  onPressed: () => _emailController.clear(),
                                  color: Colors.grey,
                                  icon: const Icon(Icons.clear),
                                ),
                              ),
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
                          onPressed: () {
                            setState(() {
                              api.requestEmailAuth(_emailController.text);
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                setState(() {
                                  api.checkmembership = api.getBoolMember();
                                });
                              });
                            });
                          }),
                    )),
              ],
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            // 인증 번호 입력
            Row(
              children: [
                api.checklog
                    ? Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(3.0, 0, 3, 0),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white60,
                            ),
                            child: Center(
                              child: Text(
                                StringConst.email_message,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(3.0, 0, 3, 0),
                          child: SizedBox(
                            height: 60,
                            child: TextFormField(
                              controller: _emailNumberController,
                              style: textTheme.bodyText1?.copyWith(
                                fontSize: Sizes.TEXT_SIZE_16,
                                fontWeight: FontWeight.w200,
                                color: AppColors.grey300,
                              ),
                              decoration: InputDecoration(
                                labelText: "인증번호 입력",
                                labelStyle: textTheme.bodyText1?.copyWith(
                                  fontSize: Sizes.TEXT_SIZE_16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey300,
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
                                  onPressed: () =>
                                      _emailNumberController.clear(),
                                  color: Colors.grey,
                                  icon: const Icon(Icons.clear),
                                ),
                              ),
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
                                StringConst.email_membership,
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
                          onPressed: () {
                            setState(() {
                              api.confirmEmailAuth(_emailNumberController.text);
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                setState(() {
                                  api.checkmembership = api.getBoolMember();
                                });
                              });
                            });
                          }),
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
                  _gendercheck
                      ? Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
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
                                onPressed: () {
                                  setState(() {
                                    _gendercheck = true;
                                    gender = 'M';
                                  });
                                }),
                          ),
                        )
                      : Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
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
                                  backgroundColor: AppColors.secondaryColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _gendercheck = true;
                                    gender = 'M';
                                  });
                                }),
                          ),
                        ),
                  _gendercheck
                      ? Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
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
                                  backgroundColor: AppColors.secondaryColor,
                                ),
                                onPressed: () {
                                  gender = 'WM';
                                setState(() {
                                  _gendercheck = false;
                                });
                                }),
                          ),
                        )
                      : Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
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
                                onPressed: () {
                                  gender = 'WM';
                                  _gendercheck = false;
                                }),
                          ),
                        )
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
                controller: _phoneNumberController,
                keyboardType: TextInputType.number,
                style: textTheme.bodyText1?.copyWith(
                  fontSize: Sizes.TEXT_SIZE_16,
                  fontWeight: FontWeight.w200,
                  color: AppColors.grey300,
                ),
                decoration: InputDecoration(
                  labelText: "전화번호 입력",
                  labelStyle: textTheme.bodyText1?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey300,
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
                    onPressed: () => _phoneNumberController.clear(),
                    color: Colors.grey,
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            // 주소
            SizedBox(
              height: 60,
              child: TextFormField(
                controller: _addressController,
                style: textTheme.bodyText1?.copyWith(
                  fontSize: Sizes.TEXT_SIZE_16,
                  fontWeight: FontWeight.w200,
                  color: AppColors.grey300,
                ),
                decoration: InputDecoration(
                  labelText: "주소 입력",
                  labelStyle: textTheme.bodyText1?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey300,
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
                    onPressed: () => _addressController.clear(),
                    color: Colors.grey,
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            //비밀번호
            SizedBox(
              height: 60,
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: textTheme.bodyText1?.copyWith(
                  fontSize: Sizes.TEXT_SIZE_16,
                  fontWeight: FontWeight.w200,
                  color: AppColors.grey300,
                ),
                decoration: InputDecoration(
                  labelText: "비밀번호 입력",
                  labelStyle: textTheme.bodyText1?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey300,
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
                controller: _checkPasswordController,
                obscureText: true,
                style: textTheme.bodyText1?.copyWith(
                  fontSize: Sizes.TEXT_SIZE_16,
                  fontWeight: FontWeight.w200,
                  color: AppColors.grey300,
                ),
                decoration: InputDecoration(
                  labelText: "비밀번호 확인",
                  labelStyle: textTheme.bodyText1?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey300,
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
                    onPressed: () => _checkPasswordController.clear(),
                    color: Colors.grey,
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value == _passwordController.text) {
                      _pwcheck = true;
                    } else {
                      _pwcheck = false;
                    }
                  });
                },
              ),
            ),
            const SizedBox(
              height: Sizes.HEIGHT_30,
            ),
            // 가입확인
            _pwcheck
                ? OutlinedButton(
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
                    onPressed: () {
                      Map<String, dynamic> data =
                      { "id" : _idController.text,
                        "pw" : _checkPasswordController.text,
                        "name" : _nameController.text,
                        "gender" : gender,
                        "phoneNumber" : _phoneNumberController.text,
                        "e_mail" : _emailNumberController.text,
                        "address" : _addressController.text};
                      api.signUp(data);
                    })
                : Container(
                    height: 60,
                    color: AppColors.secondaryColor,
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
          ],
        ),
      ),
    );
  }
}
