resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}


# =========================================================================
# NETWORK ARCHITECTURE FLOW:
# 
#    aws_subnet.public.id
#             │
#             ▼
#        Public Subnet
#             │
#             │ associated with
#             ▼
#    aws_route_table.public.id
#             │
#             ▼
#     Public Route Table
#             │
#             ▼
#      Internet Gateway
# =========================================================================

# this association.tf is basically doing "Connect this Public Subnet to this Public Route Table."
# Private (VPC) : Private = not directly reachable by everyone; access is controlled. 🔐
# public :Public = has a network path that can allow internet communication, subject to security-group rules. 🌐
