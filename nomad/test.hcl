  
job "http-echo" {
  datacenters = ["dc1"]

  group "echo" {
    count = 1
    network {
      mode = "bridge"
      port "http" {
        static = 8080
        to     = 8080
      }
    }
    task "server" {
      driver = "docker"

      config {
        image = "nginx:1.18-alpine"
        ports = ["http"]
      }
    }
  }
}
