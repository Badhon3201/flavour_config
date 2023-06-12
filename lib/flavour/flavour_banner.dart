import 'package:flutter/material.dart';

import 'flavour_config.dart';

class FlavourBanner extends StatefulWidget {
  final Widget? child;
  final BannerConfig? bannerConfig;

  const FlavourBanner({super.key, @required this.child, this.bannerConfig});

  @override
  _FlavourBannerState createState() => _FlavourBannerState(this.bannerConfig!);
}

class _FlavourBannerState extends State<FlavourBanner> {
  BannerConfig bannerConfig;

  _FlavourBannerState(this.bannerConfig);

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProduction()) return widget.child!;
    return Stack(
      children: <Widget>[widget.child!, _buildBanner(context)],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
            message: bannerConfig.bannerName!,
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: bannerConfig.bannerColor!),
      ),
    );
  }
}

class BannerConfig {
  final String? bannerName;
  final Color? bannerColor;

  BannerConfig(
      {required String this.bannerName, required Color this.bannerColor});
}
