job "http-echo" {
  datacenters = ["dc1"]

  group "echo" {
    count = 5
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
          "hello world. IP: ${NOMAD_IP_http}, PORT: ${NOMAD_PORT_http}",
        ]
      }
      
      service {
        name ="http-echo"  
        port = "http"
        tags = ["http-echo-demo"]

        check {
          type     = "http"
          path     = "/health"
          interval = "2s"
          timeout  = "2s"
        }
      }
    }
  }
}
