import 'package:common/common.dart';
import 'package:domain_models/domain_models.dart';

class QuestionsCroatian {
  QuestionsCroatian() {
    questionsHappiness = [
      Question(
        imageAssetPath: shuffledImages.getRandomHappinessRecognitionsBasic(),
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
        text: 'Kako se djeca na slici osjećaju?',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(
              text: 'Iznenađeni su',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Sretni su',
              comprehensionLevel: ComprehensionLevel.partial),
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
              text: 'Jer su doletjela dva labuda.',
              comprehensionLevel: ComprehensionLevel.partial),
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
        text: 'Što misliš, kako se dijete na slici osjeća?',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(
              text: 'Iznenađeno',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Sretno', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Ljuto', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomHappinessUnderstandingComplex(),
        text: 'Što misliš, kako se djeca na slici osjećaju?',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(
              text: 'Jako su iznenađeni.',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Jako su sretni.',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Jako su zbunjeni.',
              comprehensionLevel: ComprehensionLevel.low),
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
          Option(
              text: 'Slika prikazuje sreću',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'Slika prikazuje tugu',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Slika prikazuje razočaranje',
              comprehensionLevel: ComprehensionLevel.high),
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
              text: 'Nije niti očekivala prijatelje',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomSadnessUnderstandingBasic(),
        text: 'Kakav osjećaj prevladava na slici?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(
              text: 'Prevladava osjećaj ljutnje',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'Prevladava osjećaj sreće ',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'Prevladava osjećaj tuge',
              comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomSadnessUnderstandingComplex(),
        text: 'Što misliš, o kojoj emociji se na ovoj slici radi?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(
              text: 'Razočaranje', comprehensionLevel: ComprehensionLevel.high),
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
          Option(
              text: 'Slika prikazuje ljutnju',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Slika prikazuje tugu',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'Slika prikazuje ljubomoru',
              comprehensionLevel: ComprehensionLevel.high),
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
              text: 'Ljubomorna je na drugu mačku ',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Ljuta je jer nitko ne gleda njezin crtež',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Sretna je zbog druge mačke',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomAngerRecognitionsComplex(),
        text: 'Kakav osjećaj prevladava na slici?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(
              text: 'Prevladava osjećaj straha',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'Prevladava osjećaj sreće ',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'Prevladava osjećaj ljutnje',
              comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomJelousComplex(),
        text: 'Što misliš, o kojoj emociji se na ovoj slici radi?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(
              text: 'Ljubomora', comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Ljutnja', comprehensionLevel: ComprehensionLevel.partial),
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
          Option(
              text: 'Slika prikazuje strah',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Slika prikazuje tugu',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'Slika prikazuje nervozu',
              comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        text:
            'Kako mala vjeverica doživljava ovu neobičnu i zastrašujuću situaciju?',
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
          Option(
              text: 'Prevladava osjećaj straha',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Prevladava osjećaj tuge ',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'Prevladava osjećaj ljutnje',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomNervousComplex(),
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
}

class QuestionsEnglish {
  QuestionsEnglish() {
    questionsHappiness = [
      Question(
        imageAssetPath: shuffledImages.getRandomHappinessRecognitionsBasic(),
        text: 'Which emotion do you recognize?',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(
              text: 'Happiness', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Anger', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Fear', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomHappinessRecognitionsComplex(),
        text: 'How do the children in picture feel?',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(
              text: 'They are surprised',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'They are happy',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'They are angry',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        text: 'What do you think, why is the duckling now happy?',
        storyText: '''In the morning, two large white swans flew by the lake.
          The duckling still decided to hide because he was ashamed of his appearance.
          He could not appear so ugly in front of such beautiful white birds.
          The swans swam to him because they noticed how he was hiding.
          They spread their wings wide in greeting and invited him to swim together.
          Duckling was overjoyed. He finally had friends who accepted him.''',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'Because two swans flew by the lake.',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'He finally had friends who accepted him.',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'The swans noticed him hiding.',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        text: 'How did the boy from the story feel?',
        storyText:
            '''I went into my room, went to turn on the light, and at that moment I heard loudly - happy birthday!
      Marko, Matej, Ana and Luka jumped out from behind the bed throwing colorful balloons and holding a big chocolate cake!
       I was speechless, I didn't expect that! It was a wonderful, unexpected surprise!!''',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'He was happy to be in his room.',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'He was angry because he didn\'t expect a surprise.',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text:
                  'He was surprised because he didn\'t expect a birthday surprise.',
              comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomHappinessUnderstandingBasic(),
        text: 'What do you think, how does the child feel?',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(
              text: 'Surprised',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Happy', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Angry', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomHappinessUnderstandingComplex(),
        text: 'What do you think, which emotion prevails?',
        activityType: ActivityType.stationOfHappiness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(
              text: 'Surprise.', comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Happiness.',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Confusion.', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
    ];

    questionsSadness = [
      Question(
        imageAssetPath: shuffledImages.getRandomSadnessRecognitionsBasic(),
        text: 'Which emotion in this picture can you name?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(text: 'Happiness', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Sadness', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Fear', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomSadnessRecognitionsComplex(),
        text: 'What do you think, which emotion is shown in the picture?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(
              text: 'The picture shows happiness',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'The picture shows sadness',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'The picture shows disappointment',
              comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        text: 'How does the little bunny feel?',
        storyText:
            'A little bunny lost his favorite teddy bear on the way to school. When he got home, he was looking out the window with a lost expression in his eyes. His eyes were sad and his heart was heavy.',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'Sad because he losgt his favorite teddy bear.',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Disappointed because his teddy bear left him.',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'He didn\'t care about his teddy bear.',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        text: 'How does duckling feel in this moment?',
        storyText:
            'Duckling prepared a surprise for her friends, but none of them came to the birthday party. When she sat down at the table, looking at the empty chairs, she looked like she was expecting something, but it didn\'t happen.',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'Disappointed because her friends didn\'t show up.',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Sad because of her friends.',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'She didn\'t expect anyone to come.',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomSadnessUnderstandingBasic(),
        text: 'What emotion prevails in this picture?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(
              text: 'In this picture anger preveils.',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'In this picture happiness preveils.',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'In this picture sadness preveils.',
              comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomSadnessUnderstandingComplex(),
        text: 'What do you thing, which emotion is this?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(
              text: 'Disappointment',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Sadness', comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Fear', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
    ];

    questionsAnger = [
      Question(
        imageAssetPath: shuffledImages.getRandomAngerRecognitionsBasic(),
        text: 'Which emotion can you see?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(text: 'Happiness', comprehensionLevel: ComprehensionLevel.low),
          Option(text: 'Anger', comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Disappointment',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomJelousBasic(),
        text: 'What do you think, which emotion is shown in this picture?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(
              text: 'Anger is shown.',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Sadness is shown.',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'Jealousy is shown',
              comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        text: 'How does the little tiger feel at this moment?',
        storyText:
            'The little tiger wanted to share his favorite toys with his friends, but they started without him. He watched them play, and he felt something that was not pleasant. When he finally joined the group, something was boiling inside him.',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'Angry because his friends started playing without him.',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'Jealous of his firends playing without him.',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Sad that his friends started playing without him.',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        text: 'How does the kitten feel?',
        storyText:
            'The kitten brought her latest drawing to share with her friends, but everyone was admiring another kitten\'s drawing. As she watched the praise given to the other cat, something broke in her eyes, but the moment remained shrouded in silence.',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'She was jealous of other kitten.',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text:
                  'She was angry because no one was paying attention to her drawing.',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'She was happy for other kitten.',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomAngerRecognitionsComplex(),
        text: 'What emotion can you describe in this picture?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(
              text: 'I think this is fear.',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'I think this is happiness.',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'I think this is anger.',
              comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomJelousComplex(),
        text: 'What do you think, which emotion does this picture show?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(text: 'Jealousy', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Anger', comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Fear', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
    ];

    questionsFear = [
      Question(
        imageAssetPath: shuffledImages.getRandomFearBasic(),
        text: 'Which emotion can you identify in this picture?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(
              text: 'I see happiness.',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'I see fear.', comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'I see anger.', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomNervousBasic(),
        text: 'What do you think, which emotion is shown?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionReckognition,
        options: [
          Option(
              text: 'Picture shows fear.',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'Picture shows sadness.',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'Picture shows nervousness.',
              comprehensionLevel: ComprehensionLevel.high),
        ],
      ),
      Question(
        text: 'How does litle squirrel feel in this unusual situation?',
        storyText:
            'The little squirrel wanted to explore the dark cave, but as soon as she stepped inside, she heard eerie sounds echoing off the walls. Fear gripped her, and her heart beat faster, almost like the rhythm of the terrible music surrounding her. She tried to calmly walk out of the cave, but something was following her in the shadows, the shifting shadows sending shivers down her furry back.',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
            text: 'She was scared of unusual sounds.',
            comprehensionLevel: ComprehensionLevel.high,
          ),
          Option(
              text: 'She was nervous to explore the cave.',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'She wasn\'t scared of the cave.',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        text: 'What do you think, how did little hedgehog feel?',
        storyText:
            'The little hedgehog was invited to the big hedgehog\'s meeting, but when he arrived, he noticed that he had forgotten important notes at home. He searched impatiently in his spikes, his heart beating fast as he tried to remember key information. Despite the tension, he tried to remain calm in front of the other hedgehogs.',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingTextual,
        options: [
          Option(
              text: 'He was nervous to hold the speech without his notes.',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'He was scared to hold the speech without his notes.',
              comprehensionLevel: ComprehensionLevel.partial),
          Option(
              text: 'He was sad to hold the speech without his notes.',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomFearComplex(),
        text: 'Which emotion can you describe?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(
              text: 'I think this is fear.',
              comprehensionLevel: ComprehensionLevel.high),
          Option(
              text: 'I think this is sadness ',
              comprehensionLevel: ComprehensionLevel.low),
          Option(
              text: 'I think this is anger',
              comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
      Question(
        imageAssetPath: shuffledImages.getRandomNervousComplex(),
        text: 'What do you think, which emotion is shown in the picture?',
        activityType: ActivityType.stationOfSadness,
        opservationCategory: OpservationCategory.emotionUnderstandingVisual,
        options: [
          Option(
              text: 'Nervousness', comprehensionLevel: ComprehensionLevel.high),
          Option(text: 'Fear', comprehensionLevel: ComprehensionLevel.partial),
          Option(text: 'Anger', comprehensionLevel: ComprehensionLevel.low),
        ],
      ),
    ];
  }

  final ShuffledImages shuffledImages = ShuffledImages();

  late List<Question> questionsHappiness;
  late List<Question> questionsSadness;
  late List<Question> questionsAnger;
  late List<Question> questionsFear;
}
