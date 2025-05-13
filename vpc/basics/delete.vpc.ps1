# PowerShell script to delete VPC components

param (
    [string]$VPC_ID,
    [string]$IGW_ID,
    [string]$SUBNET_ID,
    [string]$ASSOC_ID,
    [string]$RT_ID
)

if (-not $VPC_ID) { Write-Output "VPC_ID argument not provided."; exit }
if (-not $IGW_ID) { Write-Output "IGW_ID argument not provided."; exit }
if (-not $SUBNET_ID) { Write-Output "SUBNET_ID argument not provided."; exit }
if (-not $ASSOC_ID) { Write-Output "ASSOC_ID argument not provided."; exit }
if (-not $RT_ID) { Write-Output "RT_ID argument not provided."; exit }

# Detach the Internet Gateway
aws ec2 detach-internet-gateway `
    --internet-gateway-id $IGW_ID `
    --vpc-id $VPC_ID
Write-Output "Detached IGW from VPC"

# Disassociate the subnet from route table
aws ec2 disassociate-route-table `
    --association-id $ASSOC_ID
Write-Output "Disassociated subnet from route table"

# Delete the subnet
aws ec2 delete-subnet `
    --subnet-id $SUBNET_ID
Write-Output "Deleted subnet"

# Optionally delete the route table
# aws ec2 delete-route-table `
#     --route-table-id $RT_ID
# Write-Output "Deleted route table"

# Delete the internet gateway
aws ec2 delete-internet-gateway `
    --internet-gateway-id $IGW_ID
Write-Output "Deleted IGW"

# Delete the VPC
aws ec2 delete-vpc `
    --vpc-id $VPC_ID
Write-Output "Deleted VPC"
