# Configure the New Relic provider
provider "newrelic" {
  api_key       =  "NRAK-H5UEUYD42A81NL8EGYUPEQKVEQY"
  account_id    =  2690548
  region        =  "EU" 
}

# SCRIPTED BROWSER MONITOR CREATION
resource "newrelic_synthetics_monitor" "tf_scripted" {
  name = "My Github Actions Created Script"
  type = "SCRIPT_BROWSER"
  frequency = 1
  status = "ENABLED"
  locations = ["AWS_EU_WEST_1"]
}

data "template_file" "BrowserScript" {
  template = templatefile("${path.module}/script.tpl", {uri = "https://google.com"})
}

resource "newrelic_synthetics_monitor_script" "BrowserScript" {
  monitor_id = newrelic_synthetics_monitor.tf_scripted.id
  text = data.template_file.BrowserScript.rendered
}