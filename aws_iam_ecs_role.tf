data "aws_iam_policy_document" "ecs_instance_role" {
    statement {
      actions = ["sts:AssumeRole"]
      effect = "Allow"

      principals {
        type       = "Service"
        identifiers = ["ec2.amazonaws.com"]
      }
    }
}

resource "aws_iam_role" "ecs_instance_role" {
    name               = "ecs-instance-role-tf"
    assume_role_policy = data.aws_iam_policy_document.ecs_instance_role.json
}