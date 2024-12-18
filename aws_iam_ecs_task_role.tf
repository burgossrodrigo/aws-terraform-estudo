data "aws_iam_policy_document" "ecs_task_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "get_secret_bia_db" {
    name = "GetSecretBiaDB"
    description = "Policy para recuperar secrets da Bia"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Action = ["secretsmanager:GetSecretValue"],
            Effect = "Allow",
            Resource = "${tolist(aws_db_instance.bia.master_user_secret)[0].secret_arn}"
        }]
    })
}

resource "aws_iam_role" "ecs_task_role" {
    name = "bia-ecs-task-role"
    assume_role_policy = data.aws_iam_policy_document.ecs_task_role.json
}

resource "aws_iam_role_policy_attachment" "get_secret_bia_db" {
    role       = aws_iam_role.ecs_task_role.name
    policy_arn = aws_iam_policy.get_secret_bia_db.arn
}
