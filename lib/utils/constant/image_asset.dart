class ImageAsset {
  static const CommonAsset common = CommonAsset();
}

class CommonAsset {
  static const String _iconDir = "assets/icon";

  final String arrowLeftIcon = "$_iconDir/Arrow - Left 2.svg";
  final String bluePancakeIcon = "$_iconDir/blueberry-pancake.svg";
  final String buttonIcon = "$_iconDir/button.svg";
  final String canaiBreadIcon = "$_iconDir/canai-bread.svg";

  const CommonAsset();
}
