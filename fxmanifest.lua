fx_version 'cerulean'
game 'gta5'

author 'Zombie Script'
description 'Complete FiveM Zombie Script with animations, sounds, loading screen and music control'
version '2.0.0'

ui_page 'html/index.html'

scripts {
  'client/client.lua',
  'client/loading.lua',
  'server/server.lua'
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
  '/server:7290',
  '/onesync'
}
