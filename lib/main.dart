import 'package:domining_app/screen/login/login_screen.dart';
import 'package:domining_app/utils/lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:localstorage/localstorage.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) {
        return const Center(
          child: SpinKitCubeGrid(
            color: Colors.green,
            size: 50.0,
          ),
        );
      },
      overlayColor: Colors.green,
      overlayWholeScreen: false,
      child: ToastificationWrapper(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Lang.primaryColor,
            secondaryHeaderColor: Lang.secondaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            colorScheme: const ColorScheme.dark(primary: Lang.primaryColor),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Lang.textColor,
              selectionColor: Lang.secondaryColor,
            ),
          ),
          title: 'Domining Hub',
          routes: {'login': (_) => const LoginScreen()},
          initialRoute: "login",
        ),
      ),
    );
  }
}
