import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import the generated localization class

class MobileHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!
            .app_name), // Use localized string for the AppBar title
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!
            .welcome_msg), // Use localized string for the body text
      ),
    );
  }
}
