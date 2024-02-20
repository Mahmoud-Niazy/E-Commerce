import 'package:flutter/material.dart';

navigateAndRemoveUntil({
  required BuildContext context,
  required Widget screen,
}) {
  Navigator.of(context).pushAndRemoveUntil(
    PageRouteBuilder(
      pageBuilder: (
        context,
        animation1,
        animation2,
      ) {
        return FadeTransition(
          opacity: animation1,
          child: screen,
        );
      },
    ),
    (route) => false,
  );
}

navigate({
  required BuildContext context,
  required Widget screen,
}) {
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (
        context,
        animation1,
        animation2,
      ) {
        return FadeTransition(
          opacity: animation1,
          child: screen,
        );
      },
    ),
  );
}

navigateWithoutAnimation({
  required BuildContext context,
  required Widget screen,
}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

navigatePop({
  required BuildContext context,
}) {
  Navigator.of(context).pop();
}
