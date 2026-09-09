fx_version 'cerulean'
game 'gta5'

author 'Zombie Loading Screen'
description 'Beautiful Loading Screen with Zombie Animation and Music Player'
version '1.0.0'

ui_page 'html/index.html'

scripts {
  'client/client.lua'
}

shared_scripts {
  'shared/config.lua'
}

files {
  'html/index.html',
  'html/style.css',
  'html/script.js'
}

dependencies {
  '/server:7290'
}
