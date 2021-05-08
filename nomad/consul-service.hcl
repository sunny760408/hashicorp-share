job "consul" {
  datacenters = ["dc1"]

  group "consul" {
    count = 1
    task "consul" {
      driver = "raw_exec"

      config {
        command = "consul"
        args = ["agent", "-dev", "-client", "0.0.0.0"]
      }
  
       artifact {
         source = "https://releases.hashicorp.com/consul/1.8.10/consul_1.8.10_linux_amd64.zip"
       }

    }

  }
}
