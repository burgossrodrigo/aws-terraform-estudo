resource "aws_cloudwatch_log_group" "ecs_bia_web" {
  name              = "/aws/ecs/bia"
  retention_in_days = 7
}