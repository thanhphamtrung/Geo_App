import 'package:flutter/material.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:geo_app/src/geo_app.dart';

import 'src/app_configs/amplifyconfiguration.dart';

void main() {
  _configureAmplify();
  runApp(const GeoApp());
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
