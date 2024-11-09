import 'package:common/common.dart';

class ShuffledImages {
  //Happiness

  final List<String> _happinessRecognitionsBasic = [
    Images.recognitionHappines,
    Images.happyBasic1,
    Images.happyBasic2,
  ];

  final List<String> _happinessRecognitionComplex = [
    Images.happinessSurprise,
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

  //Sadness

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

  //Anger

  final List<String> _angerRecognitionBasic = [
    Images.angerBasic1,
    Images.angerBasic2,
    Images.angerBasic3,
  ];

  final List<String> _angerComplex = [
    Images.angerComplex1,
    Images.angerComplex2,
  ];

  final List<String> _jelousBasic = [
    Images.angerJelousy,
    Images.jelousBasic1,
    Images.jelousBasic2,
  ];

  final List<String> _jelousComplex = [
    Images.jelousComplex1,
    Images.jelousComplex2,
  ];

  String getRandomAngerRecognitionsBasic() {
    final List<String> random = _angerRecognitionBasic;
    random.shuffle();
    return random[0];
  }

  String getRandomAngerRecognitionsComplex() {
    final List<String> random = _angerComplex;
    random.shuffle();
    return random[0];
  }

  String getRandomJelousBasic() {
    final List<String> random = _jelousBasic;
    random.shuffle();
    return random[0];
  }

  String getRandomJelousComplex() {
    final List<String> random = _jelousComplex;
    random.shuffle();
    return random[0];
  }

  //Fear

  final List<String> _fearBasic = [
    Images.fearBasic1,
    Images.fearBasic2,
  ];

  final List<String> _fearComplex = [
    Images.fearComplex1,
    Images.fearComplex2,
  ];

  final List<String> _nervousBasic = [
    Images.nervousBasic1,
    Images.nervousBasic2,
  ];

  final List<String> _nervousComplex = [
    Images.nervousComplex1,
    Images.nervousComplex2,
  ];

  String getRandomFearBasic() {
    final List<String> random = _fearBasic;
    random.shuffle();
    return random[0];
  }

  String getRandomFearComplex() {
    final List<String> random = _fearComplex;
    random.shuffle();
    return random[0];
  }

  String getRandomNervousBasic() {
    final List<String> random = _nervousBasic;
    random.shuffle();
    return random[0];
  }

  String getRandomNervousComplex() {
    final List<String> random = _nervousComplex;
    random.shuffle();
    return random[0];
  }
}
