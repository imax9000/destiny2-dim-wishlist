def escape_name: gsub("[^0-9a-zA-Z_]"; "_");
.DestinyInventoryItemDefinition[]
| select(
	if .itemCategoryHashes then
		# Only non-dummy weapons
		((.itemCategoryHashes | any(. == 1)) and (.itemCategoryHashes | all(. != 3109687656)))
	else
		false
	end)
| select(
	if .sockets?.socketEntries? then
		# Only entries that have any randomized perks
		([.sockets.socketEntries[] | has("randomizedPlugSetHash")] | any)
	else
		false
	end)
| ("define(`" + (.displayProperties.name | escape_name) +"', `wishlist_entry(0, `" + (.hash | tostring) + "', $@)')")
