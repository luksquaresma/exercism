let
  pconfig = { 
    config = { 
      allowUnfree = true;
      cudaSupport = true;
    };
  };
  pkgs =     import <nixpkgs>        pconfig;
  unstable = import <nixos-unstable> pconfig;
  slib =     pkgs.lib.strings;
in

pkgs.mkShell rec {
  name = "exercism";

  buildInputs = with unstable; [
    dart
    exercism
  ];

  shellHook = ''
    export PATH="$JAVA_HOME/bin:$PATH"

    function fok() { read -p "$1 (y/N): " && [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]] }
    
    function ch() {
      nohup code --disable-gpu ./ >/dev/null 2>&1 && echo;      
    }

    function get_git_branch() {
      git name-rev --name-only HEAD > /dev/null 2>&1
      if [[ $? -eq 0 ]]; then
        echo "($(git name-rev --name-only HEAD))";
      else
        echo "";
      fi
    };
    PS1="\n\[\033[1;33m\][${name}:\w]\n\$(get_git_branch)\$\[\033[0m\] ";

    dart --disable-analytics
  '';
}
