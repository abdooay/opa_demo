

package flagship.http.api.orders.invoice.count

default allow = false


# allow if the user is staff
allow {
	is_staff
}

# allow if the user owns the shipment
allow {
	is_the_owner_of_the_shipment
}

# allow if the user is the driver of the shipment
allow {
	is_the_driver_of_the_shipment
}




is_the_driver_of_the_shipment {
	some i
	data.Shipments[i].id == input.request.shipment_id
	data.Shipments[i].driver_id == input.request.user.user_id
}

is_the_owner_of_the_shipment {
	some i
	data.Shipments[i].id == input.request.shipment_id
	data.Shipments[i].user_id == input.request.user.user_id
}


is_staff {
	data.Users[input.request.user.user_id].is_staff
}