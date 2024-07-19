# File Management Automation

This project contains a PowerShell script that automates file management tasks such as moving files based on extension, renaming files in bulk, and archiving old files.

## Script: FileManagementAutomation.ps1

### Parameters

- `SourceDirectory`: The source directory containing files to be managed.
- `DestinationDirectory`: The destination directory for moved files.
- `ArchiveDirectory`: The directory where old files will be archived.
- `FileExtension`: The file extension filter for moving files (e.g., `*.txt`).
- `DaysOld`: The age threshold (in days) for archiving old files.

### Functions

1. **Move-FilesByExtension**

   Moves files from the source directory to the destination directory based on the specified file extension.

2. **Rename-FilesInBulk**

   Renames files in the specified directory to a new name format.

3. **Archive-OldFiles**

   Archives files from the source directory to the archive directory if they are older than the specified number of days.

### Usage

1. Open PowerShell ISE.
2. Load the script `FileManagementAutomation.ps1`.
3. Run the script with the desired parameters:

   ```powershell
   .\FileManagementAutomation.ps1 -SourceDirectory "C:\SourceDirectory" -DestinationDirectory "C:\DestinationDirectory" -ArchiveDirectory "C:\ArchiveDirectory" -FileExtension "*.txt" -DaysOld 30

   ### How to Run the Script

1. **Open PowerShell ISE:**
   - Press `Windows Key + R`, type `powershell_ise`, and press `Enter`.

2. **Load the Script:**
   - Open `FileManagementAutomation.ps1` in PowerShell ISE.

3. **Run the Script:**
   - Modify the parameters as needed or use the default values.
   - Click on the "Run Script" button (F5) to execute the script.

### Uploading the Project to GitHub

1. **Create a GitHub Repository:**
   - Go to GitHub and create a new repository named `FileManagementAutomation`.

2. **Initialize Local Repository:**
   - Open Git Bash or your preferred terminal.
   - Navigate to the project directory and initialize a Git repository:

     ```bash
     cd path/to/FileManagementAutomation
     git init
     ```

3. **Add Files to Repository:**
   - Add the script and README files to the repository:

     ```bash
     git add FileManagementAutomation.ps1 README.md
     ```

4. **Commit Files:**
   - Commit the added files with a meaningful message:

     ```bash
     git commit -m "Initial commit of File Management Automation script"
     ```

5. **Add Remote Repository:**
   - Link your local repository to the GitHub repository:

     ```bash
     git remote add origin https://github.com/yourusername/FileManagementAutomation.git
     ```

6. **Push to GitHub:**
   - Push the committed files to the GitHub repository:

     ```bash
     git push -u origin master
     ```
