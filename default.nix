with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "emocgi";
  src = ./src;

  buildInputs = [ (import "/etc/nixos/pkgs/emojicode")
                  (import "/home/paul/doc/dev/Cpp/emojicode-fcgi")
                  fcgi
                ];

  buildPhase = ''
    emojicodec main.emojic -O -S $EMOJICODE_PATH
  '';

  installPhase = ''
    mkdir $out -p
    cp main $out
  '';

}