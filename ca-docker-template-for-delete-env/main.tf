variable "docker_image" {
    default= "busybox:latest"	
}

provider "docker" {
  host = "http://10.243.41.201:4243"
}

resource "docker_container" "ca-sample" {
  name  = "${random_string.random_name.result}"
  image = "${var.docker_image}"
  entrypoint = ["/bin/sleep"]
  command = [ "1d" ]
}

resource "random_string" "random_name" {
	length  = 6
	special = false
	lower   = false
}
