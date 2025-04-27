fx_version "cerulean"
game "gta5"
lua54 "yes"
use_experimental_fxv2_oal "yes"
name "PrettyPacketAC"
author "PrettyPacket"
version "0.0.1"

shared_scripts {
    "config/*.lua",
}


client_scripts {
    "client/*.lua",
}

server_scripts {
    "server/*.lua",
}

dependency '/assetpacks'