PROJECT 02

                 AWS Account
                     │
                   IAM
                     │
              Authentication
              + Authorization
                     │
                     ▼
                  VPC
          ┌──────────┴──────────┐
          │                     │
      Public Subnet         Private Subnet
          │                     │
         EC2                   RDS
          │
          │
          └──────────► S3


IAM : IAM controls who can access AWS resources and what they are allowed to do.

VPC : VPC provides network isolation and networking, rather than being the security mechanism by itself.

VPC
 ├── Subnets
 ├── Route Tables
 ├── Internet Gateway
 └── Security Groups / Network ACLs

EC2: EC2 gives us a virtual server with things such as:
CPU
RAM
Storage
Operating System
Network interface

S3: S3 is object storage, which is excellent for unstructured data such as:
Images
Videos
PDFs
Logs
Backups
Documents


Final design :

                    IAM
                     │
              Access Control
                     │
                     ▼
                  VPC
                     │
          ┌──────────┴──────────┐
          │                     │
     Public Subnet         Private Subnet
          │                     │
         EC2                    RDS
          │                     │
          └───────► S3 ◄────────┘


Manual Way:

SetUp IAM :
Check the Roles : 3 
Support → used for AWS Support-related functionality.
Trusted Advisor → allows Trusted Advisor to access information needed for its checks.
Resource Explorer → used by AWS Resource Explorer to work with resources.

policies: 
Think of a policy as a permission document.
> What actions is this identity allowed or not allowed to perform?

Allow
  ↓
S3
  ↓
GetObject
PutObject

create the policies for the IAM 


![alt text](<Screenshot 2026-09-14 151735.png>)
