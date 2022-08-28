// ignore_for_file: file_names, avoid_print, unused_local_variable, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:lever_up_toast/API/api.dart';
import 'package:lever_up_toast/values/values.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool idAction = false;
  bool pwAction = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Api api = Provider.of<Api>(context, listen: false);
    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: Column(
          children: [
            //사진
            Flexible(
                flex: 3,
                child: Container(
                  color: Colors.white,
                )),
            Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 0, 14, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Row(
                          children: [
                            Text(
                              StringConst.login,
                              style: textTheme.bodyText1?.copyWith(
                                fontSize: Sizes.TEXT_SIZE_24,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: _idController,
                        style: textTheme.bodyText1?.copyWith(
                          fontSize: Sizes.TEXT_SIZE_16,
                          fontWeight: FontWeight.w200,
                          color: AppColors.grey,
                        ),
                        decoration: InputDecoration(
                          labelText: "아이디",
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
                              idAction = true;
                            } else {
                              idAction = false;
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        style: textTheme.bodyText1?.copyWith(
                          fontSize: Sizes.TEXT_SIZE_16,
                          fontWeight: FontWeight.w200,
                          color: AppColors.grey,
                        ),
                        decoration: InputDecoration(
                          labelText: "비밀번호",
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
                              pwAction = true;
                            } else {
                              pwAction = false;
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // 회원 가입
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '회원가입',
                            style: textTheme.bodyText1?.copyWith(
                              fontSize: Sizes.TEXT_SIZE_16,
                              fontWeight: FontWeight.w200,
                              color: AppColors.grey,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      idAction && pwAction
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: OutlinedButton(
                                  child: Text(
                                    StringConst.doLogin,
                                    style: textTheme.bodyText1?.copyWith(
                                      fontSize: Sizes.TEXT_SIZE_24,
                                      fontWeight: FontWeight.w200,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: AppColors.thirdColor,
                                  ),
                                  onPressed: () {
                                    Map<String, dynamic> data = {
                                      'id': 'saac',
                                      'pw': 'saac'
                                    };
                                    print(data);
                                    api.loginAPI(data, context);

                                  }),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: Center(
                                child: Text(
                                  StringConst.doLogin,
                                  style: textTheme.bodyText1?.copyWith(
                                    fontSize: Sizes.TEXT_SIZE_24,
                                    fontWeight: FontWeight.w200,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  )),
                            ),
                    ],
                  ),
                )),
            Flexible(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}
