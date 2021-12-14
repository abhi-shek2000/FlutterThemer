// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_themer/themeprovider/theme_provider.dart';
import 'package:flutter_themer/src/themer_state.dart';
import 'package:flutter_themer/utils/helper_widgets.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:themer/themeData/theme_data.dart';
import 'appsettings/theme_change_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = 'Light & Dark Theme';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ThemerState.getsavedTheme,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ChangeNotifierProvider(
          create: (context) =>
              ThemeProvider(themeMode: snapshot.data as ThemeMode),
          builder: (context, _) {
            final themeProvider = Provider.of<ThemeProvider>(context);

            return MaterialApp(
              title: title,
              themeMode: themeProvider.themeMode,
              theme: MyThemes(lightTheme: lightTheme, darkTheme: darkTheme)
                  .lightTheme,
              darkTheme: MyThemes(lightTheme: lightTheme, darkTheme: darkTheme)
                  .darkTheme,
              home: MyHomePage(title: title),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Theme.of(context).iconTheme.color,
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: CircleAvatar(
                  child: Image.asset(
                    "assets/images/profile_pic.png",
                  ),
                  backgroundColor: Colors.pink,
                  radius: 60,
                ),
              ),
            ),
            addVerticalSpace(10),
            Text(
              "Your Name",
            ),
            addVerticalSpace(10),
            Text(
              "@yourusername",
            ),
            addVerticalSpace(10),
            Text(
              "This is a simple Status",
            ),
            addVerticalSpace(20),
            addVerticalSpace(20),
            ElevatedButton(child: Text("Just Click"), onPressed: () {}),
            addVerticalSpace(20),
            ElevatedButton(child: Text("Click Me"), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
