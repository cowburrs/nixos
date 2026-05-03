shell() {
  while read -r -p "$1> " cmd; do
    $1 $cmd
  done
}
