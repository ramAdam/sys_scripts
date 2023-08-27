## Antivirus Scan Script

### Description

The `antivirus_scan.sh` script allows users to perform an antivirus scan using ClamAV on a specified directory. It checks if ClamAV is up-to-date and offers users the option to update the ClamAV database before running the scan. If the user chooses not to update, the script proceeds directly with the scan, displaying the scan results without any modifications.

### How to Use

1. Clone this repository to your local machine using Git.
2. Navigate to the cloned repository directory.
3. Execute the `antivirus_scan.sh` script with the desired directory as an argument.
   Example: `./antivirus_scan.sh /path/to/your/directory`

Please note that the `antivirus_scan.sh` script requires ClamAV to be installed on your system. If ClamAV is not installed, you can install it using the package manager of your operating system.
