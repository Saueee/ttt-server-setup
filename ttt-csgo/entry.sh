#!/bin/bash

mkdir -p "${STEAMAPPDIR}" || true

bash "${STEAMCMDDIR}/steamcmd.sh" +login anonymous \
				+force_install_dir "${STEAMAPPDIR}" \
				+app_update "${STEAMAPPID}" \
				+quit

if [ ! -f "${STEAMAPPDIR}/deletetoupdate.file" ]; then
        touch "${STEAMAPPDIR}/deletetoupdate.file"
	if [ ! -z "$METAMOD_VERSION" ]; then
		LATESTMM=$(wget -qO- https://mms.alliedmods.net/mmsdrop/"${METAMOD_VERSION}"/mmsource-latest-linux)
		wget -qO- https://mms.alliedmods.net/mmsdrop/"${METAMOD_VERSION}"/"${LATESTMM}" | tar xvzf - -C "${STEAMAPPDIR}/${STEAMAPP}"	
	fi

	if [ ! -z "$SOURCEMOD_VERSION" ]; then
		LATESTSM=$(wget -qO- https://sm.alliedmods.net/smdrop/"${SOURCEMOD_VERSION}"/sourcemod-latest-linux)
		wget -qO- https://sm.alliedmods.net/smdrop/"${SOURCEMOD_VERSION}"/"${LATESTSM}" | tar xvzf - -C "${STEAMAPPDIR}/${STEAMAPP}"
	fi

	if [ ! -z "$TTT_VERSION" ]; then
		wget "https://csgottt.com/downloads/TTT.Linux.latest.${TTT_VERSION}.zip"
		unzip -n TTT.Linux.latest."${TTT_VERSION}".zip
		cd build-linux
		cp -r * "${STEAMAPPDIR}/${STEAMAPP}"
		cd ..
		rm -r ./build-linux
		rm -r TTT.Linux.latest."${TTT_VERSION}".zip
		unzip ttt-config.zip
		cd ttt-config
		cp -r * "${STEAMAPPDIR}/${STEAMAPP}"
		cp "${STEAMAPPDIR}/${STEAMAPP}"/addons/sourcemod/plugins/disabled/mapchooser.smx \
			"${STEAMAPPDIR}/${STEAMAPP}"/addons/sourcemod/plugins/mapchooser.smx
		cp "${STEAMAPPDIR}/${STEAMAPP}"/addons/sourcemod/plugins/disabled/rockthevote.smx \
			"${STEAMAPPDIR}/${STEAMAPP}"/addons/sourcemod/plugins/rtv.smx
		cd ..
		rm -r ttt-config
	fi
fi

cd ${STEAMAPPDIR}

bash "${STEAMAPPDIR}/srcds_run" -game "${STEAMAPP}" -console -autoupdate \
			-steam_dir "${STEAMCMDDIR}" \
			-steamcmd_script "${HOMEDIR}/${STEAMAPP}_update.txt" \
			-usercon \
			+fps_max "${SRCDS_FPSMAX}" \
			-tickrate "${SRCDS_TICKRATE}" \
			-port "${SRCDS_PORT}" \
			+tv_port "${SRCDS_TV_PORT}" \
			+clientport "${SRCDS_CLIENT_PORT}" \
			-maxplayers_override "${SRCDS_MAXPLAYERS}" \
			+game_type "${SRCDS_GAMETYPE}" \
			+game_mode "${SRCDS_GAMEMODE}" \
			+sv_setsteamaccount "${SRCDS_TOKEN}" \
			+rcon_password "${SRCDS_RCONPW}" \
			+sv_password "${SRCDS_PW}" \
			+sv_region "${SRCDS_REGION}" \
			+net_public_adr "${SRCDS_NET_PUBLIC_ADDRESS}" \
			-ip "${SRCDS_IP}" \
			+host_workshop_collection "${SRCDS_HOST_WORKSHOP_COLLECTION}" \
			+workshop_start_map "${SRCDS_WORKSHOP_START_MAP}" \
			-authkey "${SRCDS_WORKSHOP_AUTHKEY}" \
			"${ADDITIONAL_ARGS}"
