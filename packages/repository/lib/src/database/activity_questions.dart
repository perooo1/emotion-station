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
  ];

  final List<Question> questionsSadness = [
    Question(
      imageAssetPath: 'assets/images/boy_sad.webp',
      text: 'O kojoj emociji na slici se radi?',
      activityType: ActivityType.stationOfSadness,
      opservationCategory: OpservationCategory.emotionReckognition,
      options: [
        Option(text: 'Sreća', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'Tuga', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'Ljutnja', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: 'assets/images/boy_sad.webp',
      text: 'O kojoj emociji se radi(kompleksna emocija)?',
      activityType: ActivityType.stationOfSadness,
      opservationCategory: OpservationCategory.emotionReckognition,
      options: [
        Option(text: 'Sretan je', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'Iznenađen je', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'Tužan je', comprehensionLevel: ComprehensionLevel.high),
      ],
    ),
    Question(
      text: 'Pitanje o tužnoj priči ide ovdje upitnik?',
      storyText:
          'Ujutro su uz jezero doletjela dva velika bijela labuda. Pačić se ipak odlučio sakriti jer ga je bilo sram radi svog izgleda. Nije se mogao pojaviti tako ružan pred tako lijepim bijelim pticama. Labudovi su doplivali do njega jer su primijetili kako se skriva. Jako su raširili svoja krila u znak pozdravai pozvali ga da zaplivaju zajedno. Pačić je bio presretan. Napokon je imao prijatelje koji su ga prihvatili.',
      activityType: ActivityType.stationOfSadness,
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
      activityType: ActivityType.stationOfSadness,
      opservationCategory: OpservationCategory.emotionUnderstandingTextual,
      options: [
        Option(text: 'ajmo reci tocan odogovor', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'može proći', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'nikako', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: 'assets/images/boy_sad.webp',
      text: 'Kako se dječak osjeća?',
      activityType: ActivityType.stationOfSadness,
      opservationCategory: OpservationCategory.emotionUnderstandingVisual,
      options: [
        Option(text: 'Sretan je ', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'ljut je ', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'tužan je', comprehensionLevel: ComprehensionLevel.high),
      ],
    ),
    Question(
      imageAssetPath: 'assets/images/boy_sad.webp',
      text: 'Kako se osjeća kompleksnije?',
      activityType: ActivityType.stationOfSadness,
      opservationCategory: OpservationCategory.emotionUnderstandingVisual,
      options: [
        Option(text: 'kompleksna tuga', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'iznenađeno', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'kompleksna Ljutnja', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
  ];
}

class QuestionsEnglish {
  final List<Question> questionsHappiness = [
    Question(
      imageAssetPath: 'assets/images/boy_happy.webp',
      text: 'What emotion is this?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionReckognition,
      options: [
        Option(text: 'Happiness', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'Sadness', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'Anger', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: 'assets/images/boy_happy.webp',
      text: 'What complex emotion is this?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionReckognition,
      options: [
        Option(text: 'Happy', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'Surprise', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'Sad', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      text: 'Why is the duckling happy?',
      storyText:
          'In the morning, two large white swans flew by the lake. Pačić still decided to hide because he was ashamed of his appearance. He could not appear so ugly in front of such beautiful white birds. The swans swam to him because they noticed how he was hiding. They spread their wings wide in greeting and invited him to swim together. Pačić was overjoyed. He finally had friends who accepted him.',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingTextual,
      options: [
        Option(text: 'Two swans are here', comprehensionLevel: ComprehensionLevel.partial),
        Option(
            text: 'Finally had firends who accepted him',
            comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'Swans noticed him hiding', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      text: 'More complex question',
      storyText:
          'In the morning, two large white swans flew by the lake. Pačić still decided to hide because he was ashamed of his appearance. He could not appear so ugly in front of such beautiful white birds. The swans swam to him because they noticed how he was hiding. They spread their wings wide in greeting and invited him to swim together. Pačić was overjoyed. He finally had friends who accepted him.',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingTextual,
      options: [
        Option(text: 'lets say correct answer', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'eh can do', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'no way', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: 'assets/images/boy_happy.webp',
      text: 'How does the boy feel?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingVisual,
      options: [
        Option(text: 'Happy', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'angry  ', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'sad', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: 'assets/images/boy_happy.webp',
      text: 'how does he feel kompleksnije?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingVisual,
      options: [
        Option(text: 'kompleksna happy', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'surprise', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'kompleksna anger', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
  ];

  final List<Question> questionsSadness = [
    Question(
      imageAssetPath: 'assets/images/boy_sad.webp',
      text: 'What emotion is this?',
      activityType: ActivityType.stationOfSadness,
      opservationCategory: OpservationCategory.emotionReckognition,
      options: [
        Option(text: 'Happienss', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'sadness', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'anger', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: 'assets/images/boy_sad.webp',
      text: 'what emotion is this (kompleksna emocija)?',
      activityType: ActivityType.stationOfSadness,
      opservationCategory: OpservationCategory.emotionReckognition,
      options: [
        Option(text: 'happy', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'he is surprised', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'he is sad', comprehensionLevel: ComprehensionLevel.high),
      ],
    ),
    Question(
      text: 'sad story question goes here upitnik?',
      storyText:
          'In the morning, two large white swans flew by the lake. Pačić still decided to hide because he was ashamed of his appearance. He could not appear so ugly in front of such beautiful white birds. The swans swam to him because they noticed how he was hiding. They spread their wings wide in greeting and invited him to swim together. Pačić was overjoyed. He finally had friends who accepted him.',
      activityType: ActivityType.stationOfSadness,
      opservationCategory: OpservationCategory.emotionUnderstandingTextual,
      options: [
        Option(text: 'two swans are here', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'finally had firends', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'swans noticed him hiding', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      text: 'More complex story question',
      storyText:
          'In the morning, two large white swans flew by the lake. Pačić still decided to hide because he was ashamed of his appearance. He could not appear so ugly in front of such beautiful white birds. The swans swam to him because they noticed how he was hiding. They spread their wings wide in greeting and invited him to swim together. Pačić was overjoyed. He finally had friends who accepted him.',
      activityType: ActivityType.stationOfSadness,
      opservationCategory: OpservationCategory.emotionUnderstandingTextual,
      options: [
        Option(text: 'lets say yea', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'kinda', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'no way', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: 'assets/images/boy_sad.webp',
      text: 'How does the boy feel?',
      activityType: ActivityType.stationOfSadness,
      opservationCategory: OpservationCategory.emotionUnderstandingVisual,
      options: [
        Option(text: 'Happy', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'angry ', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'sad ', comprehensionLevel: ComprehensionLevel.high),
      ],
    ),
    Question(
      imageAssetPath: 'assets/images/boy_sad.webp',
      text: 'how does the boy feel kompleksnije?',
      activityType: ActivityType.stationOfSadness,
      opservationCategory: OpservationCategory.emotionUnderstandingVisual,
      options: [
        Option(text: 'kompleksna sad', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'sruprised', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'kompleksna anger', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
  ];
}
