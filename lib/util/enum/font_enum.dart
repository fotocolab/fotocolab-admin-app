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

  tektur(fontFamily: BrandFontFamily.tektur, path: BrandFontAssets.tektur),
  hindi(fontFamily: BrandFontFamily.hindi, path: BrandFontAssets.hindi),
  assamese(
    fontFamily: BrandFontFamily.assamese,
    path: BrandFontAssets.assamese,
  ),
  bengali(fontFamily: BrandFontFamily.bengali, path: BrandFontAssets.bengali),
  bodo(fontFamily: BrandFontFamily.bodo, path: BrandFontAssets.bodo),
  gujarati(
    fontFamily: BrandFontFamily.gujarati,
    path: BrandFontAssets.gujarati,
  ),
  kannada(fontFamily: BrandFontFamily.kannada, path: BrandFontAssets.kannada),
  malayalam(
    fontFamily: BrandFontFamily.malayalam,
    path: BrandFontAssets.malayalam,
  ),
  marathi(fontFamily: BrandFontFamily.marathi, path: BrandFontAssets.marathi),
  nepali(fontFamily: BrandFontFamily.nepali, path: BrandFontAssets.nepali),
  odia(fontFamily: BrandFontFamily.odia, path: BrandFontAssets.odia),
  punjabi(fontFamily: BrandFontFamily.punjabi, path: BrandFontAssets.punjabi),
  tamil(fontFamily: BrandFontFamily.tamil, path: BrandFontAssets.tamil),
  telugu(fontFamily: BrandFontFamily.telugu, path: BrandFontAssets.telugu),
  urdu(fontFamily: BrandFontFamily.urdu, path: BrandFontAssets.urdu),
  noto(fontFamily: BrandFontFamily.noto, path: BrandFontAssets.noto);

  const FontEnum({required this.path, required this.fontFamily});

  final String path;
  final String fontFamily;
}
