.<#
.SYNOPSIS
  Snippets for managing disks, partitions and volumes

.DESCRIPTION


.OUTPUTS

.EXAMPLE

.LINK

#>

#
# Disk
#

# List disks on a system
Get-Disk

# List everything other than system disk (SAFER!!)
Get-Disk | Where-Object IsSystem -eq $False

# List offline disks
Get-Disk | Where-Object IsOffline –eq $True

# Initialise recently added disks
Get-Disk | Where-Object PartitionStyle –Eq 'RAW' | Initialize-Disk

#
# Disk\Partition
#

# List partitions for all disks
Get-Disk | Get-Partition

# List partitions on specific disks
Get-Partition –DiskNumber 0, 1

# Create new partition, using next availble drive letter and maximum size 
New-Partition –DiskNumber 2 -AssignDriveLetter –UseMaximumSize

# Create new partition, explicityly providing drive letter and size
New-Partition –DiskNumber 2 -Size 40gb -DriveLetter d

#
# Disk\Partition\Volume
#

# List all volumes
Get-Volume

# Format volumes with NTFS
Format-Volume -DriveLetter E, H -FileSystem NTFS -Confirm:$false

# Everything together
Get-Disk |
    Where-Object PartitionStyle -eq 'RAW' |
        Initialize-Disk -PartitionStyle MBR -PassThru |
            New-Partition -AssignDriveLetter -UseMaximumSize |
                Format-Volume -FileSystem NTFS -Confirm:$false