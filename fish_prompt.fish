function fish_prompt
  set -l status_copy $status

  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l yellow (set_color yellow)
  set -l magenta (set_color magenta)
  set -l normal (set_color normal)

  if test "$TMUX"
    echo -sn $magenta"T$normal "
  end

  if test 0 -eq (id -u "$USER")
    echo -sn $red"#$normal "
  else
    set_color normal
  end

  if test "$PWD" = ~
    echo -sn "~"
  else
    echo -sn (basename "$PWD")
  end

  if git_is_repo
    set branch_name (git_branch_name)
    set untracked (git_untracked_files)

    set git_glyph ""
    if git_is_dirty
      set git_glyph $git_glyph$yellow"!"$normal
    end
    if test "$untracked" -gt 0
      set git_glyph $git_glyph$blue"*"$normal
    end
    if git_is_staged
      set git_glyph $git_glyph$green"+"$normal
    end

    set -l git_glyph $git_glyph$red(git_ahead "↑" "↓" "↑↓")$normal

    echo -n " $branch_name$git_glyph"
  end

  echo " "
end
