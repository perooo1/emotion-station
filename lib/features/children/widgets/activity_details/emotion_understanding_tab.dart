import 'package:flutter/material.dart';

class EmotionUnderstandingTab extends StatefulWidget {
  const EmotionUnderstandingTab({super.key});

  @override
  State<EmotionUnderstandingTab> createState() => _EmotionUnderstandingTabState();
}

class _EmotionUnderstandingTabState extends State<EmotionUnderstandingTab>
    with TickerProviderStateMixin {
  late final TabController _nestedTabController;

  @override
  void initState() {
    super.initState();
    _nestedTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nestedTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar.secondary(
          controller: _nestedTabController,
          tabs: [
            Tab(text: 'Visual'),
            Tab(text: 'Textual'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _nestedTabController,
            children: [
              Center(child: Text('Visual')),
              Center(child: Text('Textual')),
            ],
          ),
        ),
      ],
    );
  }
}
