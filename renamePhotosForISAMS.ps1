<#
Script to rename photos from username.jpg to ISAMSID.jpg

Assumptions:



Place jpg files in images folder.



#>


# Load CSV report with ID and email addresses

$CSV = Import-Csv .\StaffNameAndID.csv

# For each row in CSV try to rename image with matching username filename in current directory to be iSAMS ID
# IF image doesn't exist, log and move on

foreach ($ROW in $CSV) {
    # Regex to get username from email
    $Username = $ROW.SchoolEmailAddress.Split("@")[0]
    $ISAMSID = $ROW.TblStaffID
    # Only process if username exists
    if ($Username) {
        Write-Output $Username
        Rename-Item -Path ".\images\$Username.jpg" -NewName "$ISAMSID.jpg"
    }
    # Write-Output $Username
}