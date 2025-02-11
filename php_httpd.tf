resource "docker_container" "php_httpd" {
  name     = "webserver"
  hostname = "php-httpd"
  image    = "php-httpd:challenge"

  network_mode = "my_network"

  ports {
    internal = 80
    external = 80
  }

  labels {
    label = "challenge"
    value = "second"
  }

  volumes {
    host_path      = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
    container_path = "/var/www/html"
  }
}
