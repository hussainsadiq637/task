output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.test.id
}

output "ec2_public_ip" {
  value = aws_eip.test_eip.public_ip
}


