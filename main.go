package main

import (
	"github.com/hashicorp/terraform/plugin"
	"github.com/RohiniBurde/terraform-provider-opentelekomcloud/opentelekomcloud"
)

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: opentelekomcloud.Provider})
}
