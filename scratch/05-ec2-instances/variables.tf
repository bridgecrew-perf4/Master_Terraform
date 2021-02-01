######################################################################################################################################
# NEVER STORE KEYS IN VARIABLES - POINT TO FILES ON YOUR COMPUTER
######################################################################################################################################

variable "public_key" {
  default = "~\\.ssh\\id_rsa.pub" # required file function after calling the variable 
}

variable "private_key" {
  default = "~\\.ssh\\id_rsa.pem" # required file function after calling the variable 
}

######################################################################################################################################
# NEVER STORE KEYS IN VARIABLES - POINT TO FILES ON YOUR COMPUTER
######################################################################################################################################
