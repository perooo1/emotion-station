import 'package:emotion_station/l10n/generated/l10n.dart';
import 'package:emotion_station/utils/helper_classes/helper_classes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ESRadarChart extends StatefulWidget {
  const ESRadarChart({
    required this.dataSets,
    required this.rawDataSets,
    this.isGeneralOverview = false,
    super.key,
  });

  final List<RadarChartDataSet> rawDataSets;
  final List<RadarDataSet> dataSets;

  final bool isGeneralOverview;

  @override
  State<ESRadarChart> createState() => _ESRadarChartState();
}

class _ESRadarChartState extends State<ESRadarChart> {
  int selectedDataSetIndex = -1;

  List<RadarDataSet> showingDataSet() {
    return widget.rawDataSets.asMap().entries.map((entry) {
      final index = entry.key;
      final rawDataSet = entry.value;

      final isSelected = index == selectedDataSetIndex
          ? true
          : selectedDataSetIndex == -1
              ? true
              : false;

      return RadarDataSet(
        fillColor:
            isSelected ? rawDataSet.color.withOpacity(0.2) : rawDataSet.color.withOpacity(0.05),
        borderColor: isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.25),
        entryRadius: isSelected ? 3 : 2,
        dataEntries: rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: isSelected ? 2.3 : 2,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Card(
      child: Padding(
        padding: widget.isGeneralOverview
            ? const EdgeInsets.all(8.0)
            : const EdgeInsets.only(top: 40.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isGeneralOverview)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          selectedDataSetIndex = -1;
                        },
                      );
                    },
                    child: Text(
                      l10n.emotionStation.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.rawDataSets
                        .asMap()
                        .map(
                          (index, value) {
                            final isSelected = index == selectedDataSetIndex;
                            return MapEntry(
                              index,
                              GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      selectedDataSetIndex = index;
                                    },
                                  );
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(vertical: 2),
                                  height: 26,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(46),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 6,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AnimatedContainer(
                                        duration: const Duration(milliseconds: 400),
                                        curve: Curves.easeInToLinear,
                                        padding: EdgeInsets.all(isSelected ? 8 : 6),
                                        decoration: BoxDecoration(
                                          color: value.color,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      AnimatedDefaultTextStyle(
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.easeInToLinear,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Theme.of(context).colorScheme.onPrimary
                                              : Theme.of(context).colorScheme.onPrimaryContainer,
                                        ),
                                        //child: Text(value.title),
                                        child: Text(value.title),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                        .values
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            AspectRatio(
              aspectRatio: 1.3,
              child: RadarChart(
                RadarChartData(
                  radarTouchData: RadarTouchData(
                    touchCallback: (FlTouchEvent event, response) {
                      if (!event.isInterestedForInteractions) {
                        setState(() {
                          selectedDataSetIndex = -1;
                        });
                        return;
                      }
                      setState(() {
                        selectedDataSetIndex = response?.touchedSpot?.touchedDataSetIndex ?? -1;
                      });
                    },
                  ),
                  titlePositionPercentageOffset: 0.2,
                  radarBorderData: const BorderSide(color: Colors.transparent),
                  borderData: FlBorderData(show: false),
                  radarBackgroundColor: Colors.transparent,
                  getTitle: (index, angle) {
                    switch (index) {
                      case 0:
                        return RadarChartTitle(text: 'Recognition');
                      case 2:
                        return RadarChartTitle(text: 'visual');
                      case 1:
                        return RadarChartTitle(text: 'text');
                      default:
                        return const RadarChartTitle(text: '');
                    }
                  },
                  tickCount: 1,
                  ticksTextStyle: const TextStyle(color: Colors.transparent, fontSize: 10),
                  tickBorderData: const BorderSide(color: Colors.transparent),
                  gridBorderData: const BorderSide(width: 2),
                  dataSets: showingDataSet(),
                  //dataSets: widget.dataSets,
                ),
                swapAnimationDuration: const Duration(milliseconds: 400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
