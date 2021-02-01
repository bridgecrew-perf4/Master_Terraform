
# variable "iam_user_name_prefix" {
#   type = string # any, number, bool, list, map, set, object, tuple - (default is any)
#   default = "my_iam_user"
# }

resource "aws_iam_user" "my_iam_users" {
  count = 2
  name  = "${var.environment}_user_${count.index}"
}

