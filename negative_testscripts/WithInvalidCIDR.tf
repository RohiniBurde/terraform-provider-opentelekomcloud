
##TestCase3:  To verify reasource is created with missing required parameter.
resource "opentelekomcloud_vpc_v1" "vpc_1_testcase1" {
  name = "vpc_1_testcase1"
  cidr = "122.000.0.0/17"
}
resource "opentelekomcloud_vpc_v1" "vpc_2_testcase1" {
  name = "vpc_2_testcase1"
  cidr = "122.168.0.0/17"
}
resource "opentelekomcloud_vpc_peering_connection_v2" "peering_1_testcase1" {
  name = "peering_1_testcase1"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_1_testcase1.id}"
  peer_vpc_id = "${opentelekomcloud_vpc_v1.vpc_2_testcase1.id}"
}
resource "opentelekomcloud_vpc_route_v2" "route_1_testcase1" {
  type = "peering"
  nexthop = "${opentelekomcloud_vpc_peering_connection_v2.peering_1_testcase1.id}"
  destination = "192.168.0.0/17"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_2_testcase1.id}"

}
