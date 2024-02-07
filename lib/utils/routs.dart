import 'package:core_exma/screen/addData/adddata_screen.dart';
import 'package:core_exma/screen/detail/detail_screen.dart';
import 'package:core_exma/screen/home/home_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String,WidgetBuilder>app_routes=
{
  "/":(context) => HomeScreen(),
  "detail":(context) => DatailScreen(),
};