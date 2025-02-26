import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:catcher/catcher.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:pegasus_pdv/src/infra/infra.dart';

import 'package:pegasus_pdv/src/database/database.dart';

import 'package:sqlite3/open.dart';

import 'package:pegasus_pdv/src/view/shared/page/splash_screen_page.dart';
import 'package:pegasus_pdv/src/view/page/page.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  if (Platform.isWindows) {
    open.overrideFor(OperatingSystem.windows, _openOnWindows);
  }

  // runApp(MyApp());

  ///configuração para tratar erros em modo de debug (desenvolvimento)
  CatcherOptions debugOptions = CatcherOptions(
    ///Vai mostrar o erro numa caixa de diálogo
    DialogReportMode(),

    ///Vai mostrar o erro numa página
    // PageReportMode(showStackTrace: true),
    [
      //Manda os erros para o Sentry
      SentryHandler(
        SentryClient(SentryOptions(dsn: Constantes.sentryDns)),
      ),

      ///Imprime os erros no Console
      ConsoleHandler()
    ],
    localizationOptions: [
      LocalizationOptions.buildDefaultPortugueseOptions(),
    ],
    customParameters: {"versao-atual": Constantes.versaoApp},
  );

  ///configuração para tratar erros em modo de release (produção)
  CatcherOptions releaseOptions = CatcherOptions(
    ///Vai mostrar o erro numa página
    DialogReportMode(),

    ///Vai mostrar o erro numa página
    // PageReportMode(showStackTrace: true),
    [
      //Manda os erros para o Sentry
      SentryHandler(
        SentryClient(SentryOptions(dsn: Constantes.sentryDns)),
      ),

      ///Imprime os erros no Console
      ConsoleHandler(),
    ],
    localizationOptions: [
      LocalizationOptions.buildDefaultPortugueseOptions(),
    ],
    customParameters: {"versao-atual": Constantes.versaoApp},
  );

  ///Inicia o Catcher e então inicia a aplicação.
  ///O Catcher vai pegar e reportar os erros de forma global
  Catcher(
    runAppFunction: () {
      runApp(const MyApp());
    },
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
  );
}

DynamicLibrary _openOnWindows() {
  try {
    // final scriptDir = File(Platform.script.toFilePath()).parent;
    // final libraryNextToScript = File('${scriptDir.path}/sqlite3.dll');
    final libraryNextToScript = File('sqlite3.dll');
    return DynamicLibrary.open(libraryNextToScript.path);
  } catch (e) {
    debugPrint(e.toString());
    throw 'Erro: ' +
        DateTime.now().toIso8601String() +
        ' - Exceção: ' +
        e.toString();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Provider<AppDatabase>(
        create: (context) => AppDatabase(),
        dispose: (context, db) => db.close(),
        builder: (context, value) {
          return FutureBuilder(
            future: Future.delayed(const Duration(seconds: 3), () async {
              await Sessao.popularObjetosPrincipais(context);
              if (Biblioteca.isDesktop()) {
                await DesktopWindow.setMinWindowSize(const Size(800, 600));
                await DesktopWindow.resetMaxWindowSize();
                await DesktopWindow.toggleFullScreen();
              }
            }),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _materialApp(splash: true);
              } else {
                return _materialApp(splash: false);
              }
            },
          );
        });
  }
}

Widget _materialApp({bool? splash}) {
  return MaterialApp(
    navigatorKey: Catcher.navigatorKey,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('pt', 'PT'),
    ],
    debugShowCheckedModeBanner: false,
    title: Constantes.nomeApp,
    onGenerateRoute: Rotas.definirRotas,
    theme: ThemeData(),
    home: splash == true ? const SplashScreenPage() : const CaixaPage(),
  );
}
