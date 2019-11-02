function fish_prompt
  set -l red (set_color red)
  set -l cyan (set_color cyan)
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l magenta (set_color magenta)
  set -l yellow (set_color yellow)
  set -l bold (set_color -o white)
  set -l normal (set_color normal)
  set -l space " "

  if test 0 -eq (id -u $USER)
    echo -sn $red "#" $normal$space
  end

  if set -q VIRTUAL_ENV
    echo -sn  $yellow "("(basename $VIRTUAL_ENV)")" $normal$space
  end

  if test $PWD = ~
    set path "~"
  else
    set path (basename $PWD)
  end
  echo -sn $bold $path $normal$space

  if git_is_repo
    set -l git_glyph ""

    if git_is_dirty
      set git_glyph $git_glyph$yellow"!"$normal
    end

    if test (git_untracked_files) -gt 0
      set git_glyph $git_glyph$blue"*"$normal
    end

    if git_is_stashed
      set git_glyph $git_glyph$magenta"^"$normal
    end

    if git_is_staged
      set git_glyph $git_glyph$green"+"$normal
    end

    set git_glyph $git_glyph$red(git_ahead ">" "<" "≠")

    echo -n (git_branch_name)$git_glyph$normal$space
  end
end
