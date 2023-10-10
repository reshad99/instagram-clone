import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/data/auth/bloc/auth/auth_bloc.dart';
import 'package:instagram_clone/data/auth/bloc/register/register_bloc.dart';
import 'package:instagram_clone/data/auth/request/register_request.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_blue_button.dart';
import 'package:instagram_clone/presentation/global_widgets/custom_textfiedl.dart';
import 'package:instagram_clone/presentation/pages/auth/widgets/custom_sized_box.dart';
import 'package:instagram_clone/services/response/error_handler.dart';
import 'package:instagram_clone/services/routes/nested_router.gr.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  late RegisterBloc registerBloc;
  late AuthBloc authBloc;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    registerBloc = context.read<RegisterBloc>();
    authBloc = context.read<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: authBloc,
      builder: (context, state) {
        debugPrint('authstate is $state');
        if (state is AuthError) {
          ErrorHandler.showError(context, state.errorResponse);
        } else if (state is AuthAuthenticated) {
          debugPrint("state is auth");
          context.replaceRoute(const RouterPage());
        }

        return BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            debugPrint('registerState is $state');

            if (state is RegisterError) {
              ErrorHandler.showError(context, state.errorResponse);
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                child: Center(
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
                          controller: emailController,
                          hint: 'Email',
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomSizedBox(
                        child: CustomTextField(
                          borderRadius: 10,
                          size: size,
                          controller: phoneController,
                          hint: 'Phone',
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
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
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomSizedBox(
                        child: CustomTextField(
                          borderRadius: 10,
                          size: size,
                          controller: passwordConfirmationController,
                          hint: 'Password confirmation',
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomSizedBox(
                        child: CustomBlueButton(
                          child: state is RegisterLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                          onPressed: () {
                            // AutoRouter.of(context).navigate(const HomeRoute());
                            registerBloc.add(SignUpButtonPressed(
                                registerRequest: RegisterRequest(
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    username: usernameController.text,
                                    password: passwordController.text,
                                    passwordConfirmation:
                                        passwordConfirmationController.text)));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
