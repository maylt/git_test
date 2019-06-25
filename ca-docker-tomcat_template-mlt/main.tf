provider "docker" {
  version= "1.1.1"
  host = "http://10.243.41.201:4243"
}

resource "docker_container" "mlt-tomcat-test" {
  name  = "${random_string.random_name.result}-1"
  image = "dong91/automic_tomcat-01"
  entrypoint = ["/bin/sleep"]
  command = [ "1d" ]
   
  ports {
   internal = "22"
   external = "9001"
   protocol = "tcp"
  
  }
  
  ports {
   internal = "8080"
   external = "9000"
   protocol = "tcp"
  
  }
}

resource "random_string" "random_name" {
	length  = 5
	special = false
	lower   = false
}

