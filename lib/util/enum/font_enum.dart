import 'package:fotocolab_design_system/design_system/design_system.dart';

enum FontEnum {
  caveat(fontFamily: BrandFontFamily.caveat, path: BrandFontAssets.caveat),

  dMSans(fontFamily: BrandFontFamily.dMSans, path: BrandFontAssets.dMSans),

  dancingScript(
    fontFamily: BrandFontFamily.dancingScript,
    path: BrandFontAssets.dancingScript,
  ),

  fjalla(fontFamily: BrandFontFamily.fjalla, path: BrandFontAssets.fjalla),

  inconsolata(
    fontFamily: BrandFontFamily.inconsolata,
    path: BrandFontAssets.inconsolata,
  ),

  inter(fontFamily: BrandFontFamily.inter, path: BrandFontAssets.inter),

  playwrite(
    fontFamily: BrandFontFamily.playwrite,
    path: BrandFontAssets.playwrite,
  ),
  supermercado(
    fontFamily: BrandFontFamily.supermercado,
    path: BrandFontAssets.supermercado,
  ),

  tektur(fontFamily: BrandFontFamily.tektur, path: BrandFontAssets.tektur);

  const FontEnum({required this.path, required this.fontFamily});

  final String path;
  final String fontFamily;
}
