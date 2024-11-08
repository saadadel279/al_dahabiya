import 'package:al_dahabiya/core/widgets/custom_button.dart';
import 'package:al_dahabiya/core/widgets/custom_titiled_textfield.dart';
import 'package:al_dahabiya/feature/Auth/core/functions.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/auth_bg.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/custom_container.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/head_text.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/page_hint_text.dart';
import 'package:al_dahabiya/feature/Auth/featuers/update_password/presentation/view_model/cubit/update_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdatePasswordCubit, UpdatePasswordState>(
      listener: (context, state) {
        if (state is UpdatePasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Password updated successfully!")),
          );
        } else if (state is UpdatePasswordFaileur) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text("Failed to update password: ${state.errMessage}")),
          );
        }
      },
      child: Scaffold(
        body: AuthBg(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HeadText(
                    text: 'Let\'s Update your password',
                  ),
                  SizedBox(height: 10.h),
                  const PageHintText(
                    text: 'Enter your new password',
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
                                prefix: const Icon(Icons.lock_outline,
                                    size: 30,
                                    color: Color.fromARGB(255, 172, 170, 170)),
                                title: 'New Password',
                                hint: '********',
                                controller: _passwordController,
                                validator: Functions().passwordValidation,
                              ),
                              SizedBox(height: 40.h),
                              InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    context
                                        .read<UpdatePasswordCubit>()
                                        .updatePassword(
                                          _passwordController.text,
                                        );
                                  }
                                },
                                child: BlocBuilder<UpdatePasswordCubit,
                                    UpdatePasswordState>(
                                  builder: (context, state) {
                                    final isLoading =
                                        state is UpdatePasswordLoading;
                                    return CustomButton(
                                      isloading: isLoading,
                                      title: 'Change Password',
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
