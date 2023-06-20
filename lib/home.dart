import 'package:flavor/api_client/api_client.dart';
import 'package:flutter/material.dart';

import 'flavour/flavour_banner.dart';
import 'flavour/flavour_config.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String link = "";

  void _incrementCounter() {
    setState(() {
      link = ApiClient.buildUrl("/google");
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlavourBanner(
      bannerConfig: BannerConfig(
        bannerName: FlavorConfig.isProduction() ? "" : "DEV",
        bannerColor:
            FlavorConfig.isProduction() ? Colors.transparent : Colors.red,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(FlavorConfig.isDevelopment() ? "Dev" : "Prod"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                link,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
