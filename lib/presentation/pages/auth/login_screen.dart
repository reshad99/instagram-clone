import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/data/auth/bloc/login/login_bloc.dart';
import 'package:instagram_clone/data/auth/request/login_request.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_blue_button.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_text_button.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_textfiedl.dart';
import 'package:instagram_clone/presentation/pages/auth/widgets/custom_sized_box.dart';
import 'package:instagram_clone/presentation/global_widgets/grey_line.dart';
import 'package:instagram_clone/services/response/error_handler.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

@RoutePage(name: 'LoginRouter')
class LoginRouterScreen extends AutoRouter {}

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late LoginBloc loginBloc;
  late AuthBloc authBloc;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    loginBloc = context.read<LoginBloc>();
    authBloc = context.read<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.delayed(Duration.zero);
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (context, state) {
          if (state is AuthError) {
            ErrorHandler.showError(context, state.errorResponse);
          } else if (state is AuthAuthenticated) {
            context.replaceRoute(const RouterPage());
          }
          return BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginError) {
                ErrorHandler.showError(context, state.errorResponse);
              }
            },
            builder: (context, state) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  leading: null,
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
                          borderRadius: 10,
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
                          borderRadius: 10,
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
                                onPressed: () {},
                                child: const Text('Forgot password?')),
                          ],
                        ),
                      ),
                      CustomSizedBox(
                        child: CustomBlueButton(
                          child: state is LoginLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Log in',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                          onPressed: () {
                            // AutoRouter.of(context).navigate(const HomeRoute());
                            loginBloc.add(LoginButtonPressed(
                                loginRequest: LoginRequest(
                                    login: usernameController.text,
                                    password: passwordController.text)));
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
                              Image.asset(
                                  'assets/images/default/facebook-logo.png'),
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
                          CustomTextButton(
                              onPressed: () {
                                context.navigateTo(const RegisterRoute());
                              },
                              child: const Text('Sign up'))
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
