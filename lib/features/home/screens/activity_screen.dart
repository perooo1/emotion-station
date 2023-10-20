import 'package:emotion_station/features/home/widgets/activity/activity.dart';
import 'package:emotion_station/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({
    required this.activityTypeName,
    required this.childId,
    super.key,
  });

  final String activityTypeName;
  final String childId;

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  //todo revert to stateless and move to cubit/state

  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            EmotionReckognition(),
            EmotionUnderstandingVisual(),
            EmotionUnderstandingTextual(),
          ],
        ),

/*
        Column(
          children: [
            Text('this is activity screen'),
            Text(' child id is: $childId'),
            Text(' activity type is: ${activityTypeName}'),
            EmotionReckognition(),
          ],
        ),
*/
      ),
      bottomSheet: Container(
        height: 80,
        color: Theme.of(context).colorScheme.tertiaryContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => controller.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              child: Text('exit'),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: SwapEffect(type: SwapType.yRotation),
            ),
            TextButton(
              onPressed: () => controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              child: Text('next stop'),
            ),
          ],
        ),
      ),

      /*
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) => _onTap(context, index),
        indicatorColor: Colors.black.withOpacity(0.0),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.close),
            label: 'Exit station',
          ),
          NavigationDestination(
            icon: Icon(Icons.keyboard_arrow_right),
            selectedIcon: Icon(Icons.info),
            label: 'Next stop',
          ),
        ],
      ),
      */
    );
  }

  void _onTap(BuildContext context, int index) {
    index == 0 ? context.pop() : null;
  }
}
