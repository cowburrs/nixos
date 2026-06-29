{
  appimageTools,
  makeDesktopItem,
  src,
}:
let
  version = "0.10.14";
  pname = "logseq";

  desktopItem = makeDesktopItem {
    name = "Logseq";
    desktopName = "Logseq";
    exec = "logseq %U";
    terminal = false;
    icon = "logseq";
    startupWMClass = "Logseq";
    comment = "A privacy-first, open-source platform for knowledge management and collaboration.";
    mimeTypes = [ "x-scheme-handler/logseq" ];
    categories = [ "Utility" ];
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm444 ${desktopItem}/share/applications/*.desktop -t $out/share/applications
  '';
}
