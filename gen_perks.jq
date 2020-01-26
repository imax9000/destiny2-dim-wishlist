def escape_name: gsub("[^0-9a-zA-Z_]"; "_");
.DestinyInventoryItemDefinition
| [.[] | select(if .itemCategoryHashes then (.itemCategoryHashes | any(. == 610365472)) else false end)] as $all
| ([$all[] | .displayProperties.name] | unique) as $names  # get a list of unique perk names
| ([$names[] | . as $name | {(.): ([$all[] | select(.displayProperties.name == $name)] | length)}] | add) as $counts  # get the numbers of perks with the same name
| $all[] | select($counts[.displayProperties.name] == 1)   # filter out non-unique perks
| ("define(`" + (.displayProperties.name | escape_name) + "', `" + (.hash | tostring) + "')")

