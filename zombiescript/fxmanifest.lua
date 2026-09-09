fx_version 'cerulean'
game 'gta5'

author 'Zombie Script'
description 'Complete FiveM Zombie Script with AI, animations and sounds'
version '1.0.0'

scripts {
  'client/client.lua',
  'server/server.lua'
}

shared_scripts {
  'shared/config.lua'
}

dependencies {
  '/server:7290',
  '/onesync'
}
