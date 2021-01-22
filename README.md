# TTT-config

The goal of this project is to setup a working TTT Server as easy as possible.
The project sets up the csgo-ttt server,
a persistent mysql-db,
a fastdl server with optional Info page.

Requirements:
Install docker and docker-compose

Setup:
clone repository
Edit docker-compose.yml and change everything that is commented
Edit config files in ttt-config as you like
databases.cfg, admins_simple.ini and gamemode_casual_server.cfg MUST be edited!
Pack your ttt-config folder into a .zip archive named "ttt-config.zip"
Copy the archive into ./ttt-csgo/ and overwrite the example
Start Server with "docker-compose up"

Update:
To update the server (metamod, sourcemod, ttt, ttt-config)
Copy yourt new ttt-config.zip to ./ttt-csgo/
Delete the file "deletetoupdate.file" in ./ttt-csgo/csgo-dedicated/
Start server with "docker-compose up --build"
