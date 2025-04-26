{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      ziglang.vscode-zig
      zaaack.markdown-editor
      yzhang.markdown-all-in-one
      vscode-icons-team.vscode-icons
      tomoki1207.pdf
      tekumara.typos-vscode
      svelte.svelte-vscode
      rust-lang.rust-analyzer
      ritwickdey.liveserver
      ms-vscode.hexeditor
      ms-vscode.cpptools-extension-pack
      ms-vscode.cpptools
      ms-vscode.cmake-tools
      ms-vscode-remote.vscode-remote-extensionpack
      ms-vscode-remote.remote-ssh-edit
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-containers
      ms-toolsai.vscode-jupyter-slideshow
      ms-toolsai.vscode-jupyter-cell-tags
      ms-toolsai.jupyter-renderers
      ms-toolsai.jupyter-keymap
      ms-toolsai.jupyter
      ms-python.vscode-pylance
      ms-python.python
      ms-python.pylint
      ms-python.debugpy
      ms-kubernetes-tools.vscode-kubernetes-tools
      ms-dotnettools.vscodeintellicode-csharp
      ms-dotnettools.vscode-dotnet-runtime
      ms-dotnettools.csharp
      ms-dotnettools.csdevkit
      ms-azuretools.vscode-docker
      mikestead.dotenv
      mhutchie.git-graph
      mechatroner.rainbow-csv
      mathiasfrohlich.kotlin
      golang.go
      github.vscode-pull-request-github
      github.vscode-github-actions
      esbenp.prettier-vscode
      bbenoist.nix
    ];
  };
}
