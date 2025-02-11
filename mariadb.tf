resource "docker_container" "mariadb" {
  name     = "db"
  hostname = "db"
  image    = "mariadb:challenge"

  network_mode = "my_network"

  ports {
    internal = 3306
    external = 3306
    ip       = "0.0.0.0"
  }

  labels {
    label = "challenge"
    value = "second"
  }

  env = [
    "MYSQL_ROOT_PASSWORD=1234",
    "MYSQL_DATABASE=simple-website"
  ]

  volumes {
    container_path = "/var/lib/mysql"
    volume_name    = docker_volume.mariadb_volume.name
  }
}
