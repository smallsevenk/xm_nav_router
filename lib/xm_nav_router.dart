library xm_nav_router;

import 'package:flutter/cupertino.dart';

final xmNavGK = new GlobalKey<NavigatorState>();
final NavigatorState xmNav = xmNavGK.currentState;

Future<dynamic> xmPush(Widget page) {
  Route route = CupertinoPageRoute(
      builder: (context) => page,
      settings: RouteSettings(name: page.toStringShort()));
  return xmNav.push(route);
}

xmPop<T extends Object>([T result, Widget popWidget]) {
  if (null != popWidget) {
    xmNav.pop(result);
  } else {
    var predicate = ModalRoute.withName(popWidget.toStringShort());
    xmNav.popUntil(result, predicate);
  }
}
