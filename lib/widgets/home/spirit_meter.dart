import 'package:flutter/material.dart';
import 'package:staugustinechsnewapp/models/home/spirit_meters/spirit_meters.dart';
import 'package:staugustinechsnewapp/styles.dart';
import 'package:staugustinechsnewapp/utilities/home/word_to_number_conversion.dart';
import 'package:staugustinechsnewapp/widgets/reusable/basic_container.dart';
import 'package:staugustinechsnewapp/widgets/reusable/rounded_linear_progress_indicator.dart';

class SpiritMeterBars extends StatefulWidget {
  final SpiritMeters? spiritMeters;
  const SpiritMeterBars({Key? key, this.spiritMeters}) : super(key: key);

  @override
  State<SpiritMeterBars> createState() => _SpiritMeterBarsState();
}

class _SpiritMeterBarsState extends State<SpiritMeterBars> {
  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  List<Widget> buildSpiritMeters(SpiritMeters spiritMetersData) {
    List<Widget> spiritMeters = [];
    spiritMetersData.toJson().forEach((key, value) {
      spiritMeters.add(SizedBox(
        width: getWidth(context),
        height: 30.0,
        child: Row(children: [
          SizedBox(
              width: getWidth(context) * 0.075,
              child: Text(
                wordToNumberConversion(key),
                style: const TextStyle(
                  color: Styles.primary,
                  fontSize: Styles.fontSizeNormal,
                  fontFamily: Styles.fontFamilyTitles,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Expanded(
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: RoundedLinearProgressIndicator(
                      max: 100,
                      value: value,
                      color: Styles.secondary,
                      backgroundColor: Styles.transparent,
                      height: 7.5))),
        ]),
      ));
    });
    return spiritMeters;
  }

  @override
  Widget build(BuildContext context) {
    SpiritMeters spiritMeters = widget.spiritMeters ??
        const SpiritMeters(
          nine: 0,
          ten: 0,
          eleven: 0,
          twelve: 0,
        );

    return BasicContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Spirit Meter', style: Styles.normalMainText),
        const SizedBox(height: 20.0),
        ...buildSpiritMeters(spiritMeters),
      ],
    ));
  }
}
