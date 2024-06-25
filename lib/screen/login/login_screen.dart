import 'package:domining_app/iam/authentication.service.dart';
import 'package:domining_app/layout/base_layout.dart';
import 'package:domining_app/model/iam/request/sign_in.request.dart';
import 'package:domining_app/screen/home/home_screen.dart';
import 'package:domining_app/screen/sign_up/sign_up_screen.dart';
import 'package:domining_app/shared/widgets/items/widgets.dart';
import 'package:domining_app/shared/widgets/resources/colors.dart';
import 'package:domining_app/shared/widgets/resources/fields.dart';
import 'package:domining_app/utils/methods.dart';
import 'package:domining_app/utils/provider/provider.dart';
import 'package:domining_app/utils/validator/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  final SignInRequest request = SignInRequest();

  // on init
  @override
  void initState() {
    super.initState();
    Authentication.retrieveToken().then((value) {
      if (value) {
      
        navigatePush(context,
            secondPage: ChangeNotifierProvider(
                create: (context) {
                  return AppProvider();
                },
                child: const HomeScreen()));
        toastification.show(
            primaryColor: Colors.green,
            title: const Text(
                'Welcome to Domining Hub'), // Mostrar el mensaje de éxito en el toast
            closeButtonShowType: CloseButtonShowType.none,
            autoCloseDuration: const Duration(seconds: 2));
      }
    });
  }

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
                  hint: 'Username or Email',
                  validator: (name) {
                    return AppValidator.requiredField(name ?? '');
                  },
                  onChanged: (p0) => request.usernameOrEmail = p0,
                ),
                freev(),
                AppPassFields(
                  validator: (pass) {
                    return AppValidator.passFieldValidator(pass ?? '');
                  },
                  onChanged: (p0) => request.password = p0,
                ),
                freev(v: 10),
                FutureBuilder(
                  future: Authentication.checkServer(),
                  builder: (context, snap) {
                    if (snap.hasError) {
                      return const Text('Error');
                    } else if (snap.connectionState == ConnectionState.done) {
                      return buttons(
                          text: 'Login',
                          color: Colors.green,
                          onTap: () {
                            if (key.currentState!.validate()) {
                              try {
                                Authentication.signIn(request).then(
                                  (value) {
                                    navigatePush(context,
                                        secondPage: ChangeNotifierProvider(
                                            create: (context) {
                                              return AppProvider();
                                            },
                                            child: const HomeScreen()));
                                    toastification.show(
                                        primaryColor: Colors.green,
                                        closeButtonShowType:
                                            CloseButtonShowType.none,
                                        title: const Text(
                                            'Welcome to Domining Hub'), // Mostrar el mensaje de éxito en el toast
                                        autoCloseDuration:
                                            const Duration(seconds: 2));
                                  },
                                ).onError(
                                  (error, stackTrace) {
                                    String errorMessage =
                                        "Check your credentials and try again";
                                    toastification.show(
                                      primaryColor: Colors.red,
                                      title: Text(
                                          errorMessage), // Mostrar el mensaje de error en el toast
                                      autoCloseDuration:
                                          const Duration(seconds: 2),
                                    );
                                  },
                                );
                              } catch (e) {
                                String errorMessage =
                                    "Check your credentials and try again";
                                toastification.show(
                                  primaryColor: Colors.red,
                                  title: Text(
                                      errorMessage), // Mostrar el mensaje de error en el toast
                                  autoCloseDuration: const Duration(seconds: 2),
                                );
                              }
                            }
                          });
                    }
                    return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(AppColors.primary),
                    );
                  },
                ),
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
                freev(v: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
