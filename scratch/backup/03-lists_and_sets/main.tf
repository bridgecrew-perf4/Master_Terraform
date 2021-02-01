################################################################################################################################################
# create a users in AWS with a list of usernames 
################################################################################################################################################

# each name is known as an element 
variable "names" {
  default = ["Josh", "Darrell", "Ronny", "Kelly"]
}

resource "aws_iam_user" "my_iam_users" {
  count = length(var.names)
  name  = var.names[count.index]
}

# The problem is that if you add a username to the beginning of the list, this changes all usernames.
# this is because you're working with a list and lists have indexes.
# Alternatively you could use a for each loop 

################################################################################################################################################
#
################################################################################################################################################

resource "aws_iam_user" "my_iam_users" {
  for_each = toset(var.names)
  name = each.value 

}
