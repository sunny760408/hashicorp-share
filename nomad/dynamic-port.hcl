job "http-echo" {
  datacenters = ["dc1"]

  group "echo" {
    count = 1
    network {
      port "http" {
      }
    }
    task "server" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo"
        args = [
          "-listen",
          ":${NOMAD_PORT_http}",
          "-text",
          "hello world. IP: ${NOMAD_IP_http}, PORT: ${NOMAD_PORT_http}",
        ]
      }
    }
  }
}
