import 'package:domain_models/domain_models.dart';
import 'package:emotion_station/features/children/widgets/widgets.dart';
import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChildActivitiesTab extends StatefulWidget {
  const ChildActivitiesTab({required this.activityRecords, super.key});

  final List<ActivityRecord>? activityRecords;

  @override
  State<ChildActivitiesTab> createState() => _ChildActivitiesTabState();
}

class _ChildActivitiesTabState extends State<ChildActivitiesTab> with TickerProviderStateMixin {
  late final TabController _nestedTabController;

  @override
  void initState() {
    super.initState();
    _nestedTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _nestedTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        TabBar.secondary(
          controller: _nestedTabController,
          tabs: [
            Tab(text: l10n.childDetailsScreenChildActivitiesOverview),
            Tab(text: l10n.childDetailsScreenChildActivitiesCompletedActivities),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _nestedTabController,
            children: [
              ChildActivitesOverviewTab(),
              ChildActivitiesCompletedActivitesTab(activityRecords: widget.activityRecords),
            ],
          ),
        ),
      ],
    );
  }
}
