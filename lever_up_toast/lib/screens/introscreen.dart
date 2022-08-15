import 'package:flutter/material.dart';
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
        color: AppColors.white,
        child: Column(
          children: [
            Flexible(
                flex: 3,
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
            Flexible(
                flex: 8,
                child: Container(
                )),
            Flexible(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: OutlinedButton(
                        onPressed: () {
                        },
                        child: Text(StringConst.user, style: textTheme.bodyText1?.copyWith(
                          fontSize: Sizes.TEXT_SIZE_24,
                          fontWeight: FontWeight.w200,
                          color: AppColors.white,
                        ),),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.thirdColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: OutlinedButton(
                        onPressed: () {

                        },
                        child: Text(StringConst.notUser, style: textTheme.bodyText1?.copyWith(
                          fontSize: Sizes.TEXT_SIZE_24,
                          fontWeight: FontWeight.w200,
                          color: AppColors.thirdColor,
                        ),),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1.0, color: AppColors.thirdColor),
                          backgroundColor: AppColors.white,
                        ),
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
