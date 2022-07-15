import 'package:marimba/models/perguntas.dart';

class Helper {
  int _numeroDasPerguntas = 0;

  final List<Perguntas> _allQuestions = [
    Perguntas(
        question: 'O metrô é um dos meios de transporte mais seguros do mundo.',
        resposta: true),
    Perguntas(
        question: 'A culinária brasileira é uma das melhores do mundo.',
        resposta: true),
    Perguntas(
        question:
            'Vacas podem voar, assim como peixes utilizam os pés para andar.',
        resposta: false),
    Perguntas(
        question: 'A maioria dos peixes podem viver fora da água.',
        resposta: false),
    Perguntas(
        question: 'A lâmpada foi inventada por um brasileiro.',
        resposta: false),
    Perguntas(
        question:
            'É possível utilizar a carteira de habilitação de carro para dirigir um avião.',
        resposta: false),
    Perguntas(
        question: 'O Brasil possui 26 estados e 1 Distrito Federal.',
        resposta: true),
    Perguntas(
        question:
            'Bitcoin é o nome dado a uma das moedas virtuais mais famosas.',
        resposta: true),
    Perguntas(question: '1 minuto equivale a 60 segundos.', resposta: true),
    Perguntas(
        question: '1 segundo equivale a 200 milissegundos.', resposta: false),
    Perguntas(
        question:
            'O Burj Khalifa, em Dubai, é considerado o maior prédio do mundo.',
        resposta: true),
    Perguntas(
        question: 'Ler após uma refeição prejudica a visão humana.',
        resposta: false),
    Perguntas(
        question: 'O cartão de crédito pode ser considerado uma moeda virtual.',
        resposta: false),
  ];

  String obterQuestao() {
    return _allQuestions[_numeroDasPerguntas].question;
  }

  bool obterResposta() {
    return _allQuestions[_numeroDasPerguntas].resposta;
  }

  proximaPergunta() {
    if (_numeroDasPerguntas < _allQuestions.length - 1) {
      _numeroDasPerguntas++;
    }
  }

  limpaQuestionario() {
    if (_numeroDasPerguntas > _allQuestions.length) {
      _numeroDasPerguntas = 0;
      _allQuestions.clear;
    }
  }

  int get numeroDasPerguntas {
    return _numeroDasPerguntas;
  }

   set setNumeroDasPerguntas(int zeraQuestionario) {
    _numeroDasPerguntas = 0;
  }
}
