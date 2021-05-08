job "http-echo" {
  datacenters = ["dc1"]

  group "echo" {
    count = 1
    task "server" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo"
        args = [
          "-listen",
          "0.0.0.0:8080",
          "-text",
          "hello world mother'day. ",
        ]
      }
      resources {
        network {
          mbits = 10
          port "http" {
          static = "8080"
          }
        }
      }
    }
  }
}
