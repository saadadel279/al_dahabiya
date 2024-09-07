import 'package:al_dahabiya/core/widgets/custom_button.dart';
import 'package:al_dahabiya/core/widgets/custom_titiled_textfield.dart';
import 'package:al_dahabiya/feature/Auth/core/widgets/action_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFD04430),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Let\'s Sign you in',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              const Text('Welcome back, you\'ve been missed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
              SizedBox(height: 50.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                width: 330.w,
                height: 350.h,
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
                                color: Color.fromARGB(255, 172, 170, 170)),
                            title: 'UserName or Email',
                            hint: 'jon Due',
                            sufix: const Icon(
                              Icons.done,
                              size: 30,
                              color: Colors.green,
                            ),
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[\w-]+@([\w-]+\.)+[\w]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTitledTextField(
                            prefix: const Icon(Icons.lock_outline,
                                size: 30,
                                color: Color.fromARGB(255, 172, 170, 170)),
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 45),
                          InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              child: const CustomButton()),
                          const SizedBox(height: 10),
                          const ActionRow(
                            fText: 'Don\'t have an account?',
                            sText: ' Sign Up',
                          )
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
    );
  }
}
