// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lever_up_toast/values/values.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        color: AppColors.white,
        child: Column(
          children: [
            Flexible(
                flex: 4,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              StringConst.hi,
                              style: textTheme.bodyText1?.copyWith(
                                fontSize: Sizes.TEXT_SIZE_28,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: Sizes.HEIGHT_50,),

            Flexible(
                flex: 8,
                  child: SvgPicture.asset("assets/img/login_img.svg"),
                ),
            const SizedBox(height: Sizes.HEIGHT_50,),
            Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: OutlinedButton(
                        child: Text(StringConst.user, style: textTheme.bodyText1?.copyWith(
                          fontSize: Sizes.TEXT_SIZE_24,
                          fontWeight: FontWeight.w200,
                          color: AppColors.white,
                        ),),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.thirdColor,
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');},
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: OutlinedButton(

                        child: Text(StringConst.notUser, style: textTheme.bodyText1?.copyWith(
                          fontSize: Sizes.TEXT_SIZE_24,
                          fontWeight: FontWeight.w200,
                          color: AppColors.thirdColor,
                        ),),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1.0, color: AppColors.thirdColor),
                          backgroundColor: AppColors.white,
                        ),
                        onPressed: () {
                        },
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
