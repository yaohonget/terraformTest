resource  "local_file" "hello" {
  content = "hello Terraform!"
  filename = "${path.module}/hello.txt"
}