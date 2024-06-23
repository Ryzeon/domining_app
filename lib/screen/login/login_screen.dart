import 'package:domining_app/layout/base_layout.dart';
import 'package:domining_app/screen/sign_up/sign_up_screen.dart';
import 'package:domining_app/shared/widgets/items/widgets.dart';
import 'package:domining_app/shared/widgets/resources/colors.dart';
import 'package:domining_app/shared/widgets/resources/fields.dart';
import 'package:domining_app/utils/methods.dart';
import 'package:domining_app/utils/provider/provider.dart';
import 'package:domining_app/utils/validator/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: 'Login',
      dis: 'Welcome to domining hub, please login to continue',
      fields: Container(
         decoration: BoxDecoration(
            color: AppColors.second, borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.all(20),
        child: Form(
          key: key,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextFields(
                  hint: 'Username',
                  validator: (name) {
                    return AppValidator.requiredField(name ?? '');
                  },
                ),
                freev(),
                AppPassFields(
                  validator: (pass) {
                    return AppValidator.passFieldValidator(pass ?? '');
                  },
                ),
                freev(v: 10),
                buttons(
                    text: 'Login',
                    color: Colors.green,
                    onTap: () {
                      if (key.currentState!.validate()) {
                        //go to Home page
                      }
                    }),
                buttons(
                    text: 'SignUp',
                    color: AppColors.black,
                    onTap: () {
                      navigatePush(context,
                          secondPage: ChangeNotifierProvider(
                              create: (context) {
                                return AppProvider();
                              },
                              child: const SignUpScreen()));
                    }),
                freev(),
                // FutureBuilder(
                //   future: Authentication.fireBaseInit(),
                //   builder: (context, snap) {
                //     if (snap.hasError) {
                //       return Text('Error while initializing firebase');
                //     } else if (snap.connectionState == ConnectionState.done) {
                //       return InkWell(
                //         onTap: () async {
                //           setState(() {
                //             isSignIn = true;
                //           });
                //           User? user = await Authentication.signInWithGoogle(
                //               context: context);
                //           setState(() {
                //             isSignIn = false;
                //           });
                //           if (user != null) {
                //             Navigator.pushReplacement(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => UserHome(user: user)));
                //           }
                //         },
                //         child: Container(
                //           height: 35,
                //           decoration: BoxDecoration(
                //               color: AppColors.primary,
                //               borderRadius: BorderRadius.circular(30)),
                //           child: Center(
                //             child: Text(
                //               'Sign In With Google',
                //               style: AppStyles.regular(
                //                 color: AppColors.white,
                //               ),
                //             ),
                //           ),
                //         ),
                //       );
                //     }
                //     return CircularProgressIndicator(
                //       valueColor: const AlwaysStoppedAnimation(Colors.orange),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
