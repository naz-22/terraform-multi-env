resource "aws_instance" "expense" {
   for_each = var.instances # this variable is map
   #foreach will gives us a special variable with name each
    ami=  "ami-09c813fb71547fc4f"  # ths ami id will change over the time this is the id of redhatos(devops-practice) we using.
    instance_type = each.value
    vpc_security_group_ids = [ aws_security_group.allow_ssh_terraform.id ]
     tags = merge (
         var.common_tags,
         var.tags,
         {
            Name = each.key 
         }
     )
}
resource  "aws_security_group"  "allow_ssh_terraform" {
    name        = "allow_ssh_${var.environment}"  #allow_ssh is already in my account so given another name like sshh
    description = "Allow port number 22 for SSH  access"

  # usually we allow everything in  egress:means outgoing traffic where ingress:incoming traffic
  egress {
     from_port        = 0
     to_port          = 0
     protocol         = "-1"
     cidr_blocks      = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
  } 

   ingress {
     from_port        = 22
     to_port          = 22
     protocol         = "tcp" # by default "-1" means everything or we can just mention tcp
     cidr_blocks      = ["0.0.0.0/0"] # allow from everyone
     ipv6_cidr_blocks = ["::/0"]
  } 

   tags = merge(
      var.common_tags,
      var.tags,
      {
         Name = "allow_ssh_${var.environment}"
      }
   )

} 



