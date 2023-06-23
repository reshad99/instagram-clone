import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_blue_button.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_text_button.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_textfiedl.dart';
import 'package:instagram_clone/presentation/pages/auth/widgets/custom_sized_box.dart';
import 'package:instagram_clone/presentation/global_widgets/grey_line.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: primaryIconColor,
            )),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Image.asset('assets/images/default/logo-light.png'),
            SizedBox(
              height: 50.h,
            ),
            CustomSizedBox(
              child: CustomTextField(
                size: size,
                controller: usernameController,
                hint: 'Username',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomSizedBox(
              child: CustomTextField(
                size: size,
                controller: passwordController,
                hint: 'Password',
              ),
            ),
            CustomSizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {}, child: const Text('Forgot password?')),
                ],
              ),
            ),
            CustomSizedBox(
              child: CustomBlueButton(
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  AutoRouter.of(context).navigate(const HomeRoute());
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/default/facebook-logo.png'),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Text('Log in with facebook')
                  ],
                )),
            SizedBox(
              height: 25.h,
            ),
            CustomSizedBox(
              child: Row(
                children: [
                  const GreyLine(sizeRate: 0.3),
                  SizedBox(
                    width: 40.w,
                  ),
                  const Text(
                    'OR',
                    style: TextStyle(
                        color: primaryGreyColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  const GreyLine(
                    sizeRate: 0.3,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: primaryGreyColor),
                ),
                CustomTextButton(onPressed: () {}, child: const Text('Sign up'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
