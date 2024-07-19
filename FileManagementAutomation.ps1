# FileManagementAutomation.ps1
# This script performs file management tasks such as moving files based on extension, renaming files in bulk, and archiving old files.

param (
    [string]$SourceDirectory = "C:\SourceDirectory",
    [string]$DestinationDirectory = "C:\DestinationDirectory",
    [string]$ArchiveDirectory = "C:\ArchiveDirectory",
    [string]$FileExtension = "*.txt",
    [int]$DaysOld = 30
)

# Function to check and create directories if they don't exist
function Ensure-DirectoryExists {
    param (
        [string]$Directory
    )
    if (-Not (Test-Path -Path $Directory)) {
        New-Item -ItemType Directory -Path $Directory
    }
}

# Function to move files based on extension
function Move-FilesByExtension {
    [CmdletBinding()]
    param (
        [string]$Source,
        [string]$Destination,
        [string]$Extension
    )

    Ensure-DirectoryExists -Directory $Source
    Ensure-DirectoryExists -Directory $Destination

    Get-ChildItem -Path $Source -Filter $Extension | ForEach-Object {
        Move-Item -Path $_.FullName -Destination $Destination -Force
    }

    Write-Output "Moved files with extension $Extension from $Source to $Destination."
}

# Function to rename files in bulk
function Rename-FilesInBulk {
    [CmdletBinding()]
    param (
        [string]$Directory,
        [string]$NewName
    )

    Ensure-DirectoryExists -Directory $Directory

    $counter = 1
    Get-ChildItem -Path $Directory | ForEach-Object {
        $newFileName = "$NewName-$counter$($_.Extension)"
        Rename-Item -Path $_.FullName -NewName $newFileName
        $counter++
    }

    Write-Output "Renamed files in $Directory to $NewName-#.ext format."
}

# Function to archive old files
function Archive-OldFiles {
    [CmdletBinding()]
    param (
        [string]$Source,
        [string]$Archive,
        [int]$Days
    )

    Ensure-DirectoryExists -Directory $Source
    Ensure-DirectoryExists -Directory $Archive

    $cutoffDate = (Get-Date).AddDays(-$Days)
    Get-ChildItem -Path $Source | Where-Object { $_.LastWriteTime -lt $cutoffDate } | ForEach-Object {
        Move-Item -Path $_.FullName -Destination $Archive -Force
    }

    Write-Output "Archived files older than $Days days from $Source to $Archive."
}

# Main script execution
Move-FilesByExtension -Source $SourceDirectory -Destination $DestinationDirectory -Extension $FileExtension
Rename-FilesInBulk -Directory $DestinationDirectory -NewName "RenamedFile"
Archive-OldFiles -Source $SourceDirectory -Archive $ArchiveDirectory -Days $DaysOld