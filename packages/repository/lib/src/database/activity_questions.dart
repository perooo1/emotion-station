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
        imageAssetPath: shuffledImages.getRandomSadnessRecognitionsBasic(),
        text: 'O kojoj emociji na slici se radi?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(text: 'Sreća', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Tuga', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Ljutnja', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomSadnessRecognitionsComplex(),
        text: 'Koju emociju na slici prepoznaješ?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(text: 'Slika prikazuje sreću', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Slika prikazuje tugu', comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Slika prikazuje razočaranje', comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        text: 'Kako se mali zečić osjeća?',
        storyText:
            'Mali zečić izgubio je svoj omiljeni plišani medvjedić na putu do škole. Kad je stigao kući, gledao je kroz prozor s izgubljenim izrazom u očima. Oči su mu bile tužne, a srce teško',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'Tužan je jer je izgubio medvjedića',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Bio je razočaran jer ga je medvjedić napustio',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Bilo mu je svejedno za medvjedića',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        text: 'Kako patkica doživljava trenutak',
        storyText:
            'Malena patka pripremila je iznenađenje za svoje prijatelje, ali nitko od njih nije došao na rođendansku zabavu. Kad je sjela za stol, s pogledom uprtim u prazne stolice, izgledala je kao da je nešto očekivala, ali se nije ostvarilo.',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'Razočarana je jer nitko nije došao',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Tužna je zbog svojih prijatelja',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Nije niti očekivala prijatelje', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomSadnessUnderstandingBasic(),
        text: 'Kakav osjećaj prevladava na slici?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(text: 'Prevladava osjećaj ljutnje', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Prevladava osjećaj sreće ', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Prevladava osjećaj tuge', comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomSadnessUnderstandingComplex(),
        text: 'Što misliš, o kojoj emociji se na ovoj slici radi?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(text: 'Razočaranje', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Tuga', comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Ljutnja', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
    ];

    questionsAnger = [
      Question(
        imageAssetPath: shuffledImages.getRandomAngerRecognitionsBasic(),
        text: 'O kojoj emociji na slici se radi?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(text: 'Sreća', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Ljutnja', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Tuga', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomJelousBasic(),
        text: 'Koju emociju na slici prepoznaješ?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(text: 'Slika prikazuje ljutnju', comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Slika prikazuje tugu', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Slika prikazuje ljubomoru', comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        text: 'Kako mali tigar doživljava trenutak?',
        storyText:
            'Mali tigar želio je podijeliti svoje omiljene igračke s prijateljima, ali su oni počeli bez njega. Gledao je kako se igraju, a osjećao je nešto što mu nije bilo ugodno. Kad je naposljetku pridružio skupini, nešto je ključalo u njemu.',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'Ljut je jer su se prijatelji počeli igrati bez njega',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Bio je ljubomoran na prijatelje',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Bio je sretan jer su se njegovi prijatelji već igrali',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        text: 'Kako malena mačka doživljava trenutak?',
        storyText:
            'Mačkica donijela je svoj najnoviji crtež kako bi ga podijelila s prijateljima, ali su svi divili crtežu jedne druge mačke. Dok je promatrao hvale upućene drugoj mački, nešto se prelomilo u njenim očima, ali taj trenutak ostao je zamotan u tišini.',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'Ljubomorna je na drugu mačku ', comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Ljuta je jer nitko ne gleda njezin crtež',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Sretna je zbog druge mačke', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomAngerRecognitionsComplex(),
        text: 'Kakav osjećaj prevladava na slici?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(text: 'Prevladava osjećaj straha', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Prevladava osjećaj sreće ', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Prevladava osjećaj ljutnje', comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomJelousComplex(),
        text: 'Što misliš, o kojoj emociji se na ovoj slici radi?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(text: 'Ljubomora', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Ljutnja', comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'tuga', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
    ];

    questionsFear = [
      Question(
        imageAssetPath: shuffledImages.getRandomFearBasic(),
        text: 'O kojoj emociji na slici se radi?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(text: 'Sreća', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Strah', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Tuga', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomNervousBasic(),
        text: 'Koju emociju na slici prepoznaješ?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(text: 'Slika prikazuje strah', comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Slika prikazuje tugu', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Slika prikazuje nervozu', comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        text: 'Kako mala vjeverica doživljava ovu neobičnu i zastrašujuću situaciju?',
        storyText:
            'Mala vjeverica željela je istražiti tamnu špilju, no čim je zakoračila unutra, čula je jezive zvukove kako odjekuju zidovima. Strah ju je obuzeo, a srce joj je lupalo brže, gotovo kao ritam strašne glazbe koja ju okružuje. Pokušala je smireno izići iz špilje, ali nešto ju je pratilo u sjeni, izmicanje sjena izazvalo je jezu njezinim krznenim leđima.',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
            text: 'Bilo ju je strah zbog zvukova',
            comprehensionLevel: ComprehensionLevel.high,
          ),
          Option(
              text: 'Bila je nervozna zbog istraživanja špilje',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Nije ju bilo strah istraživanja špilje',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        text: 'Kako maleni jež doživljava ovu situaciju?',
        storyText:
            'Mali je jež bio pozvan na veliki ježev sastanak, ali kad je stigao, primijetio je da je zaboravio važne bilješke kod kuće. Nestrpljivo je tražio po bodljama, a srce mu je ubrzano kucalo dok je pokušavao sjetiti se ključnih informacija. Unatoč napetosti, trudio se ostati smiren pred ostalim ježevima.',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'Nervozan je jer treba držati govor, a nema bilješki',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Uplašen je jer nema svojih bilješki',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Tužan je jer nema svojih bilješki',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomFearComplex(),
        text: 'Kakav osjećaj prevladava na slici?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(text: 'Prevladava osjećaj straha', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Prevladava osjećaj tuge ', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Prevladava osjećaj ljutnje', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomJelousComplex(),
        text: 'Što misliš, o kojoj emociji se na ovoj slici radi?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(text: 'Nervoza', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Strah', comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Tuga', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
    ];
  }

  final ShuffledImages shuffledImages = ShuffledImages();

  late List<Question> questionsHappiness;
  late List<Question> questionsSadness;
  late List<Question> questionsAnger;
  late List<Question> questionsFear;

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
