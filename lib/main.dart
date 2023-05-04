import 'package:block_folio/models/coin_detail.dart';
import 'package:block_folio/screens/coin_detail_screen.dart';
import 'package:block_folio/screens/coin_detail_screen.dart';
import 'package:block_folio/screens/home_page.dart';
import 'package:block_folio/screens/registration_page.dart';
import 'package:block_folio/themes/color_scheme.dart';
import 'package:block_folio/view_models/auth_viewmodel.dart';
import 'package:block_folio/view_models/coins_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BlockfolioApp());
}

class BlockfolioApp extends StatelessWidget {
  const BlockfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CoinsViewModel>(create: (_) => CoinsViewModel()),
        ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme,
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const HomePage(),
          '/profile': (context) => const ProfileScreen(),
          '/register': (context) => const RegistrationScreen(),
          '/coinInfo': (context) => CoinDetailScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
