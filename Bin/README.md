# Instructions for initializing a new Mac

1. Go to iCloud/documents/bin and copy the bin folder to your user folder.
2. Run the init-mac-setup script to install Xcode and create ssh keys to github.
3. When creating the ssh keys for git hub you'll be asked to enter your email for the github account. (email = 49803962+jledesma44@users.noreply.github.com)

## Instructions to create a script for making ssh keys to github

1. create ssh keys for github
2. add "gh" and computer's host name to rename the keys
3. add keys to ssh agent
4. create ~.ssh/config if it doesn't exist
5. use macos keychain
6. Once ssh keys are created cat public key to be copied
7. echo instructions for user to add keys github and test the connection
8. finally, change the current dotfiles git repository from https to ssh in order to push any changes in the future
