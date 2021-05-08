job "http-echo" {
  datacenters = ["dc1"]

  group "echo" {
    count = 1
    task "server" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo:last"
        ports = ["http"]
        args = [
          "-listen",
          ":8080",
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
