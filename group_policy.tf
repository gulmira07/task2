resource "aws_iam_policy" "policy" {
  name        = "You_are_not_Admin_User"
  path        = "/"
  description = "A PowerUser policy"

  policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
 {
            "Effect": "Allow",
            "NotAction": [
                "iam:*",
                "organizations:*",
                "account:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:CreateServiceLinkedRole",
                "iam:DeleteServiceLinkedRole",
                "iam:ListRoles",
                "organizations:DescribeOrganization",
                "account:ListRegions"
            ],
            "Resource": "*"
        }
]
}
EOF
}

resource "aws_iam_group_policy_attachment" "attach" {
  group      = "${aws_iam_group.Infosec.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}
