import 'package:flutter/material.dart';
import 'screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-DO List App',
      // Remove a faixa de "Debug" no canto da tela
      debugShowCheckedModeBanner: false,
      // Define o tema global do nosso aplicativo
      theme: ThemeData(
        // Tema escuro
        brightness: Brightness.dark,
        // Cor primária (usada na AppBar, por exemplo)
        primaryColor: const Color(0xFF1e3799),
        // Cor de fundo do Scaffold (telas)
        scaffoldBackgroundColor: const Color(0xFF0d1117),
        // Cor de destaque para botões e outros elementos interativos
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF4a69bd),
          secondary: Color(0xFF4a69bd),
        ),
        // Define uma fonte padrão para o app
        fontFamily: 'Roboto',
        // Estilo para o FloatingActionButton
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF4a69bd),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF161b22),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const TodoScreen(),
    );
  }
}
