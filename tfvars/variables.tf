variable "instances" {
    type = map
    
      
}

variable "domain_name" {
  default = "naziyadaws81.online"
}


variable "zone_id" {
  default = "Z05826553OW8WCB7B39D5"
}

variable "common_tags"{
  default = {
      project = "expense"
      Terraform = "true"
  }
}

variable "tags" {
  type = map 
}

variable "environment" {

}