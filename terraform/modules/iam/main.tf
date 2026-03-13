### ecs_execution_role jsonencode made with data source ###

data "aws_iam_policy_document" "assume_role_ecs_execution_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

### ecs_execution_role made ###

resource "aws_iam_role" "ecs_execution_r" {
  name               = var.ecs_execution_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_ecs_execution_role.json
}


### ecs_execution policy json made with data source ###

data "aws_iam_policy_document" "ecs_execution_policy" {
  statement {
    effect    = "Allow"
    actions   = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = ["*"]
  }
}

### ecs_execution policy made ###

resource "aws_iam_policy" "ecs_execution_p" {
  name        = var.ecs_execution_policy_name
  description = "Alb role that has permissiosn to ... (what is this roles purpose)"
  policy      = data.aws_iam_policy_document.ecs_execution_policy.json
}

### attaching ecs_execution role to ecs_execution policy  ###

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.ecs_execution_r.name
  policy_arn = aws_iam_policy.ecs_execution_p.arn
}

