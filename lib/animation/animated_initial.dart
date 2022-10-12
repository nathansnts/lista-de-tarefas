// ignore: file_names
import 'package:flutter/material.dart';
import 'package:lista_tarefas/home_page.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class animatedInitial extends StatefulWidget {
  const animatedInitial({Key? key}) : super(key: key);

  @override
  State<animatedInitial> createState() => _animatedInitialState();
}

class _animatedInitialState extends State<animatedInitial>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool checked = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _controller.duration = const Duration(milliseconds: 350);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void avancaPagina() {
    setState(() {
      Navigator.push(
        context,
        PageTransition(
          child: const MyHomePage(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 350),
          reverseDuration: const Duration(milliseconds: 350),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF34C7C7),
      appBar: AppBar(
        title: Text('LISTA DE TAREFAS'),
        backgroundColor: Color(0xFF34C7C7),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Image.asset(
                'imgs/icon/Lista.png',
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(height: 35),
            Center(
              child: Lottie.network(
                'https://assets9.lottiefiles.com/packages/lf20_rwq6ciql.json',
                height: 50,
                width: 50,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFFF4F7F7),
                            Color(0xFFFFFFFF),
                            Color(0xFFC3E7E7),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      primary: Color(0xFF34C7C7),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () => {
                      avancaPagina(),
                    },
                    child: const Text('Clique para iniciar'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 69,
            ),
            Text(
              'POWERED BY ASSETS TECHNOLOGY LTDA',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Color(0xFFF5F0F0),
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
