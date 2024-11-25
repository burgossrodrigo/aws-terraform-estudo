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

resource "aws_iam_role_policy_attachment" "ecs_instance_role_policy" {
    role = aws_iam_role.ecs_instance_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "ssm_managed_instance_core" {
    role = aws_iam_role.ecs_instance_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
