import 'package:flutter/material.dart';
import 'package:marimba/models/helper.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

Helper helper = Helper();

class _QuizPageState extends State<QuizPage> {
  List<Widget> marcaPontos = [];

  limpa() {
    if (helper.numeroDasPerguntas >= 12) {
      marcaPontos = [];
      helper.setNumeroDasPerguntas = 0;
    }
  }

  confereResposta(bool respostaSelecionada) {
    bool respostaCerta = helper.obterResposta();
    setState(() {
      if (respostaSelecionada == respostaCerta) {
        marcaPontos.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
        limpa();
      } else if (respostaSelecionada != respostaCerta) {
        marcaPontos.add(const Icon(
          Icons.close_rounded,
          color: Colors.red,
        ));
        limpa();
      }

      helper.proximaPergunta();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  helper.obterQuestao(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: marcaPontos,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                ),
                child: const Text(
                  'Verdadeiro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  confereResposta(true);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.grey.shade800),
                ),
                child: const Text(
                  'Falso',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  confereResposta(false);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
