import 'package:dio/dio.dart';
import 'package:domining_app/iam/authentication.service.dart';
import 'package:domining_app/layout/base_layout.dart';
import 'package:toastification/toastification.dart';
import 'package:domining_app/model/iam/request/sign_up.request.dart';
import 'package:domining_app/shared/widgets/items/widgets.dart';
import 'package:domining_app/shared/widgets/resources/colors.dart';
import 'package:domining_app/shared/widgets/resources/fields.dart';
import 'package:domining_app/utils/methods.dart';
import 'package:domining_app/utils/validator/validators.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  SignUpRequest request = SignUpRequest();

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      leading: IconButton(
          onPressed: () {
            navigatePop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.black,
            size: 20,
          )),
      title: 'Register',
      dis: "Complete the form to create an account",
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
                  hint: 'Names',
                  validator: (name) {
                    return AppValidator.requiredField(name ?? '');
                  },
                  onChanged: (p0) => request.names = p0,
                ),
                freev(),
                AppTextFields(
                  hint: 'Lastname',
                  validator: (lastName) {
                    return AppValidator.requiredField(lastName ?? '');
                  },
                  onChanged: (p0) => request.lastNames = p0,
                ),
                freev(),
                AppTextFields(
                  hint: 'Email',
                  validator: (mail) {
                    return AppValidator.mailFieldValidator(mail ?? '');
                  },
                  onChanged: (p0) => request.email = p0,
                ),
                freev(),
                AppPassFields(
                  validator: (pass) {
                    return AppValidator.passFieldValidator(pass ?? '');
                  },
                  onChanged: (p0) => request.password = p0,
                ),
                freev(v: 10),
                freev(),
                FutureBuilder(
                  future: Authentication.checkServer(),
                  builder: (context, snap) {
                    if (snap.hasError) {
                      return const Text('Error');
                    } else if (snap.connectionState == ConnectionState.done) {
                      return buttons(
                          text: 'SignUp',
                          color: Colors.green,
                          onTap: () {
                            if (key.currentState!.validate()) {
                              try {
                                Authentication.signUp(request).then(
                                  (value) {
                                    // en un thread principal
                                    navigatePop(context);
                                    toastification.show(
                                      primaryColor: Colors.green,
                                      title: const Text(
                                          "User registered successfully"),
                                      autoCloseDuration:
                                          const Duration(seconds: 2),
                                      closeButtonShowType:
                                          CloseButtonShowType.none,
                                    );
                                  },
                                );
                              } catch (e) {
                                String errorMessage =
                                    "We cannot sign up the user"; // Mensaje por defecto
                                if (e is DioException) {
                                  // Si la excepción es un DioError, intenta extraer el mensaje personalizado
                                  errorMessage = e.response?.data['message'] ??
                                      "Unknown error occurred";
                                } else if (e is Exception) {
                                  // Aquí puedes manejar otros tipos de excepciones si es necesario
                                  errorMessage = e.toString();
                                }
                                toastification.show(
                                  primaryColor: Colors.red,
                                  title: Text(
                                      errorMessage), // Mostrar el mensaje de error en el toast
                                  autoCloseDuration: const Duration(seconds: 3),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
