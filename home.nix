{ config, pkgs, lib, ... }: 

let
  dotfilesDirectory = "${config.home.homeDirectory}/dotfiles";
in
{
  home = {
    username = "ataylor";
    homeDirectory = "/home/ataylor";
    stateVersion = "24.11";

    packages = with pkgs; [
      # Development tools 
      gcc cmake gh hub lazygit lazydocker jq code-cursor nodePackages.typescript nodejs
      # Terminal tools
      bottom htop tmux zellij googler httpie atool ripgrep fd tree lnav vim neovim alacritty alacritty-theme
      pycritty kitty kitty-themes vivid xclip wl-clipboard jinja2-cli
      # Productivity
      evolutionWithPlugins obsidian nomachine-client slack yt-dlp youtube-tui youtube-music spotify
      # Programming languages & tools
      python3Full pipx go rustup cargo-binutils
      # Python packages
      python312Packages.pycritty python312Packages.llm python312Packages.ollama black uv
      # LLM tools
      llm llm-ls ollama fabric-ai aider-chat
      # IaC
      ansible pulumi-bin pulumictl terraform
      # Networking
      containerlab
      # Containers
      k9s kind minikube kubernetes
      # Hardware
      dell-command-configure freefall refind logitech-udev-rules
    ];

    file = {
      ".zshrc".source = "${dotfilesDirectory}/.zshrc";
      ".config/wezterm".source = "${dotfilesDirectory}/.config/wezterm";
      ".config/alacritty".source = "${dotfilesDirectory}/.config/alacritty";
      ".config/skhd".source = "${dotfilesDirectory}/.config/skhd";
      ".config/starship".source = "${dotfilesDirectory}/.config/starship";
      ".config/zellij".source = "${dotfilesDirectory}/.config/zellij";
      ".config/nvim".source = "${dotfilesDirectory}/.config/nvim";
      ".config/tmux".source = "${dotfilesDirectory}/.config/tmux";
    };
  };

  programs = {
    home-manager.enable = true;
    zsh.enable = true;
    git = {
      enable = true;
      userName = "Andy Taylor";
      userEmail = "andy.taylor@mail.com";
      
      extraConfig = {
        init.defaultBranch = "main";
        core = {
          editor = "nvim";
          autocrlf = "input";
        };
        pull.rebase = false;
        push.autoSetupRemote = true;
      };
      
      aliases = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        unstage = "reset HEAD --";
        last = "log -1 HEAD";
      };
    };
  };
}

