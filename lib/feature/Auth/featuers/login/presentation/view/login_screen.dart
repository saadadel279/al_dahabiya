import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/widgets/custom_button.dart';
import 'package:al_dahabiya/core/widgets/custom_titiled_textfield.dart';
import 'package:al_dahabiya/core/widgets/snak_bar.dart';
import 'package:al_dahabiya/feature/Auth/core/functions.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/action_row.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/auth_bg.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/custom_container.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/head_text.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/page_hint_text.dart';
import 'package:al_dahabiya/feature/Auth/featuers/login/presentation/view_mode/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBg(
        child: Center(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginFaileur) {
                showSnackBar(context, state.errMessage);
                isLoading = false;
              } else if (state is LoginLoading) {
                isLoading = true;
              } else if (state is LoginSucsess) {
                isLoading = false;
                showSnackBar(context, "Welcome!");

                GoRouter.of(context).pushReplacement(AppRouters.kHomeRoute);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const HeadText(
                      text: 'Let\'s Sign you in',
                    ),
                    SizedBox(height: 10.h),
                    const PageHintText(
                      text: 'Welcome back, you\'ve been missed',
                    ),
                    SizedBox(height: 50.h),
                    CustomContainer(
                      width: 330.w,
                      height: 330.h,
                      child: Padding(
                        padding: EdgeInsets.all(20.0.w),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTitledTextField(
                                  prefix: const Icon(Icons.person_2_outlined,
                                      size: 30,
                                      color:
                                          Color.fromARGB(255, 172, 170, 170)),
                                  title: 'Phone Number',
                                  hint: '+201234567891',
                                  sufix: const Icon(
                                    Icons.done,
                                    size: 30,
                                    color: Colors.green,
                                  ),
                                  controller: _phoneController,
                                  validator: Functions().phoneValidation,
                                ),
                                SizedBox(height: 20.h),
                                CustomTitledTextField(
                                  prefix: const Icon(Icons.lock_outline,
                                      size: 30,
                                      color:
                                          Color.fromARGB(255, 172, 170, 170)),
                                  title: 'Password',
                                  hint: '********',
                                  sufix: Text(
                                    'Forget?',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  controller: _passwordController,
                                  validator: Functions().passwordValidation,
                                ),
                                SizedBox(height: 40.h),
                                InkWell(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        final loginCubit =
                                            context.read<LoginCubit>();
                                        loginCubit.login(
                                            phone: _phoneController.text,
                                            password: _passwordController.text);
                                      }
                                    },
                                    child: CustomButton(
                                      isloading: isLoading,
                                      title: 'Sign In',
                                    )),
                                SizedBox(height: 20.h),
                                ActionRow(
                                  fText: 'Don\'t have an account?',
                                  sText: ' Sign Up',
                                  onTapforAction: () {
                                    GoRouter.of(context)
                                        .push(AppRouters.kSignUpRoute);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
