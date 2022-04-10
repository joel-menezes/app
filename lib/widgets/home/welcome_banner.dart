import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:staugustinechsnewapp/styles.dart';
import 'package:staugustinechsnewapp/widgets/reusable/basic_container.dart';

class WelcomeBanner extends StatefulWidget {
  final int? dayNumber;
  final String? userName;
  const WelcomeBanner({Key? key, this.dayNumber, this.userName})
      : super(key: key);

  @override
  State<WelcomeBanner> createState() => _WelcomeBannerState();
}

class _WelcomeBannerState extends State<WelcomeBanner> {
  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double getChildWidth(BuildContext context, double percentage) =>
      getWidth(context) * percentage - Styles.mainInsidePadding;

  @override
  Widget build(BuildContext context) {
    String welcomeText = widget.userName != null
        ? 'Welcome ${widget.userName}'
        : 'Welcome to St. Augustine';
    String dayNumberText =
        widget.dayNumber != null ? 'day ${widget.dayNumber}' : 'day';
    String dateText = DateFormat('MMMM d, yyyy').format(DateTime.now());

    return BasicContainer(
        decoration: BoxDecoration(
            color: Styles.primary,
            border: Border.all(
              color: Styles.secondary,
              width: 3.0,
            ),
            borderRadius: Styles.mainBorderRadius,
            boxShadow: Styles.headerBoxShadow),
        child: Row(
          children: [
            SizedBox(
                width: getChildWidth(context, 0.5),
                child: Wrap(
                  children: [
                    Text(welcomeText, style: Styles.headerMainText),
                    Container(height: 10.0),
                    Text('Today is a beautiful $dayNumberText,\n$dateText',
                        style: Styles.headerSubText),
                  ],
                )),
            const Spacer(),
            SizedBox(
                width: getChildWidth(context, 0.3),
                child: Image.asset('assets/logos/sta_logo.png',
                    fit: BoxFit.fitWidth)),
          ],
        ));
  }
}
