import 'package:block_folio/screens/coinInfo_page.dart';
import 'package:block_folio/screens/home_page.dart';
import 'package:block_folio/themes/color_scheme.dart';
import 'package:block_folio/view_models/coins_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
        home: const HomePage(),
      ),
    );
  }
}
