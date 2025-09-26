# Explanation of User Creation Script

This script reads a CSV file containing usernames and passwords, then
creates Linux user accounts and sets their passwords.

------------------------------------------------------------------------

## Script Breakdown

### `while IFS=, read -r username password; do`

-   Reads each line of the input file.
-   The Internal Field Separator (IFS) is set to a comma (`,`), so each
    line is split by commas.
-   The first value goes into `username`, the second into `password`.
-   Example: `ajit,1234` → username=`ajit`, password=`1234`.

------------------------------------------------------------------------

### `if [[ -n "$username" && -n "$password" ]]; then`

-   Ensures both `username` and `password` are non-empty.
-   Prevents errors from blank or incomplete lines.

------------------------------------------------------------------------

### `echo "Creating user: $username"`

-   Prints a message to indicate which user is being created.

------------------------------------------------------------------------

### `sudo useradd "$username"`

-   Creates a new user on the system with the specified username.

------------------------------------------------------------------------

### `echo "$username:$password" | sudo chpasswd`

-   Sets the password for the new user.
-   The string `username:password` is piped into the `chpasswd` command.

------------------------------------------------------------------------

### `# sudo passwd --expire "$username"`

-   (Optional, currently commented out.)
-   If enabled, forces the user to change their password on first login.

------------------------------------------------------------------------

### `echo "User $username created successfully"`

-   Prints a confirmation message after creating the user.

------------------------------------------------------------------------

### `done < "$input"`

-   Ends the loop.
-   Reads input lines from the file specified in the variable `$input`
    (e.g., `users.csv`).

------------------------------------------------------------------------

## Example Input File (users.csv)

    ajit,1234
    rahul,abcd
    meena,xyz123

------------------------------------------------------------------------

## Summary

1.  Reads each line of a CSV file (`username,password`).
2.  Creates a user account.
3.  Sets the password.
4.  Optionally forces password change on first login.
5.  Prints progress messages.
