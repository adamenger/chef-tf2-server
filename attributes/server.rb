###
# Server Config
# http://wiki.teamfortress.com/wiki/Dedicated_server_configuration#Example_Server.cfg_for_TF2_dedicated_server
# We're using a deep hash for key, value storage which we loop over in the server.cfg template
###

#==
# General settings
#==

# Hostname for your server
default['tf2-server']['server']['config']['hostname'] = "Motherboard Men :: Dustbowl"

# Overrides the max players reported to prospective clients
default['tf2-server']['server']['config']['sv_visiblemaxplayers'] = 24

# Maximum number of rounds to play before server changes maps
default['tf2-server']['server']['config']['mp_maxrounds'] = 3

# Set to lock per-frame time elapse
default['tf2-server']['server']['config']['host_framerate'] = 0

# Set the pause state of the server
default['tf2-server']['server']['config']['setpause'] = 0

# Control where the client gets content from 
# 0 = anywhere, 1 = anywhere listed in white list, 2 = steam official content only
default['tf2-server']['server']['config']['sv_pure'] = 1

# Is the server pausable, 0 or 1
default['tf2-server']['server']['config']['sv_pausable'] = 0

# Type of server 0=internet 1=lan
default['tf2-server']['server']['config']['sv_lan'] = 0

# Collect CPU usage stats
default['tf2-server']['server']['config']['sv_stats'] = 1

#==
# Contact & Region settings
#==

# The region of the world to report this server in.
# 1 is the world, 0 is USA east coast, 1 is USA west coast
# 2 south america, 3 europe, 4 asia, 5 australia, 6 middle east, 7 africa
default['tf2-server']['server']['config']['sv_region'] = 0

# Contact email for server sysop
default['tf2-server']['server']['config']['sv_contact'] = "you@domain.com"

#==
# RCON settings
#==

# Console password
default['tf2-server']['server']['config']['rcon_password'] = "Your_Rcon_Password"

# Number of minutes to ban users who fail rcon authentication
default['tf2-server']['server']['config']['sv_rcon_banpenalty'] = 1440

# Max number of times a user can fail rcon authentication before being banned
default['tf2-server']['server']['config']['sv_rcon_maxfailures'] = 5


#==
# Log Settings
#==

# Enables logging to file, console, and udp < on | off >.
default['tf2-server']['server']['config']['log'] = "on"

# Log server information to only one file.
default['tf2-server']['server']['config']['sv_log_onefile'] = 0

# Log server information in the log file.
default['tf2-server']['server']['config']['sv_logfile'] = 1

# Log server bans in the server logs.
default['tf2-server']['server']['config']['sv_logbans'] = 1

# Echo log information to the console.
default['tf2-server']['server']['config']['sv_logecho'] = 1

#==
# Rate Settings
#==

# Frame rate limiter
default['tf2-server']['server']['config']['fps_max'] = 600

# Min bandwidth rate allowed on server, 0 == unlimited
default['tf2-server']['server']['config']['sv_minrate'] = 0

# Max bandwidth rate allowed on server, 0 == unlimited
default['tf2-server']['server']['config']['sv_maxrate'] = 20000

# Minimum updates per second that the server will allow
default['tf2-server']['server']['config']['sv_minupdaterate'] = 10

# Maximum updates per second that the server will allow
default['tf2-server']['server']['config']['sv_maxupdaterate'] = 66

#==
# Download Settings
#==

# Allow clients to upload customizations files
default['tf2-server']['server']['config']['sv_allowupload'] = 1

# Allow clients to download files
default['tf2-server']['server']['config']['sv_allowdownload'] = 1

# Maximum allowed file size for uploading in MB
default['tf2-server']['server']['config']['net_maxfilesize'] = 15


#==
# Team Balancing
#==

# Enable team balancing
default['tf2-server']['server']['config']['mp_autoteambalance'] = 1

# Time after the teams become unbalanced to attempt to switch players.
default['tf2-server']['server']['config']['mp_autoteambalance_delay'] = 60

# Time after the teams become unbalanced to print a balance warning
default['tf2-server']['server']['config']['mp_autoteambalance_warning_delay'] = 30

# Teams are unbalanced when one team has this many more players than the other team. (0 disables check)
default['tf2-server']['server']['config']['mp_teams_unbalance_limit'] = 1


#==
# Round and Game Times
#==

# Enable timers to wait between rounds. WARNING: Setting this to 0 has been known to cause a bug with setup times lasting 5:20 (5 minutes 20 seconds) on some servers!
default['tf2-server']['server']['config']['mp_enableroundwaittime'] = 1

# Time after round win until round restarts
default['tf2-server']['server']['config']['mp_bonusroundtime'] = 8

# If non-zero, the current round will restart in the specified number of seconds
default['tf2-server']['server']['config']['mp_restartround'] = 0

# Enable sudden death
default['tf2-server']['server']['config']['mp_stalemate_enable'] = 1

# Timelimit (in seconds) of the stalemate round.
default['tf2-server']['server']['config']['mp_stalemate_timelimit'] = 300

# game time per map in minutes
default['tf2-server']['server']['config']['mp_timelimit'] = 35


#==
# Client CVARS
#==

# Restricts spectator modes for dead players
default['tf2-server']['server']['config']['mp_forcecamera'] = 0

# toggles whether the server allows spectator mode or not
default['tf2-server']['server']['config']['mp_allowspectators'] = 1

# toggles footstep sounds
default['tf2-server']['server']['config']['mp_footsteps'] = 1

# toggles game cheats
default['tf2-server']['server']['config']['sv_cheats'] = 0

# After this many seconds without a message from a client, the client is dropped
default['tf2-server']['server']['config']['sv_timeout'] = 900

# Maximum time a player is allowed to be idle (in minutes), made this and sv_timeout equal same time?
default['tf2-server']['server']['config']['mp_idlemaxtime'] = 15

# Deals with idle players 1=send to spectator 2=kick
default['tf2-server']['server']['config']['mp_idledealmethod'] = 2

# time (seconds) between decal sprays
default['tf2-server']['server']['config']['decalfrequency'] = 30


#==
# Communications
#==

# enable voice communications
default['tf2-server']['server']['config']['sv_voiceenable'] = 1

# Players can hear all other players, no team restrictions 0=off 1=on
default['tf2-server']['server']['config']['sv_alltalk'] = 0

# amount of time players can chat after the game is over
default['tf2-server']['server']['config']['mp_chattime'] = 10

# enable party mode
default['tf2-server']['server']['config']['tf_birthday'] = 0
