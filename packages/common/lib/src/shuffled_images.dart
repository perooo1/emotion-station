import 'package:common/common.dart';

class ShuffledImages {
  final List<String> _happinessRecognitionsBasic = [
    Images.recognitionHappines,
    Images.recognitionAnger,
    Images.recognitionFear,
    Images.recognitionSadness,
  ];

  final List<String> _happinessRecognitionComplex = [
    Images.happinessSurprise,
    Images.fearNervous,
    Images.homeScreenHero,
    Images.recognitionSadness,
  ];

  final List<String> _happinessUnderstandingBasic = [
    Images.understandingHappiness,
    Images.recognitionAnger,
    Images.recognitionFear,
    Images.recognitionSadness,
  ];

  final List<String> _happinessUnderstandingComplex = [
    Images.understandingSurprise,
    Images.recognitionAnger,
    Images.recognitionFear,
    Images.recognitionSadness,
  ];

  String getRandomHappinessRecognitionsBasic() {
    final List<String> random = _happinessRecognitionsBasic;
    random.shuffle();
    return random[0];
  }

  String getRandomHappinessRecognitionsComplex() {
    final List<String> random = _happinessRecognitionComplex;
    random.shuffle();
    return random[0];
  }

  String getRandomHappinessUnderstandingBasic() {
    final List<String> random = _happinessUnderstandingBasic;
    random.shuffle();
    return random[0];
  }

  String getRandomHappinessUnderstandingComplex() {
    final List<String> random = _happinessUnderstandingComplex;
    random.shuffle();
    return random[0];
  }
}
