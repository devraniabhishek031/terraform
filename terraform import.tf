Steps to import the aws to terraform  migration 


step first create a main.tf 

provider "aws" {
    region = "us-ease-1"
  
}
import {
  id = "As per the ui follow "
  to = aws_instance.first_instance
}


Then run the command is    "terraform plan -generate-config-out=generated_resource.tf"
So this will generate the file call genetated_resource.tf then copy the inside resource and put this in your main.tf

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami                                  = "ami-0731becbf832f281e"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1b"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  enable_primary_ipv6                  = null
  get_password_data                    = false
  hibernation                          = false
  host_id                              = null
  host_resource_group_arn              = null
  iam_instance_profile                 = null
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  ipv6_address_count                   = 0
  ipv6_addresses                       = []
  key_name                             = "recoverykey"
  monitoring                           = false
  placement_group                      = null
  placement_partition_number           = 0
  private_ip                           = "192.168.***"
  secondary_private_ips                = []
  security_groups                      = ["launch-wizard-29"]
  source_dest_check                    = true
  subnet_id                            = "subnet-0a9f4aa85399c8fbf"
  tags = {
    Name = "aws-migration"
  }
  tags_all = {
    Name = "aws-migration"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_base64            = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-0301d5b0362e0df83"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    amd_sev_snp      = null
    core_count       = 1
    threads_per_core = 1
  }
  credit_specification {
    cpu_credits = "standard"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    kms_key_id            = null
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}


then run command after this "terraform import aws_instance.firstinstance ami-id "
so this command will terraform.tfstate file will be genrate 

then we run terraform plan so this will show the "every thing is updated instead of new creation"
