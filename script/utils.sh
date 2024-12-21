
link_file() {
  local file=$1
  local target=$2
  local base_name=$(basename "$file")
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      backup_file="$BACKUP_DIR/${base_name}.backup.$(date +%Y%m%d%H%M%S)"
      mv "$target" "$backup_file"
      echo "已将现有的 $target 备份为 $backup_file"
      ln -s "$file" "$target"
      echo "$file -> $target"
    else
      echo "跳过 $target"
    fi
  else
    ln -s "$file" "$target"
    echo "$file -> $target"
  fi
}

is_hardlink() {
    local file="$1"
    local link_count
    if [[ "$(uname)" == "Darwin" ]]; then
        link_count=$(stat -f "%l" "$file")
    else
        link_count=$(stat -c "%h" "$file")
    fi
    
    if [ "$link_count" -gt 1 ]; then
        return 0
    else
        return 1
    fi
}

link_file_hard() {
  local file=$1
  local target=$2
  local base_name=$(basename "$file")
  if [ -e "$target" ]; then
    if ! is_hardlink "$target"; then
      backup_file="$BACKUP_DIR/${base_name}.backup.$(date +%Y%m%d%H%M%S)"
      mv "$target" "$backup_file"
      echo "已将现有的 $target 备份为 $backup_file"
      ln "$file" "$target"
      echo "$file -> $target"
    else
      echo "跳过 $target"
    fi
  else
    ln "$file" "$target"
    echo "$file -> $target"
  fi
}