{ config, xdg, lib, pkgs, ... }: {
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    clock24 = true;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    prefix = "C-a";
    terminal = "screen-256color";
    plugins = with pkgs.tmuxPlugins; [
      copycat
      extrakto
      nord
      resurrect
      prefix-highlight
      tmux-fzf
      vim-tmux-navigator
    ];

    extraConfig = ''
      TMUX_FZF_LAUNCH_KEY="C-f"

      set -g detach-on-destroy off             # When destory switch to the prev session
      set -ga terminal-overrides ",xterm-256color:Tc"
      set -g default-shell $SHELL              # use default shell
      set -sg escape-time 5                    # delay shorter
      set -g bell-action none                   # disable bell
      set -sg history-limit 100000              # increase scrollback
      set -g mouse on                          # enable mouse mode
      set -g status-left-length 50
      ## General Settings
      setw -g xterm-keys on                     # enable xterm keys
      set-option -sg escape-time 0 # change the escape time in tmux to zero, improves vim responsiveness

      ## Copy and Paste
      bind Escape copy-mode
      bind p paste-buffer
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
      bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"
      bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "pbcopy"
      # ── Pane settings ───────────────────────────────────────────────────────────

      # Pane resizing {{{
        bind-key -r H resize-pane -L "5"
        bind-key -r L resize-pane -R "5"
        bind-key -r J resize-pane -D "5"
        bind-key -r K resize-pane -U "5"
      # }}}

      ## More key binds
      bind ! split-window -h -c "#{pane_current_path}"          # split horizontally
      bind - split-window -v -c "#{pane_current_path}"          # split vertically
      bind n new-window                                         # open new window
      bind x kill-pane                                          # kill pane without confirmation
      bind k kill-window                                        # kill window
      bind q kill-session                                       # kill session
      bind r source-file .config/tmux/tmux.conf                 # reload tmux config
      bind t select-layout tiled                                # tiled layout

      # Buffers
      bind b list-buffers  # list paste buffers
      bind p paste-buffer  # paste from the top paste buffer
      bind P choose-buffer # choose which buffer to paste from
    '';
  };
}
