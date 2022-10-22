import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_configs/amplifyconfiguration.dart';
import 'cores/routes/app_pages.dart';
import 'cores/themes/app_themes.dart';

class GeoApp extends StatefulWidget {
  const GeoApp({super.key});

  @override
  State<GeoApp> createState() => _GeoAppState();
}

class _GeoAppState extends State<GeoApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      // logWriterCallback: Logger.write,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: AppTheme.lightTheme,
      // locale: TranslationService.locale,
      // fallbackLocale: TranslationService.fallbackLocale,
      // translations: TranslationService(),
    );
  }
}

Future<void> _configureAmplify() async {
  // Add any Amplify plugins you want to use
  final authPlugin = AmplifyAuthCognito();
  await Amplify.addPlugin(authPlugin);

  // You can use addPlugins if you are going to be adding multiple plugins
  // await Amplify.addPlugins([authPlugin, analyticsPlugin]);

  // Once Plugins are added, configure Amplify
  // Note: Amplify can only be configured once.
  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    safePrint(
        "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
  }
}
