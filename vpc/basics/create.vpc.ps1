# Set your region and VPC ID
$region = "us-east-1"
$VPC_ID = "vpc-0123456789abcdef0"  # Replace with your actual VPC ID

# Create an Internet Gateway
$IGW_ID = aws ec2 create-internet-gateway `
    --query "InternetGateway.InternetGatewayId" `
    --output text `
    --region $region
Write-Output "IGW_ID: $IGW_ID"

# Attach the Internet Gateway to the VPC
aws ec2 attach-internet-gateway `
    --internet-gateway-id $IGW_ID `
    --vpc-id $VPC_ID `
    --region $region
Write-Output "Attached IGW to VPC"

# Create a new subnet
$SUBNET_ID = aws ec2 create-subnet `
    --vpc-id $VPC_ID `
    --cidr-block "172.1.0.0/20" `
    --query "Subnet.SubnetId" `
    --output text `
    --region $region
Write-Output "SUBNET_ID: $SUBNET_ID"

# Enable auto-assign public IP
aws ec2 modify-subnet-attribute `
    --subnet-id $SUBNET_ID `
    --map-public-ip-on-launch `
    --region $region
Write-Output "Enabled auto-assign public IP for subnet"

# Get the main route table ID of the VPC
$RT_ID = aws ec2 describe-route-tables `
    --filters "Name=vpc-id,Values=$VPC_ID" "Name=association.main,Values=true" `
    --query "RouteTables[].RouteTableId[]" `
    --output text `
    --region $region
Write-Output "RT_ID: $RT_ID"

# Associate the subnet with the route table
$ASSOC_ID = aws ec2 associate-route-table `
    --route-table-id $RT_ID `
    --subnet-id $SUBNET_ID `
    --query "AssociationId" `
    --output text `
    --region $region
Write-Output "ASSOC_ID: $ASSOC_ID"

# Add a route to the Internet Gateway
aws ec2 create-route `
    --route-table-id $RT_ID `
    --destination-cidr-block 0.0.0.0/0 `
    --gateway-id $IGW_ID `
    --region $region
Write-Output "Route to IGW created in route table"
