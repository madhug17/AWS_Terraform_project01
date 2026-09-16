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
