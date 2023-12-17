import 'package:common/common.dart';

class ShuffledImages {
  final List<String> _happinessRecognitionsBasic = [
    Images.recognitionHappines,
    Images.happyBasic1,
    Images.happyBasic2,
  ];

  final List<String> _happinessRecognitionComplex = [
    Images.happinessSurprise,
    /*
    Images.happyComplex1,
    Images.happyComplex2,
    Images.happyComplex3,
    */
  ];

  final List<String> _happinessUnderstandingBasic = [
    Images.understandingHappiness,
  ];

  final List<String> _happinessUnderstandingComplex = [
    Images.understandingSurprise,
    Images.surpriseComplex1,
    Images.surpriseComplex2,
  ];

  //sadness

  final List<String> _sadnessRecognitionBasic = [
    Images.recognitionSadness,
    Images.sadBasic1,
    Images.sadBasic2,
    Images.sadBasic3,
    Images.sadBasic4,
  ];

  final List<String> _sadnessRecognitionComplex = [
    Images.disappointedBasic1,
    Images.disappointedBasic2,
    Images.disappointedBasic3,
  ];

  final List<String> _sadnessUnderstandingBasic = [
    Images.sadBasic3,
  ];

  final List<String> _sadnessUnderstandingComplex = [
    Images.disappointedComplex1,
    Images.disappointedComplex2,
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

//Sadness

  String getRandomSadnessRecognitionsBasic() {
    final List<String> random = _sadnessRecognitionBasic;
    random.shuffle();
    return random[0];
  }

  String getRandomSadnessRecognitionsComplex() {
    final List<String> random = _sadnessRecognitionComplex;
    random.shuffle();
    return random[0];
  }

  String getRandomSadnessUnderstandingBasic() {
    final List<String> random = _sadnessUnderstandingBasic;
    random.shuffle();
    return random[0];
  }

  String getRandomSadnessUnderstandingComplex() {
    final List<String> random = _sadnessUnderstandingComplex;
    random.shuffle();
    return random[0];
  }
}
