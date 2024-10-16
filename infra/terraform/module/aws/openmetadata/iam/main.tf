resource "aws_iam_policy" "ecs_task_execution" {
  name = "${var.name_prefix}-policy-${var.region_short_name}-ecs-task-execution"
  policy = templatefile(
    "${path.module}/iam_policy/ecs_task_exec.json.tpl",
    {
      region        = data.aws_region.current.name
      account_id    = data.aws_caller_identity.current.account_id
      s3_bucket_arn = var.docker_envfile_bucket_arn
    }
  )
}

resource "aws_iam_role" "ecs_task_execution" {
  name                = "${var.name_prefix}-role-${var.region_short_name}-ecs-task-execution"
  assume_role_policy  = file("${path.module}/iam_assume_role_policy/ecs_task_exec.json.tpl")
  managed_policy_arns = [aws_iam_policy.ecs_task_execution.arn]
}

resource "aws_iam_policy" "ecs_task" {
  name = "${var.name_prefix}-policy-${var.region_short_name}-ecs-task"
  policy = templatefile(
    "${path.module}/iam_policy/ecs_task.json.tpl",
    {
      region        = data.aws_region.current.name
      account_id    = data.aws_caller_identity.current.account_id
      s3_bucket_arn = var.docker_envfile_bucket_arn
    }
  )
}

resource "aws_iam_role" "ecs_task" {
  name = "${var.name_prefix}-role-${var.region_short_name}-ecs-task"
  assume_role_policy = templatefile(
    "${path.module}/iam_assume_role_policy/ecs_task.json.tpl",
    {
      region     = data.aws_region.current.name
      account_id = data.aws_caller_identity.current.account_id
    }
  )
  managed_policy_arns = [aws_iam_policy.ecs_task.arn]
}