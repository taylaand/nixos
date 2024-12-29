{ pkgs, ... }: {
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;  # Changed from enableDefaultFonts
    
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "0xProto"
          "3270"
          "Agave"
          "AnonymousPro"
          "Arimo"
          "AurulentSansMono"
          "BigBlueTerminal"
          "BitstreamVeraSansMono"
          "CascadiaCode"
          "CascadiaMono"
          "CodeNewRoman"
          "ComicShannsMono"
          "CommitMono"
          "Cousine"
          "D2Coding"
          "DaddyTimeMono"
          "DejaVuSansMono"
          "DroidSansMono"
          "EnvyCodeR"
          "FantasqueSansMono"
          "FiraCode"
          "FiraMono"
          "GeistMono"
          "Go-Mono"
          "Gohu"
          "Hack"
          "Hasklig"
          "HeavyData"
          "Hermit"
          "iA-Writer"
          "IBMPlexMono"
          "Inconsolata"
          "InconsolataGo"
          "InconsolataLGC"
          "IntelOneMono"
          "Iosevka"
          "IosevkaTerm"
          "IosevkaTermSlab"
          "JetBrainsMono"
          "Lekton"
          "LiberationMono"
          "Lilex"
          "MartianMono"
          "Meslo"
          "Monaspace"
          "Monofur"
          "Monoid"
          "Mononoki"
          "MPlus"
          "NerdFontsSymbolsOnly"
          "Noto"
          "OpenDyslexic"
          "Overpass"
          "ProFont"
          "ProggyClean"
          "RobotoMono"
          "ShareTechMono"
          "SourceCodePro"
          "SpaceMono"
          "Terminus"
          "Tinos"
          "Ubuntu"
          "UbuntuMono"
          "VictorMono"
        ];
      })
      # Additional non-nerd fonts
      recursive
      dejavu_fonts
      liberation_ttf
      noto-fonts
      noto-fonts-cjk-sans  # Changed from noto-fonts-cjk
      noto-fonts-emoji
      ubuntu_font_family
      font-awesome
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" "DejaVu Sans Mono" ];
        sansSerif = [ "DejaVu Sans" "Noto Sans" ];
        serif = [ "DejaVu Serif" "Noto Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
