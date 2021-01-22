# TTT-config

The goal of this project is to setup a working TTT Server as easy as possible.<br>
The project sets up the csgo-ttt server,<br>
a persistent mysql-db,<br>
a fastdl server with optional Info page.<br>
<br>
Requirements:<br>
Install docker and docker-compose<br>
<br>
Setup:<br>
clone repository<br>
Edit docker-compose.yml and change everything that is commented<br>
Edit config files in ttt-config as you like<br>
databases.cfg, admins_simple.ini and gamemode_casual_server.cfg MUST be edited!<br>
Pack your ttt-config folder into a .zip archive named "ttt-config.zip"<br>
Copy the archive into ./ttt-csgo/ and overwrite the example<br>
Start Server with "docker-compose up"<br>
<br>
Update:<br>
To update the server (metamod, sourcemod, ttt, ttt-config)<br>
Copy yourt new ttt-config.zip to ./ttt-csgo/<br>
Delete the file "deletetoupdate.file" in ./ttt-csgo/csgo-dedicated/<br>
Start server with "docker-compose up --build"<br>
