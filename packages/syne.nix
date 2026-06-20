{
  lib,
  stdenvNoCC,
  src,
}:

stdenvNoCC.mkDerivation { # I just realised this is the same as exo, i could make this a generic fontmaker package...
  inherit src;
  pname = "syne";
  version = "1.0";

  installPhase = ''
    runHook preInstall

    install -Dm444 -t $out/share/fonts/truetype fonts/ttf/*.ttf
    install -Dm444 -t $out/share/fonts/variable fonts/variable/*.ttf

    runHook postInstall
  '';

  meta = {
    description = "Syne was imagined by Bonjour Monde and designed by Lucas Descroix";
    longDescription = ''
      Syne is a 5-style type family originally designed in
      2017 for the art center Synesthésie, based in
      Saint-Denis in the very close suburb of Paris,
      France. Used across their identity, print and screen,
      Syne has been released under open-source license in
      June 2018.
    '';
    homepage = "https://github.com/googlefonts/Exo-2.0";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
    maintainers = [ ];
  };
}
