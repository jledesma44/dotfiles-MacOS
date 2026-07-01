# Misc Commands

### Formating SD Cards on MacOS

- Insert SD card into the SD card port

- To view the list of volumes in the terminal run this command

```Bash
diskutil list
```

#### Identify the SD card usually is the last volume in the list. Below is and example of the output

```zsh
/dev/disk0 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *2.0 TB     disk0
   1:             Apple_APFS_ISC Container disk1         524.3 MB   disk0s1
   2:                 Apple_APFS Container disk3         2.0 TB     disk0s2
   3:        Apple_APFS_Recovery Container disk2         5.4 GB     disk0s3

/dev/disk3 (synthesized):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      APFS Container Scheme -                      +2.0 TB     disk3
                                 Physical Store disk0s2
   1:                APFS Volume Macintosh HD            12.6 GB    disk3s1
   2:              APFS Snapshot com.apple.os.update-... 12.6 GB    disk3s1s1
   3:                APFS Volume Preboot                 9.0 GB     disk3s2
   4:                APFS Volume Recovery                1.3 GB     disk3s3
   5:                APFS Volume Macintosh HD - Data     279.1 GB   disk3s5
   6:                APFS Volume VM                      2.1 GB     disk3s6

/dev/disk4 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *32.0 GB    disk4
   1:                 DOS_FAT_32 SDCARD                  32.0 GB    disk4s1



```

- Now that you identified your volume format it. Run the command below to do that:

```Bash
sudo diskutil eraseDisk FAT32 SDCARD MBRFormat /dev/disk4
```

 ### Eject the SD card

- Once the disk has be re-formatted you can safely eject the card:

```Bash
sudo diskutil eject /dev//diks4
```
