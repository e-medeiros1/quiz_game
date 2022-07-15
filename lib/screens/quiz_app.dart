import 'package:flutter/material.dart';
import 'package:marimba/models/helper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Helper helper = Helper();
  List<Widget> marcaPontos = [];

  limpa() {}

  alert() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "PARABÉNS",
      desc: "Parabéns por concluir nosso jogo",
      buttons: [
        DialogButton(
          onPressed: () {
            setState(() {
              marcaPontos = [];
              helper.setNumeroDasPerguntas = 0;
              Navigator.of(context).pop();
            });
          },
          width: 120,
          child: const Text(
            "REINICIAR",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  confereResposta(bool respostaSelecionada) {
    bool respostaCerta = helper.obterResposta();
    setState(() {
      if (respostaSelecionada == respostaCerta) {
        marcaPontos.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
        helper.proximaPergunta();
      }
      if (respostaSelecionada != respostaCerta) {
        marcaPontos.add(const Icon(
          Icons.close_rounded,
          color: Colors.red,
        ));
        helper.proximaPergunta();
      }
      if (helper.numeroDasPerguntas >= 12) {
        alert();
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow.shade50,
                  ),
                  height: 400,
                  child: Center(
                    child: Text(
                      helper.obterQuestao(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.yellow.shade50,
                height: 50,
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: marcaPontos,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: FloatingActionButton(
                      elevation: 3,
                      isExtended: true,
                      backgroundColor: Colors.white,
                      onPressed: () => confereResposta(true),
                      child: const Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: FloatingActionButton(
                      elevation: 3,
                      backgroundColor: Colors.white,
                      onPressed: () => confereResposta(false),
                      child: const Icon(
                        Icons.close_rounded,
                        color: Colors.red,
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
