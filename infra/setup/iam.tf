#######################################################################
# Create IAM user and policies for Continuous Deployment (CD) account #
#######################################################################

resource "aws_iam_user" "cd" {
  name = "todo-app-api-cd"
}

resource "aws_iam_access_key" "cd" {
  user = aws_iam_user.cd.name
}


#########################
# Policy for EC2 access #
#########################

data "aws_iam_policy_document" "ec2" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:RunInstances",
      "ec2:TerminateInstances",
      "ec2:StartInstances",
      "ec2:StopInstances",
      "ec2:RebootInstances",
      "ec2:DescribeInstances",

      "ec2:CreateTags",
      "ec2:DeleteTags",

    #   # Управління Elastic IP (якщо потрібне)
    #   "ec2:AllocateAddress",
    #   "ec2:ReleaseAddress",
    #   "ec2:AssociateAddress",
    #   "ec2:DisassociateAddress",

    #   # Управління EBS (якщо використовується)
    #   "ec2:AttachVolume",
    #   "ec2:DetachVolume",
    #   "ec2:DescribeVolumes",
    #   "ec2:CreateVolume",
    #   "ec2:DeleteVolume"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ec2" {
  name        = "ec2-instance-access-policy"
  description = "Allow user to manage EC2 instances."
  policy      = data.aws_iam_policy_document.ec2.json
}

resource "aws_iam_user_policy_attachment" "ec2" {
  user       = aws_iam_user.cd.name
  policy_arn = aws_iam_policy.ec2.arn
}

