import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/home_layout.dart';
import 'package:social_app/shared/bloc/cubit.dart';
import 'package:social_app/shared/bloc/cubit_state.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';


class SignUp extends StatelessWidget {
  static var globalKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubitApp(),
      child: BlocConsumer<SocialCubitApp, SocialStateApp>(
        builder: (context, state) {
          SocialCubitApp cubit = SocialCubitApp.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "REGISTER",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Welcome To Register In Jo App",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                            controller: nameController,
                            type: TextInputType.name,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return "Your Value Is Empty";
                              }
                            },
                            label: "Name",
                            prefix: Icons.person),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return "Your Email Is Too Short";
                              }
                            },
                            label: "EmailAddress",
                            prefix: Icons.email_outlined),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: passWordController,
                          type: TextInputType.visiblePassword,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "Your Value Is Empty";
                            }
                          },
                          label: "PassWord",
                          prefix: Icons.lock,
                          isPassword: true,
                          suffix: Icons.visibility,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "Your Value Is Empty";
                            }
                          },
                          label: "Phone",
                          prefix: Icons.phone_android_sharp,
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        defaultButton(
                            function: () {
                              if (globalKey.currentState!.validate()) {
                                cubit.userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passWordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: "REGISTER"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if(state is SocialRegisterSucState )
          {
            CacheHelper.saveData(key:"uid", value: state.uId)
                .then((value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context)=>HomeLayOut()),
                    (route) => false));
          }
        },
      ),
    );
  }
}
