import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tageradmin/core/methods/generate_route.dart';
import 'package:tageradmin/core/serviecs/servies_locator/servies_locator_.dart';
import 'package:tageradmin/core/serviecs/storage/supaBase_storage.dart';
import 'package:tageradmin/feature/splash/presentation/views/splash_view.dart';
import 'package:tageradmin/firebase_options.dart';
import 'package:tageradmin/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SupaBaseStorageServices.initSupabase();
  await SupaBaseStorageServices.createBuckets('fruitImages');
  setUP();
  runApp(
    DevicePreview(enabled: false, builder: (context) => const TagerAdmin()),
  );
}

class TagerAdmin extends StatelessWidget {
  const TagerAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),

      builder: DevicePreview.appBuilder,

      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
