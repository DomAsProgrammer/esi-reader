# INSTALLATION

 1. Download the [esi-reader source files](https://github.com/DomAsProgrammer/esi-reader/archive/refs/heads/main.zip).
 2. Extract the downloaded ZIP file.
 3. Change into the folder extracted from the ZIP file.
 4. Install [perlbrew](https://perlbrew.pl/)
 5. Install further dependencies with `make deps`<br>NOTE: This may require further packages to be installed from your package manager. Read the logs shown if it fails.
 6. Build the binary with`make`
 7. Install it to your personal search path:<br>`mkdir --parents --verbose ~/bin`<br>`cp --archive esi-reader.$(uname --kernel-name) ~/bin/esi-reader`
 8. Make it executable:<br>`chmod +x ~/bin/esi-reader`
 9. Run it.

