# Configure the New Relic provider
provider "newrelic" {
  api_key       =  "NRAK-H5UEUYD42A81NL8EGYUPEQKVEQY"
  account_id    =  2690548
  region        =  "US" 
}

# SCRIPTED BROWSER MONITOR CREATION
resource "newrelic_synthetics_monitor" "tf_scripted" {
  name = "ex-asaf-barabi-new-terraform"
  type = "SCRIPT_API"
  frequency = 1
  status = "ENABLED"
  locations = ["2690548-ccp_prod-B1E"]
}

data "template_file" "BrowserScript" {
  template = templatefile("${path.module}/script.tpl", {uri = "https://google.com"})
}

resource "newrelic_synthetics_monitor_script" "BrowserScript" {
  monitor_id = newrelic_synthetics_monitor.tf_scripted.id
  text = data.template_file.BrowserScript.rendered
}