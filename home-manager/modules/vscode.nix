{pkgs, ...}: {
  programs.vscode = {
    # programs.vscode.package = pkgs.vscode.fhsWithPackages (ps: with ps; [ rustup zlib openssl.dev pkg-config ]);

    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    extensions = with pkgs.vscode-extensions;
      [
        jnoortheen.nix-ide
        donjayamanne.githistory
        github.copilot
        github.copilot-chat
        gruntfuggly.todo-tree
        mkhl.direnv
        ms-azuretools.vscode-docker
        ms-python.debugpy
        ms-python.vscode-pylance
        rust-lang.rust-analyzer
        ms-python.python
        bbenoist.nix
          tamasfe.even-better-toml
        # platformio.platformio-ide
        ms-vscode.cpptools
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "cucumberautocomplete";
          publisher = "alexkrechik";
          version = "3.0.5";
          sha256 = "sha256-Tgqd4uoVgGJQKlj4JUM1CrjQhbi0qv9bAGz5NIHyofQ=";
        }
      ];
    userSettings = {
      # Other
      "telemetry.telemetryLevel" = "off";
      "update.showReleaseNotes" = false;
      "editor.minimap.enabled" = false;
      "editor.stickyScroll.enabled" = false;
      # Whitespace
      "files.trimTrailingWhitespace" = true;
      "files.trimFinalNewlines" = true;
      "files.insertFinalNewline" = true;
      "diffEditor.ignoreTrimWhitespace" = false;
      # Git
      "git.confirmSync" = false;
#      "git.enableCommitSigning" = true;
      "git-graph.repository.sign.commits" = true;
      "git-graph.repository.sign.tags" = true;
      "git-graph.repository.commits.showSignatureStatus" = true;
    };
  };
}
