#!/usr/bin/env sh

ws=${1:-$AEROSPACE_FOCUSED_WORKSPACE}

IFS=$'\n' all_wins=$(aerospace list-windows --all --format '%{window-id}|%{app-name}|%{window-title}|%{monitor-id}|%{workspace}')
IFS=$'\n' all_ws=$(aerospace list-workspaces --all --format '%{workspace}|%{monitor-id}')

pip_titles=("Picture-in-picture" "Picture-in-Picture" "Picture in Picture" "Picture in picture" "微信" "WeChat" "画中画" "Simulator")

find_pip_windows() {
  local titles=("$@")
  local result=""
  for title in "${titles[@]}"; do
    echo "$title"
    local matches=$(printf '%s\n' "$all_wins" | grep "$title")
    result="$result"$'\n'"$matches"
  done
  echo "$result" | sed '/^\s*$/d'
}


pip_wins=$(find_pip_windows "${pip_titles[@]}")
target_mon=$(printf '%s\n' "$all_ws" | grep "^$ws" | cut -d'|' -f2 | xargs)

move_win() {
  local win="$1"

  [[ -n $win ]] || return 0

  local win_mon=$(echo "$win" | cut -d'|' -f4 | xargs)
  local win_id=$(echo "$win" | cut -d'|' -f1 | xargs)
  local win_app=$(echo "$win" | cut -d'|' -f2 | xargs)
  local win_ws=$(echo "$win" | cut -d'|' -f5 | xargs)

  # echo $target_mon -- "$win_mon"
  # echo "$win_id" "$win_ws"
  [[ $target_mon != "$win_mon" ]] && return 0
  [[ $ws == "$win_ws" ]] && return 0

  aerospace move-node-to-workspace --window-id "$win_id" "$ws"
}

echo "$pip_wins" | while IFS= read -r win; do
  move_win "$win"
done