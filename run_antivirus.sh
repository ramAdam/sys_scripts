#!/bin/bash

# Function to check if ClamAV is up-to-date
check_clamav_update() {
  local update_log="$HOME/freshclam.log"

  echo "Checking ClamAV for updates..."
  freshclam --quiet --datadir="$HOME" --log="$update_log"
  if [ $? -eq 0 ]; then
    echo "ClamAV is up-to-date."
  else
    echo "ClamAV definitions are outdated. Do you want to update ClamAV now? (Y/N)"
    read -r update_choice
    if [[ $update_choice =~ ^[Yy]$ ]]; then
      echo "Updating ClamAV..."
      sudo freshclam --datadir="$HOME" --log="$update_log"
      echo "ClamAV updated successfully."
    else
      echo "Skipping ClamAV update. Proceeding with the scan."
    fi
  fi
}

# Function to display "OK" in green color
# Function to display "OK" in green color
print_green_ok() {
  local green='\033[0;32m'
  local reset='\033[0m'
  local line_without_ok="${line%: }"
  echo -e "${line_without_ok} ${green}OK${reset}"
}

# Check if a directory path is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/your/directory"
  exit 1
fi

# Validate if the provided path is a valid directory
if [ ! -d "$1" ]; then
  echo "Error: '$1' is not a valid directory path."
  exit 1
fi

# Print a warning that antivirus scan is running
echo "### Running Antivirus Scan on $1 ###"

# Ask user if they want to update ClamAV database before scanning
echo "Do you want to update the ClamAV database before scanning? (Y/N)"
read -r update_choice
if [[ $update_choice =~ ^[Yy]$ ]]; then
  # Check for ClamAV updates
  check_clamav_update
else
  echo "Skipping ClamAV update. Proceeding with the scan."
fi

# Run clamscan recursively on the provided directory
clamscan -r "$1" | awk '/OK$/ {print $0}' | sed -E 's/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g' | while IFS= read -r line; do
  print_green_ok
done

# Inform that the scan has finished
echo "### Antivirus Scan Completed ###"

