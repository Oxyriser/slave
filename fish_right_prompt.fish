function fish_right_prompt
  set -l status_copy $status

  if test $status_copy -ne 0
    set_color $fish_color_error
    echo -sn "($status_copy)"
  end

  set_color normal
  set_color -d

  for i in (jobs | cut -f1)
    echo -n " %"$i
  end

  set_color normal
end
