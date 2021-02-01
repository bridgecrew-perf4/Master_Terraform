################################################################################################################################################
# create a map 
################################################################################################################################################

# lists use square brackets
# maps use curly braces 


variable "names" {
  default = {
    Josh:"Texas",
    Darrell: "Florida",
    Ronny:"Mexico",
    Kelly:"Colorado"
  }
}

# inside terraform console, run:
# var.names
# var.names.Josh
# keys(var.names)
# values(var.names)
# lookup(var.names,"Josh")

resource "aws_iam_user" "my_iam_users" {
  for_each = var.names
    name = each.key
    tags = {
      state: each.value
    }
  }

################################################################################################################################################

# you can create a map of maps 
# similar to python, you can have key-value pairs inside key-value pairs

################################################################################################################################################

variable "names" {
  default = {
    Josh: { state: "Texas", role: "Cloud DevOps" },
    Darrell: { state: "Florida", role: "Cloud Architect"  },
    Ronny: { state: "Mexico", role: "CEO" },
    Kelly: { state: "Texas", role: "Favorite wife" },
  }
}

resource "aws_iam_user" "my_iam_users" {
  for_each = var.names
    name = each.key
    tags = {
      state: each.value.state
      role: each.value.role
    }
  }


################################################################################################################################################
#
################################################################################################################################################
