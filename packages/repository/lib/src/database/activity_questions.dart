import 'package:common/common.dart';
import 'package:domain_models/domain_models.dart';

class QuestionsCroatian {
  QuestionsCroatian() {
    questionsHappiness = [
      Question(
        imageAssetPath: shuffledImages.getRandomHappinessRecognitionsBasic(),
        //imageAssetPath: Images.recognitionHappines,
        text: 'Koju emociju na slici prepoznaješ?',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(text: 'Sreća', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Ljutnja', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Strah', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomHappinessRecognitionsComplex(),
        //imageAssetPath: Images.happinessSurprise,
        text: 'Kako se djeca na slici osjećaju?',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(text: 'Iznenađeni su', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Sretni su', comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Ljuti su', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        text: 'Što misliš, zašto je pačić sada sretan?',
        storyText: '''Ujutro su uz jezero doletjela dva velika bijela labuda.
          Pačić se ipak odlučio sakriti jer ga je bilo sram radi svog izgleda.
          Nije se mogao pojaviti tako ružan pred tako lijepim bijelim pticama. 
          Labudovi su doplivali do njega jer su primijetili kako se skriva.
          Jako su raširili svoja krila u znak pozdrava i pozvali ga da zaplivaju zajedno.
          Pačić je bio presretan. Napokon je imao prijatelje koji su ga prihvatili.''',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'Jer su doletjela dva labuda.', comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Napokon je imao prijatelje koji su ga prihvatili.',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Labudovi su primijetili da se skriva.',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        text: 'Kako se dječak iz priče osjećao?',
        storyText:
            '''Ušao sam u svoju sobu, krenuo upaliti svjetlo i u tom trenutku se sobom glasno zaorilo - sretan rođendan! 
      Marko, Matej, Ana i Luka su iskočili iza kreveta bacajući šarene balone i držeći veeliku čokoladnu tortu!
       Zastao sam bez riječi, nisam to očekivao! Bilo je to baš prekrasno, neočekivano iznenađenje!!''',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'Bio je sretan što je došao u svoju sobu',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Bio je ljut jer nije očekivao iznenađenje.',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'Iznenadio se jer nije znao što mu prijatelji pripremaju.',
              comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomHappinessUnderstandingBasic(),
        //imageAssetPath: Images.understandingHappiness,
        text: 'Što misliš, kako se dijete na slici osjeća?',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(text: 'Iznenađeno', comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Sretno', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Ljuto', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomHappinessUnderstandingComplex(),
        //imageAssetPath: Images.understandingSurprise,
        text: 'Što misliš, kako se djeca na slici osjećaju?',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(text: 'Jako su iznenađeni.', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Jako su sretni.', comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Jako su zbunjeni.', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
    ];

    questionsSadness = [
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
          Option(
              text: 'Jer su doletjela dva labuda', comprehensionLevel: ComprehensionLevel.partial),
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

  final ShuffledImages shuffledImages = ShuffledImages();

  late List<Question> questionsHappiness;
  late List<Question> questionsSadness;

/*
  final List<Question> questionsHappiness = [
    Question(
      imageAssetPath: shuffledImages.getRandomHappinessRecognitionsBasic(),
      //imageAssetPath: Images.recognitionHappines,
      text: 'Koju emociju na slici prepoznaješ?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionReckognition,
      options: [
        Option(text: 'Sreća', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'Ljutnja', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'Strah', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: Images.happinessSurprise,
      text: 'Kako se djeca na slici osjećaju?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionReckognition,
      options: [
        Option(text: 'Iznenađeni su', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'Sretni su', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'Ljuti su', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      text: 'Što misliš, zašto je pačić sada sretan?',
      storyText: '''Ujutro su uz jezero doletjela dva velika bijela labuda.
          Pačić se ipak odlučio sakriti jer ga je bilo sram radi svog izgleda.
          Nije se mogao pojaviti tako ružan pred tako lijepim bijelim pticama. 
          Labudovi su doplivali do njega jer su primijetili kako se skriva.
          Jako su raširili svoja krila u znak pozdrava i pozvali ga da zaplivaju zajedno.
          Pačić je bio presretan. Napokon je imao prijatelje koji su ga prihvatili.''',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingTextual,
      options: [
        Option(
            text: 'Jer su doletjela dva labuda.', comprehensionLevel: ComprehensionLevel.partial),
        Option(
            text: 'Napokon je imao prijatelje koji su ga prihvatili.',
            comprehensionLevel: ComprehensionLevel.high),
        Option(
            text: 'Labudovi su primijetili da se skriva.',
            comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      text: 'Kako se dječak iz priče osjećao?',
      storyText:
          '''Ušao sam u svoju sobu, krenuo upaliti svjetlo i u tom trenutku se sobom glasno zaorilo - sretan rođendan! 
      Marko, Matej, Ana i Luka su iskočili iza kreveta bacajući šarene balone i držeći veeliku čokoladnu tortu!
       Zastao sam bez riječi, nisam to očekivao! Bilo je to baš prekrasno, neočekivano iznenađenje!!''',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingTextual,
      options: [
        Option(
            text: 'Bio je sretan što je došao u svoju sobu',
            comprehensionLevel: ComprehensionLevel.partial),
        Option(
            text: 'Bio je ljut jer nije očekivao iznenađenje.',
            comprehensionLevel: ComprehensionLevel.low),
        Option(
            text: 'Iznenadio se jer nije znao što mu prijatelji pripremaju.',
            comprehensionLevel: ComprehensionLevel.high),
      ],
    ),
    Question(
      imageAssetPath: Images.understandingHappiness,
      text: 'Odgovori, kako se djevojčica na slici osjeća?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingVisual,
      options: [
        Option(
            text: 'Iznenađeno, jer je pronašla novac ',
            comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'Sretno, jer je pronašla novac.', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'Ljuto, jer je pronašla novac.', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: Images.understandingSurprise,
      text: 'Što misliš, kako se djeca na slici osjećaju?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingVisual,
      options: [
        Option(text: 'Jako su iznenađeni.', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'Jako su sretni.', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'Jako su zbunjeni.', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
  ];
*/

/*
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

*/
}

class QuestionsEnglish {
  final List<Question> questionsHappiness = [
    Question(
      imageAssetPath: Images.recognitionHappines,
      //imageAssetPath: 'assets/images/recognition_happines.webp',
      text: 'Which emotion do you recognize?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionReckognition,
      options: [
        Option(text: 'Happiness', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'Anger', comprehensionLevel: ComprehensionLevel.low),
        Option(text: 'Fear', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: Images.happinessSurprise,
      //imageAssetPath: 'assets/images/happiness_surprise.webp',
      text: 'How do the children in the picture feel?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionReckognition,
      options: [
        Option(text: 'They are surprised.', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'They are happy.', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'They are angry.', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      text: 'What do you think, why is the duckling happy?',
      storyText: '''Ujutro su uz jezero doletjela dva velika bijela labuda.
          Pačić se ipak odlučio sakriti jer ga je bilo sram radi svog izgleda.
          Nije se mogao pojaviti tako ružan pred tako lijepim bijelim pticama. 
          Labudovi su doplivali do njega jer su primijetili kako se skriva.
          Jako su raširili svoja krila u znak pozdrava i pozvali ga da zaplivaju zajedno.
          Pačić je bio presretan. Napokon je imao prijatelje koji su ga prihvatili.''',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingTextual,
      options: [
        Option(
            text: 'Because two swans came to him.', comprehensionLevel: ComprehensionLevel.partial),
        Option(
            text: 'Because he finally had friends that accepted him.',
            comprehensionLevel: ComprehensionLevel.high),
        Option(
            text: 'Because swans noticed him hiding.', comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      text: 'How does boy from the story feel?',
      storyText:
          '''Ušao sam u svoju sobu, krenuo upaliti svjetlo i u tom trenutku se sobom glasno zaorilo - sretan rođendan! 
      Marko, Matej, Ana i Luka su iskočili iza kreveta bacajući šarene balone i držeći veeliku čokoladnu tortu!
       Zastao sam bez riječi, nisam to očekivao! Bilo je to baš prekrasno, neočekivano iznenađenje!!''',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingTextual,
      options: [
        Option(
            text: 'He was happy to be in his room.',
            comprehensionLevel: ComprehensionLevel.partial),
        Option(
            text: 'Angry because he did not expect that.',
            comprehensionLevel: ComprehensionLevel.low),
        Option(
            text: 'Surprised because he didn\'t know what his friends were planning.',
            comprehensionLevel: ComprehensionLevel.high),
      ],
    ),
    Question(
      imageAssetPath: Images.understandingHappiness,
      //imageAssetPath: 'assets/images/understanding_happiness.webp',
      text: 'How does the girl in the picture feel?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingVisual,
      options: [
        Option(
            text: 'Surprised because she found some money.',
            comprehensionLevel: ComprehensionLevel.partial),
        Option(
            text: 'Happy because she found some money.',
            comprehensionLevel: ComprehensionLevel.high),
        Option(
            text: 'Angry because she found some money.',
            comprehensionLevel: ComprehensionLevel.low),
      ],
    ),
    Question(
      imageAssetPath: Images.understandingSurprise,
      //imageAssetPath: 'assets/images/understanding_surprise.webp',
      text: 'What do you think, how do the children feel?',
      activityType: ActivityType.stationOfHappiness,
      opservationCategory: OpservationCategory.emotionUnderstandingVisual,
      options: [
        Option(text: 'They are very surprised.', comprehensionLevel: ComprehensionLevel.high),
        Option(text: 'They are very happy.', comprehensionLevel: ComprehensionLevel.partial),
        Option(text: 'They are very confused.', comprehensionLevel: ComprehensionLevel.low),
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
