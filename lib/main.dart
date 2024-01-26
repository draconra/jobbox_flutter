import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './util/theme/colors.dart';
import './util/theme/types.dart';

import './views/home/home.dart';
import './views/authentication/sign_up_screen.dart';

import './model/data/user_model_data.dart';
import './model/data/job_model_data.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const JobboxApp());
}

class JobboxApp extends StatelessWidget {
  // -- Props --
  const JobboxApp({super.key});

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => UserModelData()),
        ChangeNotifierProvider(create: (c) => JobModelData()),
      ],
      child: MaterialApp(
        title: 'Jobbox',
        debugShowCheckedModeBanner: false,
        home: const Home(),
        themeMode: ThemeMode.light,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.brownDark.color,
            secondary: AppColors.orange.color,
            onSecondary: Colors.white,
            background: AppColors.orangeTint.color,
            onBackground: AppColors.brownDark.color,
            surface: Colors.white,
            onSurface: Colors.black,
            onSurfaceVariant: Colors.black.withOpacity(0.4),
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
                labelSmall: TextStyle(
                  color: AppColors.orange.color,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
                labelMedium: TextStyle(
                  color: AppColors.brownDark.color.withOpacity(0.45),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                labelLarge: TextStyle(
                  fontSize: 17,
                  color: AppColors.orange.color,
                  fontWeight: FontWeight.w600,
                ),
                titleMedium: TextStyle(
                  color: AppColors.brownDark.color,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.5,
                ),
                headlineMedium: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.brownDark.color,
                ),
                headlineLarge: TextStyle(
                  fontFamily: FontFamilies.antourOne.name,
                  fontSize: 23,
                  color: AppColors.brownDark.color,
                  letterSpacing: -1.5,
                ),
                bodyMedium: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.7,
                  color: AppColors.brownDark.color,
                ),
              ),
          primarySwatch: Colors.orange,
          primaryColor: AppColors.brownDark.color,
          fontFamily: FontFamilies.poppins.name,
          bottomNavigationBarTheme: ThemeData.light()
              .bottomNavigationBarTheme
              .copyWith(
                selectedLabelStyle: TextStyle(
                  color: AppColors.brownDark.color.withOpacity(0.45),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                unselectedItemColor: AppColors.brownDark.color.withOpacity(0.4),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
        ),
        routes: {
          SignUpScreen.routeName: (c) => const SignUpScreen(),
        },
      ),
    );
  }
}
