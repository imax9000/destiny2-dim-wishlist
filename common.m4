define(`d', `define($@)dnl')dnl
include(`perks.m4')dnl
include(`weapons.m4')dnl
d(`wishlist_entry', ``dimwishlist:item='$1`&perks='shift($@)')
