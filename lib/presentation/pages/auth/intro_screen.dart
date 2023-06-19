import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_text_button.dart';
import 'package:instagram_clone/presentation/pages/auth/widgets/button_box.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 200.h,
            ),
            Column(
              children: [
                Image.asset(defaultLogo()),
                SizedBox(height: 20.h),
                Image.asset(defaultUserPhoto()),
                SizedBox(
                  height: 20.h,
                ),
                ButtonBox(
                    child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login-screen');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryButtonColor),
                  child: const Text('Log in'),
                )),
                SizedBox(
                  height: 10.h,
                ),
                ButtonBox(
                    child: CustomTextButton(
                        onPressed: () {},
                        child: Text(
                          'Switch accounts',
                          style: TextStyle(color: primaryButtonColor),
                        )))
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 100.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      GestureDetector(
                        child: const Text(
                          'Sign up.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
