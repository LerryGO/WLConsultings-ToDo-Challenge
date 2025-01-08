import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => DatabaseHelper(),
        ),
      ],
      builder: (context, _) {
        return FutureBuilder(
          future: Provider.of<DatabaseHelper>(context, listen: false).database,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Mostre um indicador de progresso enquanto o banco de dados é carregado
              return const MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }

            if (snapshot.hasError) {
              // Mostre uma tela de erro caso a inicialização falhe
              return MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: Text(
                      'Erro ao inicializar o banco de dados',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  ),
                ),
              );
            }

            if (!snapshot.hasData) {
              // Trate o caso improvável de o snapshot não conter dados
              return MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: Text(
                      'Banco de dados não disponível',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
              );
            }

            // Quando o banco estiver pronto, forneça o Database globalmente
            return MultiProvider(
              providers: [
                Provider<Database>.value(value: snapshot.data!),
              ],
              child: child, // Continue com o app normalmente
            );
          },
        );
      },
    );
  }
}
