import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/home_layout.dart';
import 'package:social_app/modules/sign_up/sign_up.dart';
import 'package:social_app/shared/bloc/cubit.dart';
import 'package:social_app/shared/bloc/cubit_state.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  static var globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController? emailController = TextEditingController();
    TextEditingController? passWordController = TextEditingController();
    return BlocConsumer<SocialCubitApp, SocialStateApp>(
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
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Welcome In Our Social App",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
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
                        isPassword: cubit.isVisible ?false:true,
                        type: TextInputType.visiblePassword,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "Your Email Is Too Short";
                          }
                        },
                        label: "PassWord",
                        prefix: Icons.lock_open_outlined,
                        suffix: cubit.isVisible ? Icons.visibility:Icons.visibility_off,
                        suffixPressed: (){cubit.changeVisibility();}

                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defaultButton(
                          function: () {
                            if (globalKey.currentState!.validate()) {
                              cubit.userLogin(
                                  email:    emailController.text,
                                  password: passWordController.text);
                            }
                          },
                          text: "login"),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't Have An Account ?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Text("sign up".toUpperCase()))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is SocialLoginSucState) {
          CacheHelper.saveData(key: "uid", value: state.uId).then((value) =>
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeLayOut()),
                  (route) => false));
        }
      },
    );
  }
}
