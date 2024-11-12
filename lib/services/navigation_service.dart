import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

BuildContext? get currentContext => navigatorKey.currentContext;
