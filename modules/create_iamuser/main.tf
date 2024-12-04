// create iam user

resource "aws_iam_user" "create_user" {
  name = var.iam_user_name
  tags = {
    name = var.iam_user_name
  }
}

data "aws_iam_policy" "name" {
  arn = "arn:aws:iam::891376962570:policy/dayaansible"
}

resource "aws_iam_policy_attachment" "name" {
    name = "policy-attach"
  users = [aws_iam_user.create_user.name]
  policy_arn = data.aws_iam_policy.name.arn
}