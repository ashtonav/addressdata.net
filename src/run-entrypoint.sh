#!/usr/bin/env bash
set -e

echo "Scanning for .db files under 'databases'..."

# Find all .db files under ./databases/ and sort them case‑insensitively
mapfile -t DB_PATHS < <(
  find databases -type f -name '*.db' \
  | sort -f       # -f = ignore case
)

# TODO: A HACK: This fixes issue where first item in array appears last. 
# --- Rotate array: move last element to the front ------------------------- # <<<
count=${#DB_PATHS[@]}
if ((count > 1)); then
  last_index=$((count - 1))                       # index of last element
  last="${DB_PATHS[$last_index]}"                 # capture last element
  DB_PATHS=("$last" "${DB_PATHS[@]:0:$last_index}")  # rebuild array
fi
# --------------------------------------------------------------------------- # <<<

echo                                                                  # <<<
echo "Found ${#DB_PATHS[@]} database file(s):"                        # <<<
printf '  %s\n' "${DB_PATHS[@]}"                                      # <<<
echo                                                                  # <<<

datasette inspect "${DB_PATHS[@]}" --inspect-file "inspect-data.json"
echo "Created inspect-data.json"

exec datasette serve \
  --immutable "${DB_PATHS[@]}" \
  --metadata metadata.yaml \
  --inspect-file inspect-data.json \
  --setting default_allow_sql off \
  --setting allow_facet off \
  --setting max_returned_rows 25000 \
  --static static:static/ \
  --host 0.0.0.0 \
  --port 8001
