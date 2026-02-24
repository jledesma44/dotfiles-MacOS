# Basic Terminal commands

## Coping files and directories

### Coping files and directories from remote servers to local machine

The command to execute when copying a file or folder from a remote machine to the local machine is:

File:

scp jaimeledesma@geesmini-m4pro:/path/to/remote/file /path/to/local/directory

Directory:

scp -r jaimeledesma@geesmini-m4pro:/path/to/remote/directory /path/to/local/directory/

Same is true if you want to copy a file or folder from your local machine to a remote server/machine.

scp /path/to/local/file jaimeledesma@geesmini-m4pro:/path/to/remote/directory/

scp -r /path/to/local/directory/ jaimeledesma@geesmini-m4pro:/path/to/remote/directory/
