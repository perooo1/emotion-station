import 'package:domain_models/domain_models.dart';

class QuestionsCroatian {
  final List<Question> questionsHappiness = [
    Question(
      imageAssetPath: 'assets/images/boy_happy.webp',
      text: 'O kojoj emociji na slici se radi?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionReckognition,
      options: [
        Option(text: 'Sreća', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'Tuga', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'Ljutnja', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: 'assets/images/boy_happy.webp',
      text: 'O kojoj emociji se radi(kompleksna emocija)?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionReckognition,
      options: [
        Option(text: 'Sretan je', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'Iznenađen je', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'Tužan je', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: 'assets/images/boy_happy.webp',
      text: 'Kako se dječak osjeća?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingVisual,
      options: [
        Option(text: 'Sretan je ', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'ljut je ', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'tužan je', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: 'assets/images/boy_happy.webp',
      text: 'Kako se osjeća kompleksnije?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingVisual,
      options: [
        Option(text: 'kompleksna Sreća', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'iznenađeno', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'kompleksna Ljutnja', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      text: 'Zašto je pačić sada sretan?',
      storyText:
          'Ujutro su uz jezero doletjela dva velika bijela labuda. Pačić se ipak odlučio sakriti jer ga je bilo sram radi svog izgleda. Nije se mogao pojaviti tako ružan pred tako lijepim bijelim pticama. Labudovi su doplivali do njega jer su primijetili kako se skriva. Jako su raširili svoja krila u znak pozdravai pozvali ga da zaplivaju zajedno. Pačić je bio presretan. Napokon je imao prijatelje koji su ga prihvatili.',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingTextual,
      options: [
        Option(text: 'Jer su doletjela dva labuda', comprehensionLevel: ComprehensionLevel.partial),
        Option(
            text: 'napokon je imao prijatelje koji su ga prihvatili',
            comprehensionLevel: ComprehensionLevel.high),
        Option(
            text: 'labudovi su orimijetili da se skriva',
            comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      text: 'Kompleksnije pitanje',
      storyText:
          'Ujutro su uz jezero doletjela dva velika bijela labuda. Pačić se ipak odlučio sakriti jer ga je bilo sram radi svog izgleda. Nije se mogao pojaviti tako ružan pred tako lijepim bijelim pticama. Labudovi su doplivali do njega jer su primijetili kako se skriva. Jako su raširili svoja krila u znak pozdravai pozvali ga da zaplivaju zajedno. Pačić je bio presretan. Napokon je imao prijatelje koji su ga prihvatili.',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingTextual,
      options: [
        Option(text: 'ajmo reci tocan odogovor', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'može proći', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'nikako', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
  ];
}
