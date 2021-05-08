job "http-echo" {
  datacenters = ["dc1"]

  group "echo" {
    count = 1
    network {
      port "http" {
      static = "8080"
      }
    }
    task "server" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo"
        ports = ["http"]
        args = [
          "-listen",
          ":8080",
          "-text",
          "hello mother's day. ",
        ]
      }
    }
  }
}
