                 INTERNET
                ↙        ↘
          INGRESS        EGRESS
          ↓                ↑
       coming IN        going OUT
          ↓                ↑
        ┌───────────────────┐
        │       EC2         │
        └───────────────────┘
Ingress = traffic coming INTO your EC2
Egress = traffic going OUT from your EC2


this Cidr_block 
tells AWS which IP address are allowed 
cidr_blocks = ["0.0.0.0/0"]

it you want to allow only particular person laptop then write they IP address
cidr_blocks = ["203.0.113.10/32"]

So cidr_blocks = which IP ranges can access the rule.


ingress {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
it only allows requests comes to the portal 80 rest not allow 
HTTP port 80     → ✅ Allowed
SSH port 22      → ❌ Not allowed
HTTPS port 443   → ❌ Not allowed
Port 5000        → ❌ Not allowed
Port 8080        → ❌ Not allowed
you can update them according to your requiredments 


from_port and to_port are the range your are allowing to your port 
example:
80 ─────── 80
     ↑
only port 80

8000 ─────────────── 8080
 │                     │
        allowed

it allow all the ip address which comes in this range but see where it is IP4 or IP6



TCP  → applications communicating
UDP  → fast connectionless communication
ICMP → network diagnostics
-1   → everything it will all all the type of protocol man 


about the Apache
#!/bin/bash this will run the linux code Run these commands using Bash.

yum is a package manager for Linux. Think of it like pip in Python, but for installing software on a Linux operating system.

yum update -y updates installed packages

yum install -y httpd Installs Apache HTTP Server

systemctl start httpd Starts Apache right now.

systemctl enable httpd makes apache automatically start when the server reboots

this will create the page ,echo "<h1>Hello from AWS Project 01!</h1>" > /var/www/html/index.html

about the data for Find Amazon Linux AMI automatically

ami = data.aws_ami.amazon_linux.id

we just change the AMI with data.linux it will autofind the AMI number 
("Terraform, find an appropriate Amazon Linux AMI and give me its ID.")


data "aws_ami" "amazon_linux"

"I don't want Terraform to create an AMI. I want Terraform to look up information about an existing AWS resource."

data.aws_ami.amazon_linux.id
             │
             └── finds AMI → gets its ID
                              ↓
                         EC2 uses it




<<<<<<<<<<<<<<<<<<<<final structure>>>>>>>>>
                    Internet
                       │
                 HTTP :80
                       │
              ┌────────▼────────┐
              │ Security Group  │
              │   TCP :80 ✅     │
              └───────┬─────────┘
                      │
             ┌────────┴────────┐
             │                 │
        ┌────▼─────┐      ┌────▼─────┐
        │   EC2 1  │      │   EC2 2  │
        │ t3.micro │      │ t3.micro │
        │  Apache  │      │  Apache  │
        └────┬─────┘      └────┬─────┘
             │                 │
             ▼                 ▼
        "Hello..."        "Hello..."


i learned for this project01 



AMI → OS/server image
instance type → EC2 size
resource name → Terraform's internal name
tags → labels/metadata
Security Group → firewall
Ingress → incoming traffic
Egress → outgoing traffic
CIDR → IP range
TCP/UDP/ICMP → network protocols
from_port / to_port → port range
user_data → startup commands
data → look up existing AWS information
count → create multiple instances
output → expose useful Terraform values
