import 'package:common/common.dart';

class ShuffledImages {
  final List<String> _happinessRecognitionsBasic = [
    Images.recognitionHappines,
    Images.happyBasic1,
    Images.happyBasic2,
  ];

  final List<String> _happinessRecognitionComplex = [
    Images.happinessSurprise,
    Images.happyComplex1,
    Images.happyComplex2,
    Images.happyComplex3,
  ];

  final List<String> _happinessUnderstandingBasic = [
    Images.understandingHappiness,
  ];

  final List<String> _happinessUnderstandingComplex = [
    Images.understandingSurprise,
    Images.surpriseComplex1,
    Images.surpriseComplex2,
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
