# null-rsync3

null-rsync3 is a Python script inspired by the original null-rsync tool from Mirrorbrain. Its primary function is to mirror a file tree from a remote source, but unlike traditional mirroring tools, null-rsync3 creates files containing only zeroes, while maintaining file metadata such as names, creation and modification dates, and permissions. This can save significant time and disk space when you need a mirrored file tree for testing purposes, and you don't require the actual file content.
Features

- Mirrors remote file tree while maintaining file metadata
- Files contain only zeroes, saving disk space
- Files are created as sparse files
- Option to exclude files
- Email notification on errors, with rate limiting to avoid spam
- Easy to use and maintain, with clear and extensive code comments

## Security

This script preserves file permissions from the source, but it does not make locally mirrored directories world-writable, even if they are on the remote source. This is a security measure to prevent unauthorized modification of the local file tree.
Usage

null-rsync3 is intended to be used as a cron job, running at regular intervals to keep the local file tree in sync with the remote source. The command line syntax is as follows:

    python3 null_rsync3.py <rsync_source_url> <local_path> 

You can optionally specify a pattern of files to exclude:

    python3 null_rsync3.py --exclude <pattern> <rsync_source_url> <local_path>

## Error Handling

If an error occurs during the mirroring process, null-rsync3 logs the error and continues with the next file. After all files have been processed, if there were any errors, an email is sent to the address specified in the script. To avoid excessive emails, the script only sends an email if it has been at least X days since the last one was sent, where X is a value that you can adjust in the script.
Debugging

If you encounter issues with null-rsync3, you can enable verbose logging by uncommenting the appropriate lines in the script. This will provide detailed information about the mirroring process, which can be helpful for troubleshooting.

## Installation and Usage

1. Clone this repository.
   ```
   git clone https://github.com/OpenMandrivaAssociation/null-rsync3.git
   ```
2. Navigate to the cloned repository.
   ```
   cd null-rsync3
   ```
3. Copy the sample script and modify it as needed.
   ```
   cp null_rsync3.py.sample null_rsync3.py
   ```
4. Update the script with your rsync source URL and local path.
   ```
   vim null_rsync3.py
   ```
5. Run the script.
   ```
   python3 null_rsync3.py
   ```

## Docker Usage
1. Clone this repository.
   ```
   git clone https://github.com/OpenMandrivaAssociation/null-rsync3.git
   ```
2. Navigate to the cloned repository.
   ```
   cd null-rsync3
   ```
3. Copy the sample Docker Compose file and modify it as needed.
   ```
   cp docker-compose.yml.sample docker-compose.yml
   ```
4. Update the Docker Compose file with your rsync source URL and local path.
   ```
   nano docker-compose.yml
   ```
5. Build the Docker image and run the container.
   ```
   docker-compose up --build -d
   ```

## License
This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE) file for details.

---

N'oubliez pas de vous assurer que les liens du dépot Git sont corrects et de remplacer tous les exemples de commande avec vos propres détails si nécessaire.

## License

null-rsync3 is released under the GNU General Public License v3.0. It is maintained by the OpenMandriva Association.

## Acknowledgements

null-rsync3 was inspired by the original null-rsync tool from Mirrorbrain. You can find the original tool here: [Mirrorbrain null-rsync](https://github.com/poeml/mirrorbrain/blob/master/tools/null-rsync)
