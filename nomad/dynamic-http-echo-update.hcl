job "http-echo" {
  datacenters = ["dc1"]

  group "echo" {
    count = 5
    update {
    canary = 1  
    max_parallel = 5
    }
    network {
      port "http" {
      }
    }
    task "server" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo"
        ports = ["http"]
        args = [
          "-listen",
          ":${NOMAD_PORT_http}",
          "-text",
          "hello world update test. IP: ${NOMAD_IP_http}, PORT: ${NOMAD_PORT_http}",
        ]
      }
    }
  }
}
