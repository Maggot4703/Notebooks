#!/usr/bin/env bash

if [ -z "${BASH_VERSION:-}" ]; then
	exec bash "$0" "$@"
fi

set -euo pipefail

search_root="$PWD"
output_file="$PWD/links-ipynb.sh"

declare -a notebook_paths=()
declare -A basename_counts=()

while IFS= read -r -d '' notebook; do
	notebook_paths+=("$notebook")
done < <(
	find "$search_root" -mindepth 1 -maxdepth 1 -type d -print0 |
		while IFS= read -r -d '' dir; do
			dir_name="$(basename "$dir")"
			if [[ "$dir_name" =~ ^[A-Z][A-Z0-9_-]*$ ]]; then
				find "$dir" -type f -name '*.ipynb' ! -path '*/.ipynb_checkpoints/*' -print0
			fi
		done |
		sort -z
)

if [[ ${#notebook_paths[@]} -eq 0 ]]; then
	: > "$output_file"
	echo "No .ipynb files found under top-level ALL-CAPS folders in $search_root"
	echo "Wrote empty list: $output_file"
	exit 0
fi

printf '%s\n' "${notebook_paths[@]}" > "$output_file"

tmp_output="$(mktemp)"
printf '%s\n\n' '#!/usr/bin/env bash' >> "$tmp_output"
for notebook in "${notebook_paths[@]}"; do
	printf 'ln -s %q %q\n' "$notebook" "$PWD" >> "$tmp_output"
done
mv "$tmp_output" "$output_file"
chmod +x "$output_file"

echo "Wrote symlink command list: $output_file"

for notebook in "${notebook_paths[@]}"; do
	base_name="$(basename "$notebook")"
	basename_counts["$base_name"]=$(( ${basename_counts["$base_name"]:-0} + 1 ))
done

for notebook in "${notebook_paths[@]}"; do
	base_name="$(basename "$notebook")"
	link_name="$PWD/$base_name"

	if [[ ${basename_counts["$base_name"]} -gt 1 ]]; then
		stem="${base_name%.ipynb}"
		candidate_index=1
		while true; do
			if [[ $candidate_index -eq 1 ]]; then
				candidate="$PWD/$base_name"
			else
				candidate="$PWD/${stem}__${candidate_index}.ipynb"
			fi

			if [[ -L "$candidate" ]]; then
				current_target="$(readlink "$candidate")"
				if [[ "$current_target" == "$notebook" ]]; then
					link_name="$candidate"
					break
				fi
			elif [[ ! -e "$candidate" ]]; then
				link_name="$candidate"
				break
			fi

			candidate_index=$((candidate_index + 1))
		done
	fi

	if [[ -L "$link_name" ]]; then
		current_target="$(readlink "$link_name")"
		if [[ "$current_target" == "$notebook" ]]; then
			echo "Unchanged: $link_name -> $notebook"
			continue
		fi

		if [[ ${basename_counts["$base_name"]} -eq 1 ]]; then
			rm "$link_name"
			ln -s "$notebook" "$link_name"
			echo "Updated: $link_name -> $notebook"
		else
			echo "Skipped (conflicting symlink for duplicate basename): $link_name"
		fi
		continue
	fi

	if [[ -e "$link_name" ]]; then
		echo "Skipped (path exists and is not a symlink): $link_name"
		continue
	fi

	ln -s "$notebook" "$link_name"
	echo "Created: $link_name -> $notebook"
done


