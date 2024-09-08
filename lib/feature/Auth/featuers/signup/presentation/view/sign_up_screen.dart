import 'package:al_dahabiya/core/app_router.dart';
import 'package:al_dahabiya/core/widgets/custom_button.dart';
import 'package:al_dahabiya/core/widgets/custom_titiled_textfield.dart';
import 'package:al_dahabiya/core/widgets/snak_bar.dart';
import 'package:al_dahabiya/feature/Auth/core/functions.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/action_row.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/custom_container.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/head_text.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/page_hint_text.dart';
import 'package:al_dahabiya/feature/Auth/featuers/signup/presentation/view_model/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/auth_bg.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBg(
      child: Center(
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpFaileur) {
              showSnackBar(context, state.errMessage);
              isLoading = false;
            } else if (state is SignUpLoading) {
              isLoading = true;
            } else if (state is SignUpSucsess) {
              isLoading = false;
              showSnackBar(context, "تم التسجيل بنجاح");
              GoRouter.of(context).pushReplacement(AppRouters.kLoginRoute);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const HeadText(text: 'Get Started'),
                  SizedBox(height: 10.h),
                  const PageHintText(text: 'Create an account to continue'),
                  SizedBox(height: 50.h),
                  CustomContainer(
                    width: 330.w,
                    height: 500.h,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTitledTextField(
                                validator: Functions().nameValidation,
                                controller: _nameController,
                                title: 'Your Name',
                                hint: 'Jon Due',
                                sufix: const Icon(
                                  Icons.done,
                                  size: 30,
                                  color: Colors.green,
                                ),
                                prefix: const Icon(
                                  Icons.person_2_outlined,
                                  size: 30,
                                  color: Color.fromARGB(255, 172, 170, 170),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              CustomTitledTextField(
                                validator: Functions().phoneValidation,
                                controller: _phoneController,
                                title: 'Phone Number',
                                hint: '+20123456789',
                                prefix: const Icon(
                                  Icons.phone_android_rounded,
                                  size: 30,
                                  color: Color.fromARGB(255, 172, 170, 170),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              CustomTitledTextField(
                                validator: Functions().emailValidation,
                                controller: _emailController,
                                title: 'Email',
                                hint: 'qkLpE@example.com',
                                prefix: const Icon(
                                  Icons.email_outlined,
                                  size: 30,
                                  color: Color.fromARGB(255, 172, 170, 170),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              CustomTitledTextField(
                                controller: _passwordController,
                                validator: Functions().passwordValidation,
                                title: 'Password',
                                hint: '**********',
                                prefix: const Icon(
                                  Icons.lock_outline,
                                  size: 30,
                                  color: Color.fromARGB(255, 172, 170, 170),
                                ),
                              ),
                              SizedBox(height: 40.h),
                              CustomButton(
                                isloading: isLoading,
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    var signUpCubit =
                                        context.read<SignUpCubit>();
                                    signUpCubit.signUp(
                                        firstName: _nameController.text,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        phone: _phoneController.text);
                                  }
                                },
                                title: 'Sign Up',
                              ),
                              SizedBox(height: 20.h),
                              ActionRow(
                                  onTapforAction: () => GoRouter.of(context)
                                      .push(AppRouters.kLoginRoute),
                                  fText: 'Already have an account?',
                                  sText: ' Sign In'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
