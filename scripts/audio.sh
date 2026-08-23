#!/bin/bash

flac_to_mp3() {
  for file in *.flac; do ffmpeg -i "$file" -ab 320k "${file%.flac}.mp3"; done
}

m4a_to_flac() {
  for file in *.m4a; do ffmpeg -i "$file" -c:a flac "${file%.m4a}.flac"; done
}

remove_custom() {
  TARGET_DIR="${1:-.}"

  TEMP_DIR="$TARGET_DIR/clean_temp"
  mkdir -p "$TEMP_DIR"

  EXTENSIONS=("mp3" "m4a" "flac" "ogg" "wav")

  KEYS_TO_KEEP=("title" "artist" "album" "track" "date" "album_artist" "disc" "composer")

  echo "Processing audio files in: $TARGET_DIR"

  find "$TARGET_DIR" -maxdepth 1 -type f | while read -r filepath; do
      filename=$(basename "$filepath")
      extension="${filename##*.}"
      extension_lc=$(echo "$extension" | tr '[:upper:]' '[:lower:]')

      if [[ " ${EXTENSIONS[*]} " =~ " ${extension_lc} " ]]; then
          echo "Processing: $filename"

          metadata_args=()

          for key in "${KEYS_TO_KEEP[@]}"; do
              val=$(ffprobe -v error -show_entries "format_tags=$key" -of default=noprint_wrappers=1:nokey=1 "$filepath" 2>/dev/null)
              
              if [ -n "$val" ]; then
                  metadata_args+=("-metadata" "$key=$val")
              fi
          done

          ffmpeg -y -i "$filepath" -map_metadata -1 "${metadata_args[@]}" -c:a copy "$TEMP_DIR/$filename" -loglevel error

          if [ $? -eq 0 ]; then
              echo "Successfully cleaned: $filename"
          else
              echo "Error processing: $filename"
          fi
      fi
  done

  echo "Done! Cleaned files are in: $TEMP_DIR"
  echo "Verify the files. You can then manually replace the originals with the files in '$TEMP_DIR'."
}

remove_chapters() {
  mkdir temp_no_chapters && \
  for f in *.mp3; do
    ffmpeg -i "$f" -codec copy -map_chapters -1 "temp_no_chapters/$f"
  done && \
  mv temp_no_chapters/*.mp3 . && \
  rmdir temp_no_chapters
}

remove_custom_in_place() {
    # Target directory (default is current directory if not specified)
  TARGET_DIR="${1:-.}"

  # Directory to move the original files to for backup
  BACKUP_DIR="$TARGET_DIR/original_backups"
  mkdir -p "$BACKUP_DIR"

  # Supported audio extensions (add or remove as needed)
  EXTENSIONS=("mp3" "m4a" "flac" "ogg" "wav")

  # List of standard metadata tags we want to keep (lowercase)
  KEYS_TO_KEEP=("title" "artist" "album" "track" "genre" "date" "album_artist" "disc" "composer" "lyrics")

  echo "Moving original files to: $BACKUP_DIR and processing them..."

  # Loop through files in the target directory matching the extensions
  find "$TARGET_DIR" -maxdepth 1 -type f | while read -r filepath; do
      filename=$(basename "$filepath")
      extension="${filename##*.}"
      extension_lc=$(echo "$extension" | tr '[:upper:]' '[:lower:]')

      # Check if file extension is in our list
      if [[ " ${EXTENSIONS[*]} " =~ " ${extension_lc} " ]]; then
          echo "----------------------------------------"
          echo "Moving: $filename to backup"
          
          # Move the original file to the backup directory
          mv "$filepath" "$BACKUP_DIR/$filename"
          backup_filepath="$BACKUP_DIR/$filename"

          echo "Cleaning: $filename"

          # Initialize the ffmpeg metadata arguments
          metadata_args=()

          # Extract only the allowed metadata using ffprobe from the backup file
          for key in "${KEYS_TO_KEEP[@]}"; do
              # Query the specific tag value
              val=$(ffprobe -v error -show_entries "format_tags=$key" -of default=noprint_wrappers=1:nokey=1 "$backup_filepath" 2>/dev/null)
              
              # If the tag exists and is NOT empty, prepare it for the ffmpeg command
              if [ -n "$val" ]; then
                  metadata_args+=("-metadata" "$key=$val")
              fi
          done

          # Run ffmpeg:
          # Source is now the backup file
          # Output is written back to the original TARGET_DIR
          ffmpeg -y -i "$backup_filepath" -map_metadata -1 "${metadata_args[@]}" -c:a copy "$TARGET_DIR/$filename" -loglevel error

          if [ $? -eq 0 ]; then
              echo "Success: Cleaned version created in target directory."
          else
              echo "Error processing: $filename"
              # If ffmpeg fails, we restore the original file so you don't lose it
              mv "$backup_filepath" "$filepath"
          fi
      fi
  done

  echo "----------------------------------------"
  echo "Done! Cleaned files are in: $TARGET_DIR"
  echo "Original files are backed up in: $BACKUP_DIR"
}

remove_disc() {
  rename "Disc 1 - " "" "Disc 1 - "*
}

add_album_art() {
  COVER_IMAGE=""
  for ext in jpg jpeg png JPG JPEG PNG; do
      if [ -f "cover.$ext" ]; then
          COVER_IMAGE="cover.$ext"
          break
      fi
  done

  if [ -z "$COVER_IMAGE" ]; then
      echo "Error: No cover image (cover.jpg, cover.jpeg, or cover.png) found in this directory." >&2
      exit 1
  fi

  echo "Using cover image: $COVER_IMAGE"
  echo "----------------------------------------"

  shopt -s nullglob
  flac_files=(*.flac)
  shopt -u nullglob

  if [ ${#flac_files[@]} -eq 0 ]; then
      echo "No .flac files found in the current directory."
      exit 0
  fi

  for flac_file in "${flac_files[@]}"; do
      # Define a temporary file name
      temp_file="${flac_file%.flac}.tagged.tmp.flac"

      echo "Processing: $flac_file"

      if ffmpeg -y -i "$flac_file" -i "$COVER_IMAGE" \
          -map 0:0 -map 1:0 \
          -c copy \
          -metadata:s:v title="Album cover" \
          -metadata:s:v comment="Cover (front)" \
          "$temp_file" &> /dev/null; then
          
          mv "$temp_file" "$flac_file"
          echo "Successfully embedded art into: $flac_file"
      else
          echo "Failed to process: $flac_file" >&2
          [ -f "$temp_file" ] && rm "$temp_file"
      fi
  done

  echo "----------------------------------------"
  echo "Finished processing all files!"
}
