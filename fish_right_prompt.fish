function fish_right_prompt
  set -l status_copy $status
  if test $status_copy -ne 0
    set_color red
    echo -sn "($status_copy) "
    set_color normal
  end

  set -l duration $CMD_DURATION
  if test $duration -gt 500
    echo -n (echo $duration | humanize_duration)" "
  end

  set_color -d
  echo -n "%"(jobs | cut -f1)
  set_color normal
end
