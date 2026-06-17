output "jenkins_public_ip" {
  value       = aws_instance.jenkins_server.public_ip
  description = "The public IP address of the Jenkins CI/CD server."
}

output "production_public_ip" {
  value       = aws_instance.prod_server.public_ip
  description = "The public IP address of the Production application server."
}
