#!/usr/bin/env bash
# 簡單的 UT 聊天室訊息過濾器
# 林曉龍 <Hatsvasi.Lin.Taiwan@gmail.com> © 2017
declare -ir REFRESH_PERIOD_IN_SECOND=3

init(){
	declare filter_keystring=''
	while test -z "${filter_keystring}"; do
		read\
			-p '請輸入您要篩選的關鍵字串：'\
			filter_keystring
	done

	while true; do
		clear
		xclip\
			-selection CLIPBOARD\
			-out\
			| grep\
				"${filter_keystring}"
		sleep ${REFRESH_PERIOD_IN_SECOND}
	done

	unset filter_keystring
	exit 0
}
init