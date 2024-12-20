#!/usr/bin/bash

#set -x
#set -e
##############################################################################
#                      define functions here                                 #
##############################################################################
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=interface&relationship=contain&target_index=3&source_id=10.10.255.11&projections=* | jq
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=interface&relationship=contain&target_index=3&source_id=10.10.255.11&projections=*" | jq
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=interface&relationship=contain&target_index=*&source_id=10.10.255.11&projections=*" | jq
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=10.10.255.11&projections=*" | jq &> testme

#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=10.10.255.11&projections=*" | jq -r &> testme
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=10.10.255.11&projections=*" | jq &> testme
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources?type=device" |jq
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/model/types/resources?type=device" |jq
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/model/types/resources?type=device" | jq -r '.resourcetypes[].name'
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources?type=device" |jq
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources?type=device" |jq
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources?type=device" |jq &> testme
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources?type=device" |jq -r '.result[].id
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources?type=device" |jq -r '.result[].id'

# Check all pods running on a specific Node:
#oc get pods -A -o wide --field-selector spec.nodeName=worker1.openshift.dfw.accuoss.com

# Check resource usage of all worker nodes
# oc describe node worker0.openshift.dfw.accuoss.com | grep -A10 "Allocated resources" && oc describe node worker1.openshift.dfw.accuoss.com | grep -A10 "Allocated resources" && oc describe node worker2.openshift.dfw.accuoss.com | grep -A10 "Allocated resources"

# ns lookup to return only hostname    nslookup 10.10.255.10 | grep name | cut -d' ' -f3 | cut -d'.' -f1,2,3,4

# check to validate variable is an ip address
#if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
#  echo "success"
#else
#  echo "fail"
#fi

# get all devices in inventory 
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources?type=device" |jq -r '.result[].id' | sort

# get all properties for a specific device
#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources?type=device&id=10.10.255.11&projections=*" |jq

# get all  
#--------------------------------------------------------------------+
#color picker, usage: printf $bld$cur$red$bblu'hello world!'$def     |
#-------------------------+--------------------------------+---------+
#       text color        |       background color         |         |
#-----------+-------------+--------------+-----------------+         |
# base color|lighter shade| base color   | lighter shade   |         |
#-----------+-------------+--------------+-----------------+         |
blk='\e[30m'; blk='\e[90m'; bblk='\e[40m'; bblk='\e[100m' #| black   |
red='\e[31m'; red='\e[91m'; bred='\e[41m'; bred='\e[101m' #| red     |
grn='\e[32m'; grn='\e[92m'; bgrn='\e[42m'; bgrn='\e[102m' #| green   |
ylw='\e[33m'; ylw='\e[93m'; bylw='\e[43m'; bylw='\e[103m' #| yellow  |
blu='\e[34m'; blu='\e[94m'; bblu='\e[44m'; bblu='\e[104m' #| blue    |
mgn='\e[35m'; mgn='\e[95m'; bmgn='\e[45m'; bmgn='\e[105m' #| magenta |
cyn='\e[36m'; cyn='\e[96m'; bcyn='\e[46m'; bcyn='\e[106m' #| cyan    |
wht='\e[37m'; wht='\e[97m'; bwht='\e[47m'; bwht='\e[107m' #| white   |
#-------------------------{ effects }----------------------+---------+
def='\e[0m'   #default color and effects                             |
bld='\e[1m'   #bold\brighter                                         |
dim='\e[2m'   #dim\darker                                            |
cur='\e[3m'   #italic font                                           |
und='\e[4m'   #underline                                             |
inv='\e[7m'   #inverted                                              |
cof='\e[?25l' #cursor off                                            |
con='\e[?25h' #cursor on                                             |
#------------------------{ functions }-------------------------------+
# text positioning, usage: xy 10 10 'hello world!'                   |
xy(){ printf "\e[$2;${1}h$3"; }                                     #|
# print line, usage: line - 10 | line -= 20 | line 'hello world!' 20 |
line(){ printf -v _l %$2s; printf -- "${_l// /$1}"; }               #|
# create sequence like {0..(x-1)}, usage: que 10                     |
que(){ printf -v _n %$1s; _n=(${_n// / 1}); printf "${!_n[*]}"; }   #|
#--------------------------------------------------------------------+

#------------------------{ cursor disable\enable }-------------------------------------------------
cursor () {
    case $1 in
         on) stty  echo; printf "$con";;
        off) stty -echo; printf "$cof";;
    esac
}
#------------------------{ waiting animation }-----------------------------------------------------
#x=$[columns/2-3]
#y=$[  lines/2-3]
#sand=( ⠁  ⠂  ⠄  ' ' )
#  {   small digits    }
#sd=(₀ ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉)
#bs='⠴⠷⠦' # bottom sand pile
#ts='⠖'    #  top  sand pile
#wait(){
#clear; cursor off; i=0; start=$seconds
#xy $[x-1]  $y    $und$bld$red'       '$def                     # _______
#xy $[x-1] $[y+1]         $red'╲'$dim$und'     '$def$red'╱'$def # ╲_____╱
#xy  $x    $[y+2]         $blu'(  '$bld$wht'•'$bld$blu')'$def   #  (  •)
#xy  $x    $[y+3]         $blu' ╲'$ylw"$ts"$bld$blu'╱'$def      #   ╲⠖╱
#xy  $x    $[y+4]         $blu" ╱$ylw${sand[$i]}$bld$blu╲"$def  #   ╱⠂╲
#xy  $x    $[y+5]         $blu'('$ylw"$bs"$bld$blu')'$def       #  (⠴⠷⠦)
#xy $[x-1] $[y+6]         $red'╱'$red'‾‾‾‾‾'$bld$red'╲'$def     # ╱‾‾‾‾‾╲
#xy $[x-1] $[y+7]     $dim$red'‾‾‾‾‾‾‾'$def                     # ‾‾‾‾‾‾‾
#( while true; do sleep 0.07
#	printf -v counter "%03d" $[seconds-start]
#	small="${sd[${counter:0:1}]}${sd[${counter:1:1}]}${sd[${counter:2:1}]}"
#	xy $[x-1] $[y+1] $red'╲'$dim$und" $small "$def$red'╱'$def
#	xy  $x    $[y+4] $blu" ╱$ylw${sand[$i]}$bld$blu╲"$def
#	((i++)); (($i==${#sand[@]})) && i=0;
#	done ) & waiter=$!
#}
#go() { [[ -e /proc/$waiter ]] && kill $waiter; cursor on; clear; }
wait(){
	clear; cursor off; i=0; start=$seconds
	( while true; do sleep 1.0
       	printf "please wait while we are crunching the numbers......\n"
#       small="${sd[${counter:0:1}]}${sd[${counter:1:1}]}${sd[${counter:2:1}]}"
#       xy $[x-1] $[y+1] $red'╲'$dim$und" $small "$def$red'╱'$def
#       xy  $x    $[y+4] $blu" ╱$ylw${sand[$i]}$bld$blu╲"$def
#       ((i++)); (($i==${#sand[@]})) && i=0;
	done ) & waiter=$!
}
go() { [[ -e /proc/$waiter ]] && kill $waiter; cursor on; clear; }


resourcemanagement()
{
	snmp-resource-counts()
	{
		###### which lab cluster do you want to choose - openshift or openshift2 #######################################################

		if [[ -z "$tmpenv" ]]
		then
			tmpenv=$(mktemp -t checklist.XXXXXXXXX)
			trap 'rm -f "$tmpenv"' exit
			trap 'exit 127' hup stop term
			dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "environment/lab/cluster selection" --clear --radiolist "select which openshift environment you want to perfom this task on." 0 0 0 "openshift" "lab1 environment" off "openshift2" "lab2 environment" off 2> "$tmpenv"
			retval=$?
			input=$(cat "$tmpenv")
			case $retval in
				0)      tmpenv=$(echo "$input")
					echo "$tmpenv" > tmpenv
					;;
				1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so will return to menu.')" 5 100
					return
					;;
				255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
					return
					;;
			esac

			tmpenv=${tmpenv,,}    # tolower
		else
			echo "tempenv variable is already defined"
		fi

		##### will get security cookie ##### 
		curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

	        # curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources" | jq &> allresources3.json
		wait; curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources" | jq &> allresources3.json;go

		##### remove the ems device ip for canoga #####
		sed -i '/canogadevice/d' allresources3.json

		##### remove all canoga resources since they are file collected resources
		sed -i '/service/d' allresources3.json

		##### get all unique resource types from allresources3.json for count headers #####	
		cat allresources3.json | grep -e ^.*_[AAaa-ZZzz].* | cut -d'_' -f2 | cut -d':' -f1 | sort | uniq &> resourcetypes

		cat allresources3.json | jq -r '.. | select(type == "object" and has("id")).id' | grep -v "_" | grep -e ^[0-9].* &> devicecount
		##### get count of just resources (not devices) 
		cat allresources3.json | jq -r '.. | select(type == "object" and has("id")).id' | grep "_" | grep -v service | grep -e ^[0-9].* &> resourcecount
		
		##### get count of all id's in allresources3.json
		cat allresources3.json | jq -r '.. | select(type == "object" and has("id")).id' | grep -e ^[0-9].* | grep -v service &> totalresourcecount

		devicecount=$(cat devicecount | wc -l)
		totalcount=$(cat totalresourcecount | wc -l)
		resourcecount=$(cat resourcecount | wc -l)
		>mycounts

		echo "devices:	$devicecount" >> mycounts	
		echo " " >> mycounts
		echo "resources:	$resourcecount" >> mycounts 
		echo " " >> mycounts
		echo " " >> mycounts
		echo "resources by type:" >> mycounts
		echo " " >> mycounts

		while read line	
		do 
			rtcount=$(cat resourcecount | grep $line | wc -l)
			echo "$line:	$rtcount" >> mycounts
		done < resourcetypes

		##### column command to align the columns in file #####
		column -t -s $'\t' mycounts &> formatfixed 

		##### inserts lines before and after matching patterns and then removes double quotes ##### 
		cat formatfixed | sed '/devices/i ""' | sed '/type/i ""' | sed '/type/a ""' | sed 's/"//g' &> finalformat

		##### show dialog window with counts #####
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "snmp resource counts for $tmpenv environment" --textbox finalformat 20 70

		##### cleanup and return to menu #####
		unset tmpenv getfiles devicecount totalcount resourcecount rsourcename rtcount 
		#rm -f tmpenv allresources3.json devicecount resourcecount totalresourcecount mycounts resourcetypes formatfixed finalformat 
		return
	}
	inventory-resources()
	{
		if [[ -z "$tmptask" ]]
		then
			tmptask=$(mktemp -t checklist.XXXXXXXXX)
			trap 'rm -f "$tmptask"' exit
			trap 'exit 127' hup stop term
			dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "task selection" --clear --radiolist "select the task to perform on tncmp." 0 80 0 "view" "view resources" off "delete" "delete resources" off "create" "create resources" off "update" "update resources" off 2> "$tmptask"
			retval=$?
			input=$(cat "$tmptask")
			case $retval in
				0)      tmptask=$(echo "$input")
					echo "$tmptask" > tmptask
					;;
				1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so will return to menu.')" 5 100
                                        return
					;;
				255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
                                        return
                                        ;;
			esac

			tmptask=${tmptask,,}    # tolower
		else
			echo "temptask variable is already defined"
		fi


		if [[ -z "$taskdetail" ]]
		then
			taskdetail=$(mktemp -t checklist.XXXXXXXXX)
			trap 'rm -f "$taskdetail"' exit
			trap 'exit 127' hup stop term
			dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "specify subtask" --clear --radiolist "what do you want to $tmptask ." 0 80 0 "all" "all resources" off "bydevice" "select resources by device(s)" off "bytype" "select resources by type" off 2> "$taskdetail"
			 
			retval=$?
			input=$(cat "$taskdetail")
			case $retval in
				0)      taskdetail=$(echo "$input")
					echo "$taskdetail" > taskdetail
					;;
				1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so will return to menu.')" 5 100
					return
					;;
				255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
					return
					;;
			esac

			taskdetail=${taskdetail,,}    # tolower
		else
			echo "temptask variable is already defined"
		fi



		###### which lab cluster do you want to choose - openshift or openshift2 #######################################################

		if [[ -z "$tmpenv" ]]
		then
			tmpenv=$(mktemp -t checklist.XXXXXXXXX)
			trap 'rm -f "$tmpenv"' exit
			trap 'exit 127' hup stop term
			dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "environment/lab/cluster selection" --clear --radiolist "select which openshift environment you want to perfom this task on." 0 0 0 "openshift" "lab1 environment" off "openshift2" "lab2 environment" off 2> "$tmpenv"
			retval=$?
			input=$(cat "$tmpenv")
			case $retval in
				0)      tmpenv=$(echo "$input")
					echo "$tmpenv" > tmpenv
					;;
				1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so will return to menu.')" 5 100
                                        return
					;;
				255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
					return
					;;
			esac

			tmpenv=${tmpenv,,}    # tolower
		else
			echo "tempenv variable is already defined"
		fi

		##### check if $taskdetail is all, bydevice or bytype #####


		if [[ "$taskdetail" == 'all' ]]
		then
			
			if [[ "$tmptask" == 'view' ]]
			then

				##### create cookie #####
				curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

				##### get all resources to be viewed #####
                                curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources" | jq &> allresources.json

				##### view the json file before executing the delete #####
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing all resources for $tmpenv" --textbox allresources.json 80 100

			elif [[ "$tmptask" == 'delete' ]]
			then
				##### create cookie #####
                                curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

                                ##### get all resources to be deleted #####
				curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources" | jq &> allresources.json

				##### ask user if they want to see the json file before executing the delete #####
				dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --defaultno --yesno "would you like to view the json payload file before executing the delete?" 8 100
				retval=$?
				case $retval in
					0)      ##### change result to resourcesand remove line with totalrecords in the exported file #####
						sed -i '/totalrecords/d' allresources.json
						sed -i 's/result/resources/' allresources.json 

						##### view the json file before executing the delete #####
						dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing json payload file for deleting all resources" --textbox allresources.json 80 100

						##### double check before deleting devices #####
						dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --defaultno --yesno "this will delete all resources in $tmpenv...are you sure?" 8 100
						retval=$?
						case $retval in
							0)	##### delete all resources #####
								curl -s  -v -k --cookie mycookie -X DELETE -H "Content-Type: application/json" -d @allresources.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/delete"
								dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "delete confirmation." --msgbox "$(echo "all resources for $tmpenv have been deleted.")" 5 90
								;;
							1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no was pressed." --msgbox "$(echo 'no was pressed so will continue to next item or return to menu.')" 5 100
								continue
								;;
							255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
								return
								;;
						esac
						;;
					1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no was pressed." --msgbox "$(echo 'no was pressed so will continue with the deletion.')" 5 100
						##### change result to resourcesand remove line with totalrecords in the exported file #####
                                                sed -i '/totalrecords/d' allresources.json
                                                sed -i 's/result/resources/' allresources.json

						##### double check before deleting devices #####
						dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --defaultno --yesno "this will delete all resources in $tmpenv...are you sure?" 8 100
						retval=$?
						case $retval in
							0)      ##### delete all resources #####
								curl -s  -v -k --cookie mycookie -X DELETE -H "Content-Type: application/json" -d @allresources.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/delete"
								dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "delete confirmation." --msgbox "$(echo "all resources for $tmpenv have been deleted.")" 5 90
								;;
							1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no was pressed." --msgbox "$(echo 'no was pressed so you will be returned to menu.')" 5 100
								return 
								;;
							255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
								unset tmpenv tmptask rtargets mtask devices myrids rselect taskdetail myartypes rtypes myrtypes
								rm -f tmpenv tmptask selectedtargets mtask rtargets myselectedtargets selectedtargets.json relation_targets selectedsources rsources myselectedsources selectedsource.json relation_sources taskdetail selecteddevices rselect myselecteddevices devices rids myrids myselectedrids selectedrids device_export allresources.json myartypes myselectedartypes selectedartypes *.resexport.json ids_to_be_deleted artypes byrtype.json retval_tmpenv rtypes myrtypes myselectedrtypes selectedrtypes device_export2 stype.json targettype targetindex
								return
								;;
						esac

						;;
					255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
						unset tmpenv tmptask rtargets mtask devices myrids rselect taskdetail myartypes rtypes myrtypes
						rm -f tmpenv tmptask selectedtargets mtask rtargets myselectedtargets selectedtargets.json relation_targets selectedsources rsources myselectedsources selectedsource.json relation_sources taskdetail selecteddevices rselect myselecteddevices devices rids myrids myselectedrids selectedrids device_export allresources.json myartypes myselectedartypes selectedartypes *.resexport.json ids_to_be_deleted artypes byrtype.json retval_tmpenv rtypes myrtypes myselectedrtypes selectedrtypes device_export2 stype.json targettype targetindex
						return
						;;
				esac

			else
                                echo "variable tmptask has no value, returning to menu"
			fi
			unset tmpenv tmptask rtargets mtask devices myrids rselect taskdetail myartypes rtypes myrtypes
			rm -f tmpenv tmptask selectedtargets mtask rtargets myselectedtargets selectedtargets.json relation_targets selectedsources rsources myselectedsources selectedsource.json relation_sources taskdetail selecteddevices rselect myselecteddevices devices rids myrids myselectedrids selectedrids device_export allresources.json myartypes myselectedartypes selectedartypes *.resexport.json ids_to_be_deleted artypes byrtype.json retval_tmpenv rtypes myrtypes myselectedrtypes selectedrtypes device_export2 stype.json targettype targetindex
			rm -f allresources3.json resourcetypes devicecount resourcecount totalresourcecount mycounts formatfixed finalformat tmptask taskdetail tmpenv device_export devices myselecteddevices selecteddevices menuchoice*
                        return

		elif [[ "$taskdetail" == 'bytype' ]]
		then
			##### what type of resources do you want to look at? run query below into file and read file into radiobox ######################################################
			#if [[ -z "$tmprtype" ]]
                        #then
			##### create cookie #####
			curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

			##### get resourcetypes #####
			curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/model/types/resources?type=device" | jq -r '.resourcetypes[].name' &> resourcetypes

			##### another way to get all resourcetypes #####
			curl -s -k --cookie mycookie https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/insight/service/dataset/resourcetypes | jq -r .[].resourcetype
			cat resourcetypes | tr "\n" "," &> rtypes
			sed -i 's/,$//' rtypes
			rtypes=$(cat rtypes)

			MENU_OPTIONS=
			COUNT=0

			IFS="," read -a MYTYPES <<< $rtypes
			for i in "${MYTYPES[@]}"
			do
				COUNT=$[COUNT+1]
				MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
			done
				cmd=(dialog --separate-output --checklist "select all resource types you would like to $tmptask :" 40 60 0)
				options=(${MENU_OPTIONS})
				choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
				>myselectedrtypes
				echo "$choices" >> myselectedrtypes
				cat myselectedrtypes | tr "," "\n" &> selectedrtypes
						
			if [[ "$tmptask" == 'view' ]]
			then

				##### create cookie #####
				curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

				##### view selected devices #####
				while read line
				do

					curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources?type=$line" | jq -r | sed 's/\"//g' | sed 's/ //g' | sed 's/{//g' | sed 's/}//g' | sed 's/,//g' | sed 's/\[//g' | sed 's/\]//g' | sed 's/id://' | sed '/tenant/d' | sed '/result/d' | sed '/total/d' | sed '/type/d' | sed '/resources/d' | sed '/./!d' | sort &> device_export
					if [[ "$line" == "device" ]]
					then
						sed -i '1i\\' device_export
						>device_export2
						while read lime
						do
							if [[ "$lime" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]
							then
								nslookup $lime | grep name | cut -d' ' -f3 | cut -d'.' -f1,2,3,4 >> device_export2
							else
								echo "$lime" >> device_export2
							fi
						done < device_export

						##### list all devices #####
						dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing device_export2 selected resources by type $line" --msgbox "$(cat device_export2)" 0 0

					else
						##### list all devices #####
						dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing selected resources by type $line" --textbox device_export 80 100
					fi
				done < selectedrtypes
				unset tmpenv tmptask rselect taskdetail rtypes myrtypes
				rm -f tmpenv tmptask taskdetail rselect device_export retval_tmpenv rtypes myrtypes myselectedrtypes selectedrtypes device_export2
				rm -f allresources3.json resourcetypes devicecount resourcecount totalresourcecount mycounts formatfixed finalformat tmptask taskdetail tmpenv device_export devices myselecteddevices selecteddevices menuchoice*
				return

			elif [[ "$tmptask" == 'delete' ]]
			then
				##### create cookie #####
				curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

				##### get resources selected to be deleted #####
				while read line
				do
					##### get each selected resource type to be deleted#####
					curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=$line&relationship=contain&target_index=*&source_id=*&projections=index" | jq &> $line.resexport.json

					##### list all devices that will be deleted #####
					cat $line.resexport.json|grep id | cut -d'"' -f4 | sort &> ids_to_be_deleted 

					##### list all resources #####
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "$line resources to be deleted" --textbox ids_to_be_deleted 80 100

					##### ask user if they want to see the json file before executing the delete #####
					dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --defaultno --yesno "would you like to view the json payload file before executing the delete?" 8 100
					retval=$?
					case $retval in
						0)      ##### change result to resourcesand remove line with totalrecords in the exported file #####
							sed -i '/totalrecords/d' $line.resexport.json
							sed -i 's/result/resources/' $line.resexport.json

							##### view the json file before executing the delete #####
							dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing json payload file for $line delete" --textbox $line.resexport.json 80 100

							##### double check before deleting devices #####
							dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --defaultno --yesno "this will delete all $line resources...are you sure?" 8 100
							retval=$?
							case $retval in
								0)      ##### change result to resourcesand remove line with totalrecords in the exported file #####
									sed -i '/totalrecords/d' $line.resexport.json
									sed -i 's/result/resources/' $line.resexport.json

									##### delete all resources belonging to selected resource type #####
									curl -s  -v -k --cookie mycookie -X DELETE -H "Content-Type: application/json" -d @$line_res_export.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/delete"
									dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "delete confirmation." --msgbox "$(echo 'resources for type $line have been deleted.')" 5 90
									continue
									;;
								1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no was pressed." --msgbox "$(echo 'no was pressed so will continue to next item or return to menu.')" 5 100
									continue
									;;
								255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
									#return
									;;
							esac
							;;
						1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no was pressed." --msgbox "$(echo 'no was pressed so will continue to next item or return to menu.')" 5 100
							continue
							;;
						255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
							#return
							;;
					esac

				done < selectedrtypes
				unset tmpenv tmptask rtargets mtask devices myrids rselect taskdetail myartypes rtypes myrtypes
				rm -f tmpenv tmptask selectedtargets mtask rtargets myselectedtargets selectedtargets.json relation_targets selectedsources rsources myselectedsources selectedsource.json relation_sources taskdetail selecteddevices rselect myselecteddevices devices rids myrids myselectedrids selectedrids device_export allresources.json myartypes myselectedartypes selectedartypes *.resexport.json ids_to_be_deleted artypes byrtype.json retval_tmpenv rtypes myrtypes myselectedrtypes selectedrtypes device_export2 stype.json targettype targetindex
				return

			elif [[ "$tmptask" == 'create' ]] || [[ "$tmptask" == 'update' ]]
			then
				##### create cookie #####
				curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

				##### get all devices #####
				curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources?type=device" | jq . &> device_export.json

				##### list all devices that will be deleted #####
				cat device_export.json | jq -r | sed 's/\"//g' | sed 's/ //g' | sed 's/{//g' | sed 's/}//g' | sed 's/,//g' | sed 's/\[//g' | sed 's/\]//g' | sed 's/id://' | sed '/tenant/d' | sed '/result/d' | sed '/total/d' | sed '/type/d' | sed '/resources/d' | sed '/./!d' &> device_export_cleaned

				##### list all devices that will be deleted #####
				dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "devices to be deleted" --textbox device_export_cleaned 0 0

				##### double check before deleting devices #####
				dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --yesno "this will delete all resources listed...are you sure?" 8 100

				##### change result to resourcesand remove line with totalrecords in the exported file #####
				sed -i '/totalrecords/d' device_export.json
				sed -i 's/result/resources/' device_export.json

				##### delete all devices #####
				#curl -s  -v -k --cookie mycookie -X DELETE -H "Content-Type: application/json" -d @device_export.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/delete"
			else
                                echo "variable tmptask has no value, returning to menu"
			fi
			unset tmpenv tmptask rtargets mtask devices myrids rselect taskdetail myartypes rtypes myrtypes
			rm -f tmpenv tmptask selectedtargets mtask rtargets myselectedtargets selectedtargets.json relation_targets selectedsources rsources myselectedsources selectedsource.json relation_sources taskdetail selecteddevices rselect myselecteddevices devices rids myrids myselectedrids selectedrids device_export allresources.json myartypes myselectedartypes selectedartypes *.resexport.json ids_to_be_deleted artypes byrtype.json retval_tmpenv rtypes myrtypes myselectedrtypes selectedrtypes device_export2 stype.json targettype targetindex
                        return

		elif [[ "$taskdetail" == 'bydevice' ]]
		then
			##### create cookie #####
			curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

			##### get all devices #####
			curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources?type=device" | jq -r | sed 's/\"//g' | sed 's/ //g' | sed 's/{//g' | sed 's/}//g' | sed 's/,//g' | sed 's/\[//g' | sed 's/\]//g' | sed 's/id://' | sed '/tenant/d' | sed '/result/d' | sed '/total/d' | sed '/type/d' | sed '/resources/d' | sed '/./!d' | sort &> device_export

			# create checklist of devices for user to choose
			cat device_export | tr "\n" "," &> devices
			sed -i 's/,$//' devices
			devices=$(cat devices)

			MENU_OPTIONS=
			COUNT=0

			IFS="," read -a MYTYPES <<< $devices
			for i in "${MYTYPES[@]}"
			do
				COUNT=$[COUNT+1]
				MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
			done
				cmd=(dialog --separate-output --checklist "select the device(s) that you would like to view resources by:" 40 60 0)
				options=(${MENU_OPTIONS})
				choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
				>myselecteddevices
				echo "$choices" >> myselecteddevices
				cat myselecteddevices | tr "," "\n" &> selecteddevices
				#selecteddevices=$(cat selecteddevices)

			if [[ "$tmptask" == 'view' ]]
			then
				while read line
				do

					if [[ -z "$rselect" ]]
					then
						rselect=$(mktemp -t checklist.XXXXXXXXX)
						trap 'rm -f "$rselect"' exit
						trap 'exit 127' hup stop term
						dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "resource selection" --clear --radiolist "which resources did you want to view for device $line ?" 0 80 0 "all" "all resources" off "selecttype" "view all by resource type" off "selectspecific" "select a specific resource to view" off 2> "$rselect"

						retval=$?
						input=$(cat "$rselect")
						case $retval in
							0)      rselect=$(echo "$input")
								echo "$rselect" > rselect
								;;
							1)      echo "cancel was pressed so script will exit."
								exit
								;;
						esac

						rselect=${rselect,,}    # tolower
					else
						echo "rselect variable is already defined"
					fi


					if [[ "$rselect" == 'all' ]]
					then
						# get all properties for a specific device
						curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=$line&projections=*" | jq &> allresources.json

						##### list all resources #####
						dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing all resources for device $line" --textbox allresources.json 80 100
                                		#return

					elif [[ "$rselect" == 'selecttype' ]]
					then
						curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=$line&projections=*" | jq -r '.[]' | grep "\[" | sed 's/://g' | sed 's/"//g' | sed 's/ //g' | sed 's/\[//g' | sed '1d' &> artypes		

						# create checklist of devices for user to choose
						cat artypes | tr "\n" "," &> myartypes 
						sed -i 's/,$//' myartypes
						myartypes=$(cat myartypes)

						MENU_OPTIONS=
						COUNT=0

						IFS="," read -a MYTYPES <<< $myartypes
						for i in "${MYTYPES[@]}"
						do
							COUNT=$[COUNT+1]
							MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
						done
						cmd=(dialog --separate-output --checklist "select the resource type(s) that you would like to view:" 40 60 0)
						options=(${MENU_OPTIONS})
						choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
						>myselectedartypes
						echo "$choices" >> myselectedartypes
						cat myselectedartypes | tr "," "\n" &> selectedartypes

						while read arline
						do
							curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=$arline&relationship=contain&target_index=*&source_id=$line&projections=*" | jq &> byrtype.json
							##### list all resources #####
                                                	dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing selected resource type for device $line" --textbox byrtype.json 80 100
								
						done < selectedartypes
						#return


					elif [[ "$rselect" == 'selectspecific' ]]
                                        then
						curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=$line&projections=*" | jq | sed '/records/d' &> testme && cat testme | jq -r '.. | select(type == "object" and has("id")).id' &> rids

						# create checklist of resource ids for user to choose
						cat rids | tr "\n" "," &> myrids
						sed -i 's/,$//' myrids
						myrids=$(cat myrids)

						MENU_OPTIONS=
						COUNT=0

						IFS="," read -a MYTYPES <<< $myrids
						for i in "${MYTYPES[@]}"
						do
							COUNT=$[COUNT+1]
							MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
						done
						cmd=(dialog --separate-output --checklist "select the specific resource id from $line that you would like to view:" 40 60 0)
						options=(${MENU_OPTIONS})
						choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
						>myselectedrids
						echo "$choices" >> myselectedrids
						cat myselectedrids | tr "," "\n" &> selectedrids
						sed -i 's/memorypool/memory/g' selectedrids
						sed -i 's/temperaturetestpoint/temperature/g' selectedrids
						sed -i 's/processorname/cpu/g' selectedrids
						sed -i 's/voltagetestpoint/powersupply/g' selectedrids


						while read rline
						do
							targettype=$(echo "$rline" | cut -d'_' -f2 | cut -d':' -f1)
							targetindex=$(echo "$rline" | cut -d'<' -f2 | cut -d'>' -f1)
							curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=$targettype&relationship=contain&target_index=$targetindex&source_id=$line&projections=*" | jq &> stype.json
							##### list all resources #####
							dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing selected specific resource from device $line" --textbox stype.json 80 100

						done < selectedrids

					else
                                        	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no matches" --msgbox "$(echo 'no matches were found so you will be returned to the menu')" 10 60
                                	fi
				done < selecteddevices
				unset tmpenv tmptask rtargets mtask devices myrids rselect taskdetail myartypes rtypes myrtypes
                                rm -f tmpenv tmptask selectedtargets mtask rtargets myselectedtargets selectedtargets.json relation_targets selectedsources rsources myselectedsources selectedsource.json relation_sources taskdetail selecteddevices rselect myselecteddevices devices rids myrids myselectedrids selectedrids device_export allresources.json myartypes myselectedartypes selectedartypes *.resexport.json ids_to_be_deleted artypes byrtype.json retval_tmpenv rtypes myrtypes myselectedrtypes selectedrtypes device_export2 stype.json targettype targetindex
				rm -f allresources3.json resourcetypes devicecount resourcecount totalresourcecount mycounts formatfixed finalformat tmptask taskdetail tmpenv device_export devices myselecteddevices selecteddevices menuchoice*
				return

			elif [[ "$tmptask" == 'delete' ]]
			then
				while read line
                                do

                                        if [[ -z "$rselect" ]]
                                        then
                                                rselect=$(mktemp -t checklist.XXXXXXXXX)
                                                trap 'rm -f "$rselect"' exit
                                                trap 'exit 127' hup stop term
                                                dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "resource selection" --clear --radiolist "what do you want to delete for device $line ?" 0 80 0 "all" "all resources" off "selecttype" "delete all of a selected resource type" off "selectspecific" "select a specific resource to delete" off 2> "$rselect"

                                                retval=$?
                                                input=$(cat "$rselect")
                                                case $retval in
                                                        0)      rselect=$(echo "$input")
                                                                echo "$rselect" > rselect
                                                                ;;
                                                        1)      echo "cancel was pressed so script will exit."
                                                                exit
                                                                ;;
                                                esac

                                                rselect=${rselect,,}    # tolower
                                        else
                                                echo "rselect variable is already defined"
                                        fi


                                        if [[ "$rselect" == 'all' ]]
                                        then
                                                # get all resources for a specific device
                                                curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=$line&projections=index" | jq &> allresources.json

                                                ##### list all resources #####
                                                #dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing all resources for device $line" --textbox allresources.json 80 100

						##### ask user if they want to see the json file before executing the delete #####
						dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --defaultno --yesno "would you like to view the json payload file before executing the delete?" 8 100
						retval=$?
						case $retval in
							0)      ##### change result to resourcesand remove line with totalrecords in the exported file #####
								sed -i '/totalrecords/d' allresources.json
								sed -i 's/result/resources/' allresources.json 

								##### view the json file before executing the delete #####
								dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing json payload file for $arline delete" --textbox allresources.json 80 100

								##### double check before deleting devices #####
								dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --defaultno --yesno "this will delete all resources for $line...are you sure?" 8 100
								retval=$?
								case $retval in
									0)      ##### change result to resourcesand remove line with totalrecords in the exported file #####
										sed -i '/totalrecords/d' allresources.json
										sed -i 's/result/resources/' allresources.json

										##### delete all resources belonging to selected resource type #####
										curl -s  -v -k --cookie mycookie -X DELETE -H "Content-Type: application/json" -d @allresources.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/delete"
										dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "delete confirmation." --msgbox "$(echo "resources for type $arline have been deleted.")" 5 90
										continue
										;;
									1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no was pressed." --msgbox "$(echo 'no was pressed so will continue to next item or return to menu.')" 5 100
										continue
										;;
									255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
										#return
										;;
								esac
								;;
							1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no was pressed." --msgbox "$(echo 'no was pressed so will continue to next item or return to menu.')" 5 100
								continue
								;;
							255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
								#return
								;;
						esac
						#return

                                        elif [[ "$rselect" == 'selecttype' ]]
                                        then
                                                curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=$line&projections=*" | jq -r '.[]' | grep "\[" | sed 's/://g' | sed 's/"//g' | sed 's/ //g' | sed 's/\[//g' | sed '1d' &> artypes

                                                # create checklist of devices for user to choose
                                                cat artypes | tr "\n" "," &> myartypes
                                                sed -i 's/,$//' myartypes
                                                myartypes=$(cat myartypes)
                                                
                                                MENU_OPTIONS=
                                                COUNT=0

                                                IFS="," read -a MYTYPES <<< $myartypes
                                                for i in "${MYTYPES[@]}"
                                                do
                                                        COUNT=$[COUNT+1]
                                                        MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
                                                done
                                                cmd=(dialog --separate-output --checklist "select the resource type(s) that you would like to delete:" 40 60 0)
                                                options=(${MENU_OPTIONS})
                                                choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                                                >myselectedartypes
                                                echo "$choices" >> myselectedartypes
                                                cat myselectedartypes | tr "," "\n" &> selectedartypes

						##### get resources selected to be deleted #####
						while read arline
						do
							##### get each selected resource type to be deleted#####
							curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=$arline&relationship=contain&target_index=*&source_id=$line&projections=index" | jq &> $arline.resexport.json

							##### list all devices that will be deleted #####
							cat $arline.resexport.json|grep id | cut -d'"' -f4 | sort &> ids_to_be_deleted

							##### list all resources #####
							dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "$line resources to be deleted" --textbox ids_to_be_deleted 80 100

							##### ask user if they want to see the json file before executing the delete #####
							dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --defaultno --yesno "would you like to view the json payload file before executing the delete?" 8 100
							retval=$?
							case $retval in
								0)      ##### change result to resourcesand remove line with totalrecords in the exported file #####
									sed -i '/totalrecords/d' $arline.resexport.json
									sed -i 's/result/resources/' $arline.resexport.json

									##### view the json file before executing the delete #####
									dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing json payload file for $arline delete" --textbox $arline.resexport.json 80 100

									##### double check before deleting devices #####
									dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --defaultno --yesno "this will delete all $arline resources...are you sure?" 8 100
									retval=$?
									case $retval in
										0)      ##### change result to resourcesand remove line with totalrecords in the exported file #####
											sed -i '/totalrecords/d' $arline.resexport.json
											sed -i 's/result/resources/' $arline.resexport.json

											##### delete all resources belonging to selected resource type #####
											curl -s  -v -k --cookie mycookie -X DELETE -H "Content-Type: application/json" -d @$arline.resexport.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/delete"
											dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "delete confirmation." --msgbox "$(echo "resources for type $arline have been deleted.")" 5 90
											continue
											;;
										1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no was pressed." --msgbox "$(echo 'no was pressed so will continue to next item or return to menu.')" 5 100
											continue
											;;
										255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
											return
											;;
									esac
									;;
								1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no was pressed." --msgbox "$(echo 'no was pressed so will continue to next item or return to menu.')" 5 100
									continue
									;;
								255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
									deletetempfiles
									return
									;;
							esac

						done < selectedartypes
						rm -f allresources3.json resourcetypes devicecount resourcecount totalresourcecount mycounts formatfixed finalformat tmptask taskdetail tmpenv device_export devices myselecteddevices selecteddevices menuchoice*
						#return


					elif [[ "$rselect" == 'selectspecific' ]]
					then
						curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=$line&projections=*" | jq | sed '/records/d' &> testme && cat testme | jq -r '.. | select(type == "object" and has("id")).id' &> rids

						# create checklist of resource ids for user to choose
						cat rids | tr "\n" "," &> myrids
						sed -i 's/,$//' myrids
						myrids=$(cat myrids)

						MENU_OPTIONS=
						COUNT=0

						IFS="," read -a MYTYPES <<< $myrids
						for i in "${MYTYPES[@]}"
						do
							COUNT=$[COUNT+1]
							MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
						done
						cmd=(dialog --separate-output --checklist "select the specific resource id from $line that you would like to delete:" 40 60 0)
						options=(${MENU_OPTIONS})
						choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
						>myselectedrids
						echo "$choices" >> myselectedrids
						cat myselectedrids | tr "," "\n" &> selectedrids
						sed -i 's/memorypool/memory/g' selectedrids
						sed -i 's/temperaturetestpoint/temperature/g' selectedrids
						sed -i 's/processorname/cpu/g' selectedrids
						sed -i 's/voltagetestpoint/powersupply/g' selectedrids


						while read rline
						do
							targettype=$(echo "$rline" | cut -d'_' -f2 | cut -d':' -f1)
							targetindex=$(echo "$rline" | cut -d'<' -f2 | cut -d'>' -f1)
							curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=$targettype&relationship=contain&target_index=$targetindex&source_id=$line&projections=*" | jq &> stype.json

							##### ask user if they want to see the json file before executing the delete #####
							dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --defaultno --yesno "would you like to view the json payload file before executing the delete?" 8 100
							retval=$?
							case $retval in
								0)      ##### change result to resourcesand remove line with totalrecords in the exported file #####
									sed -i '/totalrecords/d' stype.json
									sed -i 's/result/resources/' stype.json

									##### view the json file before executing the delete #####
									dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing json payload file for $rline delete" --textbox stype.json 80 100

									##### double check before deleting devices #####
									dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --defaultno --yesno "this will delete the $rline resource(s)...are you sure?" 8 100
									retval=$?
									case $retval in
										0)      ##### change result to resourcesand remove line with totalrecords in the exported file #####
											sed -i '/totalrecords/d' stype.json
											sed -i 's/result/resources/' stype.json

											
											##### delete all resources belonging to selected resource type #####
											#curl -s  -v -k --cookie mycookie -X DELETE -H "Content-Type: application/json" -d @stype.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/delete"
											dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "delete confirmation." --msgbox "$(echo "resource $rline has been deleted.")" 5 90
											continue
											;;
										1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no was pressed." --msgbox "$(echo 'no was pressed so will continue to next item or return to menu.')" 5 100
											continue
											;;
										255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
											return
											;;
									esac
									;;
								1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no was pressed." --msgbox "$(echo 'no was pressed so will continue to next item or return to menu.')" 5 100
									continue
									;;
								255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
									return
									;;
							esac

						done < selectedrids
						#return

					else
						dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no matches" --msgbox "$(echo 'no matches were found so you will be returned to the menu')" 10 60
						return
					fi
				done < selecteddevices
                                return

	#		elif [[ "$tmptask" == 'createbydevice' ]] || [[ "$tmptask" == 'updatebydevice' ]]
	#		then
				##### information on adding new properties when creating or updating resources #####
				# you will always need to add the new property to the appropriate model file for your resource, otherwise your property(s) will be ignored #
				# there are a few different ways to accomplish this. 
				# 1. create / update the manual file manually (not great for automation)
				# 2. use oc commands and scripting to offer up choices to the user to select (only works if the user is working with an existing resource type)
				# 3. use api calls (like the ones used in this script for "viewing model files" (only good if user is working with an existing resource type)
				# 
				# this tool will currently only work to create / update resources that have an existing resource type  
				#####################################################################################


				##### create cookie #####
	#			curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

				##### get all devices #####
	#			curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources?type=device" | jq . &> device_export.json

				##### list all devices that will be deleted #####
	#			cat device_export.json | jq -r | sed 's/\"//g' | sed 's/ //g' | sed 's/{//g' | sed 's/}//g' | sed 's/,//g' | sed 's/\[//g' | sed 's/\]//g' | sed 's/id://' | sed '/tenant/d' | sed '/result/d' | sed '/total/d' | sed '/type/d' | sed '/resources/d' | sed '/./!d' &> device_export_cleaned

				##### list all devices that will be deleted #####
	#			dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "devices to be deleted" --textbox device_export_cleaned 0 0

	#			##### double check before deleting devices #####
	#			dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --yesno "this will delete all resources listed...are you sure?" 8 100

				##### change result to resourcesand remove line with totalrecords in the exported file #####
	#			sed -i '/totalrecords/d' device_export.json
	#			sed -i 's/result/resources/' device_export.json

				##### delete all devices #####
				#curl -s  -v -k --cookie mycookie -X DELETE -H "Content-Type: application/json" -d @device_export.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/delete"

			else
				echo "variable tmptask has no value, returning to menu"
				return
			fi
		else
                                echo "variable tmptask has no value, returning to menu"
                                return
		fi
		return
		deletetempfiles
	}	
	inventory-relations()
	{
		if [[ -z "$mtask" ]]
		then
			mtask=$(mktemp -t checklist.XXXXXXXXX)
			trap 'rm -f "$mtask"' exit
			trap 'exit 127' hup stop term
			dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "task selection" --clear --radiolist "select relations task." 0 80 0 "view" "view resource relationships" off "create" "create resource relationship" off "delete" "delete resource relationship" off 2> "$mtask"
			retval=$?
			input=$(cat "$mtask")
			case $retval in
				0)      mtask=$(echo "$input")
					echo "$mtask" > mtask
					;;
				1)      echo "cancel was pressed so script will exit."
					exit
					;;
			esac

			mtask=${mtask,,}    # tolower
		else
			echo "temptask variable is already defined"
		fi

		tmpenv=openshift
		###### relations api only seems to work from the local environment #####
		#if [[ -z "$tmpenv" ]]
		#then
		#	tmpenv=$(mktemp -t checklist.XXXXXXXXX)
		#	trap 'rm -f "$tmpenv"' exit
		#	trap 'exit 127' hup stop term
		#	dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "environment/lab/cluster selection" --clear --radiolist "select which openshift environment you want to perfom this task on." 0 0 0 "openshift" "lab1 environment" off "openshift2" "lab2 environment" off 2> "$tmpenv"
		#	retval=$?
		#	input=$(cat "$tmpenv")
		#	case $retval in
		#		0)      tmpenv=$(echo "$input")
		#			echo "$tmpenv" > tmpenv
		#			;;
		#		1)      echo "cancel was pressed so script will exit."
		#			exit
		#			;;
		#	esac
#
#			tmpenv=${tmpenv,,}    # tolower
#		else
#			echo "tempenv variable is already defined"
#		fi

		##### check if mtask is view #####

		if [[ "$mtask" == 'view' ]]
		then

			dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "task selection" --clear --radiolist "select how to view relations." 0 80 0 "source" "view relations by source" off "target" "view relations by target" off 2> tmptask
			retval=$?
			input=$(cat "tmptask")
			case $retval in
				0)      tmptask=$(echo "$input")
					echo "$tmptask" > tmptask
					;;
				1)      echo "cancel was pressed so script will exit."
					#return	
					;;
			esac

			tmptask=${tmptask,,}    # tolower

			##### check if $tmptask is source or target #####
			if [[ "$tmptask" == 'source' ]]
			then
				curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
				curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/model/types/relations | jq -r | grep "source" | sort | uniq | cut -d'"' -f4 &> relation_sources
				sed -i '/^\s*$/d' relation_sources 
				
				# create checklist of devices for user to choose
				cat relation_sources | tr "\n" "," &> rsources
				sed -i 's/,$//' rsources
				rsources=$(cat rsources)

				MENU_OPTIONS=
				COUNT=0

				IFS="," read -a MYTYPES <<< $rsources
				for i in "${MYTYPES[@]}"
				do
					COUNT=$[COUNT+1]
					MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
				done
				cmd=(dialog --separate-output --checklist "select the relation source(s) that you would like to view targets for:" 40 60 0)
					options=(${MENU_OPTIONS})
					choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
					>myselectedsources
					echo "$choices" >> myselectedsources
					cat myselectedsources | tr "," "\n" &> selectedsources

				while read line
				do
					##### get targets for each relationship source selected #####
					curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/model/types/relations?source=$line" | jq &> selectedsource.json
					##### list targets for source relationship #####
					dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing relationship targets for selected source $line" --textbox selectedsource.json 80 100

				done < selectedsources

			elif [[ "$tmptask" == 'target' ]]
			then
				##### get all relation targets #####
				curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
				curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/model/types/relations | jq -r | grep target | sort | uniq | cut -d'"' -f4 &> relation_targets
				sed -i '/^\s*$/d' relation_targets

				# create checklist of relationship targets for user to choose
				cat relation_targets | tr "\n" "," &> rtargets
				sed -i 's/,$//' rtargets
				rtargets=$(cat rtargets)

				MENU_OPTIONS=
				COUNT=0

				IFS="," read -a MYTYPES <<< $rtargets
				for i in "${MYTYPES[@]}"
				do
					COUNT=$[COUNT+1]
					MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
				done
				cmd=(dialog --separate-output --checklist "select the relation target(s) that you would like to view sources for.:" 40 60 0)
					options=(${MENU_OPTIONS})
					choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
					>myselectedtargets
					echo "$choices" >> myselectedtargets
					cat myselectedtargets | tr "," "\n" &> selectedtargets

				while read line
				do
					##### get sources for each relationship target selected #####
					curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/model/types/relations?target=$line" | jq &> selectedtarget.json

					##### list relationship sources for selected targets #####
					dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing relationship sources for selected target $line" --textbox selectedtarget.json 80 100

				done < selectedtargets
			else
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no matches for variable tmptask" --msgbox "$(echo 'no matches were found so you will be returned to the menu')" 10 60
			fi
		##### check if mtask is create #####
		elif [[ "$mtask" == 'create' ]]
		then
			curl -s -k --cookie mycookie -x "POST" -h "content-type: application/json" -d @device_export.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/relations/create"

		##### check if mtask is delete #####
		elif [[ "$mtask" == 'delete' ]]
		then
			curl -s -k --cookie mycookie -X DELETE -H "Content-Type: application/json" -d @device_export.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/relations/delete"
		else
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no matches for variable tmptask" --msgbox "$(echo 'no matches were found so you will be returned to the menu')" 10 60
		fi
		unset tmpenv tmptask rtargets mtask devices myrids rselect taskdetail myartypes rtypes myrtypes
                rm -f menuchoices*
                rm -f tmpenv tmptask selectedtargets mtask rtargets myselectedtargets selectedtargets.json relation_targets selectedsources rsources myselectedsources selectedsource.json relation_sources taskdetail selecteddevices rselect myselecteddevices devices rids myrids myselectedrids selectedrids device_export allresources.json myartypes myselectedartypes selectedartypes *.resexport.json ids_to_be_deleted artypes byrtype.json retval_tmpenv rtypes myrtypes myselectedrtypes selectedrtypes device_export2 stype.json targettype targetindex
		return
        }
	deletetempfiles()
	{
		unset tmpenv tmptask rtargets mtask devices myrids rselect taskdetail myartypes rtypes myrtypes
    		rm -f *.$$
    		rm -f menuchoices*
		rm -f tmpenv tmptask selectedtargets mtask rtargets myselectedtargets selectedtargets.json relation_targets selectedsources rsources myselectedsources selectedsource.json relation_sources taskdetail selecteddevices rselect myselecteddevices devices rids myrids myselectedrids selectedrids device_export allresources.json myartypes myselectedartypes selectedartypes *.resexport.json ids_to_be_deleted artypes byrtype.json retval_tmpenv rtypes myrtypes myselectedrtypes selectedrtypes device_export2 stype.json targettype targetindex
		rm -f allresources3.json resourcetypes devicecount resourcecount totalresourcecount mycounts formatfixed finalformat tmptask taskdetail tmpenv device_export devices myselecteddevices selecteddevices menuchoice*
	}
	##############################################################################
	#                           main strats here                                 #
	##############################################################################
	trap 'deletetempfiles'  exit | exit    # calls deletetempfiles function on #exit

	while :
	do
		dialog --clear --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Resource Management Menu" --menu "use [up/down] key to select playbook to deploy" 0 0 0 \
		"SNMP-Resource-Dashboard" "simple dashboard to show snmp resource counts." \
		"Inventory-Resources" "retrieves the resource type instances list based in on the resource property value conditions from the cassandra database." \
		"Inventory-Relations" "retrieves relationship models that are defined for the resource types from cassandra database." \
		"Main Menu" "Go back to Main Menu." \
		"exit" "exit menu" 2> menuchoices2.$$

		retopt=$?
		choice=$(cat menuchoices2.$$)

		case $retopt in

			0) case $choice in
				"SNMP-Resource-Dashboard")      snmp-resource-counts ;;
				"Inventory-Resources")       inventory-resources ;;
				"Inventory-Relations")       inventory-relations;;
				"Main Menu")                 clear; return ;;
				"exit")                            clear; exit 0;;
			   esac 
			   ;;

			*)clear ; deletetempfiles ; exit ;;
		esac
	done
	deletetempfiles
}
groupmanagement()
{
#########################################################
# List all groups
# curl -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/groups

#########################
# List specific group
# curl -k --cookie cookie.txt https://<hostname>:<dashboard_port>/inventory/rest/topology/groups?groupName=<group definition name>

#########################
# Count
# curl -k --cookie cookie.txt https://<hostname>:<dashboard_port>/inventory/rest/topology/groups/count

#########################
# Create static group
# curl -k --cookie cookie.txt -X POST -H "Content-Type: application/json" -d @profile.json https://<hostname>:<dashboard_port>/inventory/rest/topology/groups

#########################
# Create a dynamic group (In active mode)
# curl -k --cookie cookie.txt -X POST -H "Content-Type: application/json" -d @profile.json https://<hostname>:<dashboard_port>/inventory/rest/topology/groups

#########################
# Create a dynamic group (In inactive mode)
# curl -k --cookie cookie.txt -X POST -H "Content-Type: application/json" -d @profile.json https://<hostname>:<dashboard_port>/inventory/rest/topology/groups

#########################
# Validate groups  - Validation request validates the group definition and returns group hierarchy build after the group creation. Validation does not create any grouping at the backend.
# curl -k --cookie cookie.txt -X POST -H "Content-Type: application/json" -d @profile.json https://<hostname>:<dashboard_port>/inventory/rest/topology/validate

#########################
# Update groups
# curl -k --cookie cookie.txt -X PUT -H "Content-Type: application/json" -d @profile.json https://<hostname>:<dashboard_port>/inventory/rest/topology/groups

#########################
# Delete groups
# curl -k --cookie cookie.txt -X DELETE -H "Content-Type: application/json" -d @profile.json https://<hostname>:<dashboard_port>/inventory/rest/topology/groups

#########################
# Activate group
# curl -k --cookie cookie.txt -X PUT -H "Content-Type: application/json" -d @profile.json https://<hostname>:<dashboard_port>/inventory/rest/topology/groups/inactivate

#########################
# Inactivate group
# curl -k --cookie cookie.txt -X PUT -H "Content-Type: application/json" -d @profile.json https://<hostname>:<dashboard_port>/inventory/rest/topology/groups/inactivate

#########################
# Import group - Helps to add group definitions in bulk.  Note: When dynamic group condition is too generic and more definitions are in import, group membership evaluation and group initialization 
# are heavy operations. It might have performance impact.
# curl -k --cookie cookie.txt -X POST -H "Content-Type: application/json" -d @profile.json https://<hostname>:<dashboard_port>/inventory/rest/topology/groups/import
nothing=nothing
return
}
metricmanagement()
{
#At least one or more of the following parameters must be provided as follows:
#entities
#parents
#entityNames
#parentNames
#searchByProperties
#entityResourceTypes

if [[ -z "$tmptask" ]]
then
	tmptask=$(mktemp -t checklist.XXXXXXXXX)
	trap 'rm -f "$tmptask"' exit
	trap 'exit 127' hup stop term
	dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "task selection" --clear --radiolist "select the task to perform on tncmp." 0 0 0 "viewtimeseries" "View timeseries metrics" off "viewsummary" "View Metric Summary" off "Viewsnmpmetrics" "View SNMP metric collections from snmp-collector logs" off 2> "$tmptask"
	retval=$?
	input=$(cat "$tmptask")
	case $retval in
		0)      tmptask=$(echo "$input")
			echo "$tmptask" > tmptask
			;;
		1)      echo "cancel was pressed so script will exit."
			exit
			;;
	esac

	tmptask=${tmptask,,}    # tolower
else
	echo "temptask variable is already defined"
fi


####### which lab cluster do you want to choose - openshift or openshift2 #######################################################

if [[ -z "$tmpenv" ]]
then
	tmpenv=$(mktemp -t checklist.XXXXXXXXX)
	trap 'rm -f "$tmpenv"' exit
	trap 'exit 127' hup stop term
	dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "environment/lab/cluster selection" --clear --radiolist "select which openshift environment you want to view metrics from." 0 0 0 "openshift" "lab1 environment" off "openshift2" "lab2 environment" off 2> "$tmpenv"
	retval=$?
	input=$(cat "$tmpenv")
	case $retval in
		0)      tmpenv=$(echo "$input")
			echo "$tmpenv" > tmpenv
			;;
		1)      echo "cancel was pressed so script will exit."
			exit
			;;
	esac

	tmpenv=${tmpenv,,}    # tolower
else
	echo "tempenv variable is already defined"
fi

###### what type of resources do you want metrics for ######################################################

#if [[ -z "$tmprtype" ]]
#then
#	##### create cookie #####
#	curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
#
#	##### get resourcetypes #####
#	curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/insight/service/dataset/resourceTypes" | jq -r | sed 's/\"//g' | sed 's/ //g' | sed 's/{//g' | sed 's/}//g' | sed 's/,//g' | sed 's/\[//g' | sed 's/\]//g' | sed 's/id://' | sed '/tenant/d' | sed '/result/d' | sed '/total/d' | sed '/type/d' | sed '/resources/d' | sed '/./!d' | sed 's/resourceType://g'| sort &> resourcetypes
#
#	rtypes=$(cat resourcetypes | tr "\n" ",")
#
#	MENU_OPTIONS=
#	COUNT=0
#
#	IFS="," read -a MYTYPES <<< $rtypes
#	for i in "${MYTYPES[@]}"
#	do
#		COUNT=$[COUNT+1]
#		MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
#	done
#	cmd=(dialog --separate-output --checklist "select resourcetype(s) you want to get metrics for:" 40 60 0)
#		options=(${MENU_OPTIONS})
#		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
#		>myselectedrtypes
#		echo "$choices" >> myselectedrtypes
#		cat myselectedrtypes | tr '\n' ',' &> selectedrtypes
#		sed -i 's/,$//' selectedrtypes
#	else
#		echo "no resourcetypes selected"
#	fi

###### view timeseries metrics ######################################################
#  
#
#
#
if [[ "$tmptask" == 'viewtimeseries' ]]
then

	##### create cookie #####
	curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

	##### view selected devices #####
	selectedrtypes=$(cat selectedrtypes)
	IFS="," read -a MYTARGETS <<< $selectedrtypes
	for i in "${MYTARGETS[@]}"
	do
		#curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/insight/service/dataset/metrics?resourcetype=$i"| jq .
		curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/insight/service/dataset/metrics?resourceType=$i"| jq -r | sed 's/\"//g' | sed 's/ //g' | sed 's/{//g' | sed 's/}//g' | sed 's/,//g' | sed 's/\[//g' | sed 's/\]//g' | sed 's/id://' | sed '/tenant/d' | sed '/result/d' | sed '/total/d' | sed '/scope:/d' | sed '/type/d' | sed '/resources/d' | sed '/./!d' | sort &> metric_export

		dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing metrics by selected resourceType $i" --textbox metric_export 40 120

		#curl -k --cookie mycookie 'https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/insight/service/dataset/metric/timeseries?entityNames=10.10.255.7_interface:%3C7%3E&metrics=MAX(Network.Outbound.Utilization.Percent)&time=last-day&metricDoubleValue=true' | jq
	done
	rm -f tmptask resourcetypes myselectedrtypes selectedrtypes metric_export menuchoices.3769768rm -f tmptask resourcetypes myselectedrtypes selectedrtypes metric_export menuchoices.3769768

###### delete metrics by resourcetype ######################################################
elif [[ "$tmptask" == 'viewsummary' ]]
then
	##### create cookie #####
curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

	##### get all devices #####
#        curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources?type=device" | jq . &> device_export.json

	##### list all devices that will be deleted #####
#        cat device_export.json | jq -r | sed 's/\"//g' | sed 's/ //g' | sed 's/{//g' | sed 's/}//g' | sed 's/,//g' | sed 's/\[//g' | sed 's/\]//g' | sed 's/id://' | sed '/tenant/d' | sed '/result/d' | sed '/total/d' | sed '/type/d' | sed '/resources/d' | sed '/./!d' &> device_export_cleaned

	##### list all devices that will be deleted #####
#        dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "devices to be deleted" --textbox device_export_cleaned 0 0

	##### double check before deleting devices #####
#        dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --yesno "this will delete all resources listed...are you sure?" 8 100

	##### change result to resourcesand remove line with totalrecords in the exported file #####
#        sed -i '/totalrecords/d' device_export.json
#        sed -i 's/result/resources/' device_export.json

	##### delete all devices #####
	#curl -s  -v -k --cookie mycookie -X DELETE -H "Content-Type: application/json" -d @device_export.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/delete"

elif [[ "$tmptask" == 'viewsnmpmetrics' ]]
then
	# use oc command to get snmp-collector log
	oc logs snmp-collector-0 &> collectorlog
	grep "Got result:" collectorlog &> collectresults

	if [[ -z "$summarysize" ]]
	then
		summarysize=$(mktemp -t checklist.XXXXXXXXX)
		trap 'rm -f "$summarysize"' exit
		trap 'exit 127' hup stop term
		dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Select Report Summary Size" --clear --radiolist "Select the report summary size." 0 0 0 "fullsummary" "Summary with most data" off "shortsummary" "Shortened Summary" off 2> "$summarysize"
		retval=$?
		input=$(cat "$summarysize")
		case $retval in
			0)      summarysize=$(echo "$input")
				echo "$summarysize" > summarysize
				;;
			1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so script will exit.')" 0 0
				return
				;;
			255)     dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 0 0
				return
				;;
		esac

		summarysize=${summarysize,,}    # tolower
	else
		echo "summarysize variable is already defined"
	fi

	if [[ "$summarysize" == "fullsummary" ]]
        then
		cat collectresults | cut -d' ' -f2,3,7,9,10,11,12,13- | sed 's/\[//g' | sed 's/\]//g' | sed 's/java.lang.Double//g' | sed 's/(/  (/g' &> fullsummary
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "SNMP Collector Metric Report" --textbox fullsummary 0 0
	elif [[ "$summarysize" == "shortsummary" ]]
        then
                cat collectresults | cut -d' ' -f2,3,7,9,10 | sed 's/\[//g' | sed 's/\]//g' | sed 's/java.lang.Double//g' | sed 's/(/  (/g'|cut -d' ' -f1,2,3,4 &> shortsummary 

                dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "SNMP Collector Metric Report" --textbox shortsummary 0 0
	else	
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "SNMP Collector Metric Report" --msgbox "$(echo 'No Metrics to show at the moment')" 0 0
	fi


else
	echo "variable tmptask has no value, returning to menu"
fi
rm -f tmpenv menu* 
unset retval retval_proftask input proftask retval_tmpenv input tmpenv
return
}
alarmmanagement()
{
if [[ -z "$tmpenv" ]]
then
        tmpenv=$(mktemp -t checklist.XXXXXXXXX)
        trap 'rm -f "$tmpenv"' exit
        trap 'exit 127' hup stop term
        dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "environment/lab/cluster selection" --radiolist "select which openshift environment you want to work with alarms on." 0 80 0 "openshift" "lab1 environment" off "openshift2" "lab2 environment" off 2> "$tmpenv"
        retval=$?
        echo "$retval" > retval_tmpenv
        retval_tmpenv=$(cat retval_tmpenv)
        input=$(cat "$tmpenv")
        case $retval_tmpenv in
		0)      tmpenv=$(echo "$input")
                        echo "$tmpenv" > tmpenv
                        tmpenv=${tmpenv,,}    # tolower
                        ;;
                1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so script will exit.')" 5 50
                        rm -f retval_tmpenv menu* tmpenv
                        unset retval retval_tmpenv input tmpenv
                        return
                        ;;
                255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 50
                        rm -f retval_tmpenv menu* tmpenv
                        unset retval retval_tmpenv input tmpenv
                        return
                        ;;
                *)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "unauthorized key was pressed." --msgbox "$(echo 'unauthorized key was pressed so you will be returned to menu.')" 5 60
                        rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
                        unset retval retval_proftask input proftask retval_tmpenv input tmpenv
                        return
                        ;;
        esac

        #tmpenv=${tmpenv,,}    # tolower
else
        dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp variable exists" --msgbox "$(echo 'tempenv variable is already defined')" 0 0
        rm -f tmpenv
        unset tmpenv
        return
fi

if [[ -z "$proftask" ]]
then
	proftask=$(mktemp -t checklist.XXXXXXXXX)
	trap 'rm -f "$proftask"' exit
	trap 'exit 127' hup stop term
	dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "task selection" --clear --radiolist "select the task for working with Alarms." 0 80 0 "list_alarm_rules" "List all alarm rules" off "create_alarm_rules" "Create alarm rules" off "delete_alarm_rules" "Delete alarm rules" off "recover_alarm_rule" "Recover a deleted alarm rule" off "update_alarm_rules" "Update alarm rules" off "import_alarm_rules" "Import alarm rules" off "enable_disable_alarm_rules" "Enable or Disable alarm rules" off "list_alarm_schedules" "List all alarm time schedules" off "create_alarm_schedules" "Create time schedules" off "delete_alarm_schedules" "Delete time schedules" off "update_alarm_schedules" "Update alarm time schedules" off "import_alarm_schedules" "Import time schedules" off "list_alarm_targets" "List all alarm targets" off "create_alarm_targets" "Create alarm targets" off "delete_alarm_targets" "Delete alarm targets" off "update_alarm_targets" "Update alarm targets" off "import_alarm_targets" "Import alarm targets" off "list_alarm_target_groups" "List all alarm target groups" off "create_alarm_target_groups" "Create alarm target groups" off "delete_alarm_target_groups" "Delete alarm target groups" off "update_alarm_target_groups" "Update alarm target groups" off "import_alarm_target_groups" "Import alarm target groups" off 2> "$proftask"
	retval=$?
	echo "$retval" > retval_proftask
	retval_proftask=$(cat retval_proftask)
	input=$(cat "$proftask")
	case $retval_proftask in
		0)      proftask=$(echo "$input")
			echo "$proftask" > proftask
			proftask=${proftask,,}    # tolower
			;;
		1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so script will exit.')" 5 50
			rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
			unset retval retval_proftask input proftask retval_tmpenv input tmpenv
			return
			;;
		255)     dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 50
			rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
			unset retval retval_proftask input proftask retval_tmpenv input tmpenv
			return
			;;
		*)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "unauthorized key was pressed." --msgbox "$(echo 'unauthorized key was pressed so you will be returned to menu.')" 5 60
			rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
			unset retval retval_proftask input proftask retval_tmpenv tmpenv
			return
			;;
	esac

else
	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp variable already exists" --msgbox "$(echo 'proftask variable is already defined')" 0 0
	rm -f proftask
	unset proftask
	return
fi

##### get cookie #####
curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

if [[ "$proftask" == 'list_alarm_rules' ]]
then

	curl -s -k --cookie mycookie2 "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/alarm/rule/list" | jq -r '.. | select(type == "object" and has("name")).name' &> alarm_rules
	#sed -i 's/ /_/g' threshnames

	# create checklist with names from all thresholds 
	cat alarm_rules | tr "\n" "," &> pretfiles 
	sed -i 's/,$//' prepfiles
	pretfiles=$(cat pretfiles)

	MENU_OPTIONS=
	COUNT=0

	IFS="," read -a MYTYPES <<< $pretfiles
	for i in "${MYTYPES[@]}"
	do
		COUNT=$[COUNT+1]
		MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
	done
	cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the alarm rule(s) would like to view:" 0 120 0)
	options=(${MENU_OPTIONS})
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	>myselectedtfiles
	echo "$choices" >> myselectedtfiles
	cat myselectedtfiles|tr "," "\n" &> selectedtfiles
	#selectedpfiles=$(cat selectedpfiles)
	while read line
	do
		curl -s -k --cookie mycookie2 "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/alarm/rule/list?name=$line" | jq &> alarm_rule.json
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Alarm rule for $line" --msgbox "$(cat alarm_rule.json | jq)" 0 0
	done < selectedtfiles

	rm -f retval_tmpenv tmpenv retval_proftask proftask threshnames pretfiles myselectedtfiles selectedtfiles alarm_rule.json
	unset proftask tmpenv pretfiles retval_tmpenv retval_proftask 
	rm -f menu*
	return

elif [[ "$proftask" == 'create_alarm_rules' ]]
then
        if [[ -z "$createtask" ]]
        then
                createtask=$(mktemp -t checklist.XXXXXXXXX)
                trap 'rm -f "$createtask"' exit
                trap 'exit 127' hup stop term
                dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "create task selection" --clear --radiolist "select how you want to create new alarm rule." 0 0 0 "copy existing" "select existing alarm rule to copy and edit" off "create from file" "create new alarm rule from json formated file" off 2> "$createtask"
                retval=$?
                input=$(cat "$createtask")
                case $retval in
                        0)      createtask=$(echo "$input")
                                echo "$createtask" > createtask
                                ;;
                        1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so script will exit.')" 0 0
                                return
                                ;;
                        255)     dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 0 0
                                return
                                ;;
                esac

                createtask=${createtask,,}    # tolower
        else
                echo "audtask variable is already defined"
        fi

        case $createtask in

                "copy existing")
                        ##### get cookie #####
                        curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

			##### get names of all alarm rules to display to user
			curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/alarm/rule/list" | jq -r '.. | select(type == "object" and has("name")).name' &> alarm_rules
                        ##### create checklist with names from all Alarm Rules #####
                        cat alarm_rules | tr "\n" "," &> pretfiles
                        sed -i 's/,$//' prepfiles
                        pretfiles=$(cat pretfiles)

                        MENU_OPTIONS=
                        COUNT=0

                        IFS="," read -a MYTYPES <<< $pretfiles
                        for i in "${MYTYPES[@]}"
                        do
                                COUNT=$[COUNT+1]
                                MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
                        done
                        cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the alarm rule(s) you would like to copy:" 0 120 0)
                        options=(${MENU_OPTIONS})
                        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                        >myselectedtfiles
                        echo "$choices" >> myselectedtfiles
                        cat myselectedtfiles|tr "," "\n" &> selectedtfiles
                        while read line
                        do

                                # get each selected threshold and save to a json file
				curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/alarm/rule/list?name=$line" | jq &> $line.json
#[
#  {
#    "category": 1,
#    "enabled": true,
#    "name": "omnibus_alarm_rule",
#    "target": "omnibus_target",
#    "target_group": ""
#  }
#]
				curl -s -k --cookie mycookie2 'https://dashboard-tncmp.apps.openshift2.dfw.accuoss.com/threshold/rest/alarm/target/list' | jq -r '.. | select(type == "object" and has("name")).name' &> alarm_targets
				##### create checklist with names from all Alarm Targets #####
				cat alarm_rules | tr "\n" "," &> preatarget
				sed -i 's/,$//' preatarget
				preatarget=$(cat preatarget)

				MENU_OPTIONS=
				COUNT=0

				IFS="," read -a MYTYPES <<< $preatarget
				for i in "${MYTYPES[@]}"
				do
					COUNT=$[COUNT+1]
					MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
				done
				cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --radiolist "select the alarm target you would like to use for this alarm rule:" 0 120 0)
				options=(${MENU_OPTIONS})
				choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
				>myselectedatarget
				echo "$choices" >> myselectedatarget
				cat myselectedatarget|tr "," "\n" &> selectedatarget
				selectedatarget=$(cat selectedatarget)

				if [[ -z "$eord" ]]
				then
					eord=$(mktemp -t checklist.XXXXXXXXX)
					trap 'rm -f "$eord"' exit
					trap 'exit 127' hup stop term
					dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Enable selection" --clear --radiolist "Do you want the alarm rule Enabled or Disabled?" 0 0 0 "enabled" "Enable alarm rule after it is created" off "disabled" "Disable alarm rule after it is created" off 2> "$eord"
					retval=$?
					input=$(cat "$eord")
					case $retval in
						0)      eord=$(echo "$input")
							echo "$eord" > eord
							eord=$(cat eord)
							if [[ "$eord" == "enabled" ]]
							then
								eord=true	
							elif [[ "$eord" == "disabled" ]]
                                                        then
                                                                eord=false
							else
								dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Variable Undefined" --msgbox "$(echo 'eord variable is undefined, returning to menu.')" 0 0
                                                        	return
							fi
							;;
						1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so script will exit.')" 0 0
							return
							;;
						255)     dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 0 0
							return
							;;
					esac

					eord=${eord,,}    # tolower
				else
					echo "audtask variable is already defined"
				fi

                                # make default changes to specific fields of the copied threshold
                                sed -i "s/\"enabled\": ".*",/\"enabled\": $eord,/" $line.json
                               	sed -i '/\[/d' $line.json
                               	sed -i '/\]/d' $line.json
                               #sed -i 's/"status": ".*",/"status": "",/' $line.json
                               #sed -i 's/"failed_list": ".*",/"failed_list": "",/' $line.json

				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Editing Alarm Rule" --msgbox "$(echo 'You will be editing the alarm rule next and the name in this new file cannot be the same as the one you are copying\nThe name of the alarm rule must be unique or\nthis task will fail. Also you will needand make sure the names are different.')" 10 90

                                # allow user to edit the selected file
                                dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "edit alarm rule" --editbox $line.json 0 0 2> $line.edited.json

                                # get threshold name from copied file to make sure the new file does not use the same name
                                origarulename=$(cat $line.json | grep -i name | cut -d'"' -f4)
                                newarulename=$(cat $line.edited.json | grep -i name | cut -d'"' -f4)

                                # check to make sure the threshold names are different
                                if [ "$origarulename" == "$newarulename" ]
                                then
                                        dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "threshold name check" --msgbox "$(echo 'The threshold name in your new file cannot be the same as the old threshold name\nyou will either need to use the update function of this tool or\nyou will need to repeat this task and make sure the names are different.\nyou will now be returned to the main menu.')" 10 90
                                        #rm -f proftask tmpenv selectedtfiles myselectedtfiles pretfiles threshnames output.json retval_proftask $line.json $line.edited.json
                                        #unset proftask tmpenv prepfiles origthreshname newthreshname
                                        return
                                fi

                                # rename file with new profile name to be safe
                                mv $line.edited.json $newarulename.edited.json

                                # create the new alarm rule 
                                curl -s -k --cookie mycookie -X POST -H "content-type: application/json" -d @$newarulename.edited.json https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/alarm/rule/create

                                # get new Alarm Rule
                                curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name="$newarulename" | jq &> $newarulename.json

                                # display new Alarm Rule to user
                                dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp alarm rule created ($newarulename)" --msgbox "$(cat $newthreshname.json)" 0 0

                                rm -f $newarulename.json $line.json $line.edited.json $newarulename.edited.json
                                unset newarulename origarulename
                        done < selectedtfiles

                        rm -f proftask tmpenv selectedatarget myselectedatarget preatarget alarm_targets output.json retval_proftask
                        unset proftask tmpenv preatarget eord 
                        rm -f menu*
                        return
                ;;
                "create from file")
                #       let i=0 # define counting variable
                #       w=() # define working array
                #       while read -r line; do # process file by file
                #               let i=$i+1
                #               w+=($i "$line")
                #       #done < <( ls -1 . )
                #       done < <( find . -maxdepth 1 -type f -name '*.json' )
                #       file=$(dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "select json formatted file to create threshold" --menu "chose one" 24 80 17 "${w[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
                #       result=$?
                #       clear
                #       if [ $result -eq 0 ]; then # exit with ok
                #               echo "${w[$((file * 2 -1))]}" &> createfile
                #               sed -i 's/.\///g' createfile
                #       else
                #               dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "hit escape" --msgbox "$(echo 'you hit escape key so you will exit be returned to the menu')" 0 0
                #                return
                #       fi
                #       createfile=$(cat )
                #       profilename=$(cat $createfile|grep name\"|cut -d'"' -f4)
                #       echo "$profilename" > tester
#
                        ###  define and create cookie ###
#                       curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

#                       curl -s -k --cookie mycookie -X POST -h "content-type: application/json" -d @$createfile https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/create
#                       curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list| jq &> output.json
#                       cat output.json | grep -o $profilename &> query_result
#                       query_result=$(cat output.json | grep -o $profilename)
#                       if [[ "$query_result" == "$profilename" ]]
#                       then
#                               dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp snmp-discovery create results" --msgbox "$(echo 'the snmp-discovery profile was successfully created and it will now be fetched for you to validate.')" 5 90
#                               # get created snmp-discovery profile
#                               curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name="$profilename" | jq &> latest.json
#                               # display updated snmp-discovery profile to user
#                               dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp snmp-discovery profile $profilename created." --msgbox "$(cat latest.json)" 0 0
#                       else
#                               dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp snmp-discovery create results" --msgbox "$(echo 'the snmp-discovery profile was not created. please check what went wrong and try again')" 0 0
#                       fi
                ;;
        esac
#       rm -f proftask tmpenv createfile createtask query_result tester latest.json output.json
#        unset proftask tmpenv createfile createtask file result profilename query_result
#        rm -f menu*
#        return

elif [[ "$proftask" == 'delete_alarm_rules' ]]
then
	##### get cookie #####
	curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

	##### get names of all alarm rules to display to user
	curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/alarm/rule/list" | jq -r '.. | select(type == "object" and has("name")).name' &> alarm_rules

	##### create checklist with names from all Alarm Rules #####
	cat alarm_rules | tr "\n" "," &> pretfiles
	sed -i 's/,$//' prepfiles
	pretfiles=$(cat pretfiles)

	MENU_OPTIONS=
	COUNT=0

	IFS="," read -a MYTYPES <<< $pretfiles
	for i in "${MYTYPES[@]}"
	do
		COUNT=$[COUNT+1]
		MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
	done
	cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the alarm rule(s) you would like to delete:" 0 120 0)
	options=(${MENU_OPTIONS})
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	>myselectedtfiles
	echo "$choices" >> myselectedtfiles
	cat myselectedtfiles|tr "," "\n" &> selectedtfiles
	while read line
	do

		# ask user if they want to backup the threshold in case they want to recover it later
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --yesno "do you want to backup this alarm rule: ($line) for recovery later?" 5 90
		if [ $? -eq 0 ]
		then
			# make backup directory if it does not exist
			mkdir -p backup_alarm_rules

			# get the current date in mm_dd_yyyy format
			date_formatted=$(date +"%m_%d_%y")

			# create a filename with the formatted date
			filename=$(echo "${line}.${date_formatted}.json")
			>backup_alarm_rules/$filename

			# get selected Alarm Rule chosen and save to a json file
			curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/alarm/rule/list?name=$line | jq &> $line.json

			# copy the Alarm Rule to backup directory in json format for recovery later if needed
			cat $line.json | jq >> backup_alarm_rules/$filename

			# confirmation of Alarm Rule backup 
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Alarm Rule backup complete for $filename" --msgbox "$(ls -ltr backup_thresholds)" 5 90

			# ask user if they really want to delete the threshold
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --yesno "Are you sure you want to delete Alarm Rule: $line?" 5 60
			if [ $? -eq 0 ]
			then
				# delete the selected threshold
				curl -k --cookie mycookie -X DELETE -H "Content-Type: application/json" -d @$line.json -k https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/alarm/rule/delete

				# confirmation of threshold deletion
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Alarm Rule Deleted" --msgbox "$(echo "Alarm Rule has been deleted. now fetching Alarm Rule list to validate")" 5 90

				# verify deletion to user after the threshold(s) are deleted #####
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Current Alarm Rule list for $tmpenv" --msgbox "$(curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/alarm/rule/list | jq -r '.. | select(type == "object" and has("name")).name')" 0 0

				rm -f $line.json output.json

			elif [ $? -eq 1 ]
			then
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "hit no" --msgbox "$(echo "you hit no so profile $line will not be deleted")" 0 0
				continue
			else
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "hit escape" --msgbox "$(echo 'you hit escape key so you will exit be returned to the menu')" 0 0
				return
			fi


		elif [ $? -eq 1 ]
		then
			continue
		else
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "hit escape" --msgbox "$(echo 'you hit escape key so you will exit be returned to the menu')" 0 0
			return
		fi

       done < selectedtfiles

       rm -f retval_tmpenv tmpenv retval_proftask proftask threshnames pretfiles myselectedtfiles selectedtfiles
       unset proftask tmpenv pretfiles retval_tmpenv retval_proftask
       rm -f menu*
       return

elif [[ "$proftask" == 'recover_alarm_rule' ]]
then
	# get all files from the backup_recovery directory and present them as checklist to the user 
	ls -1 backup_alarm_rules/* > recover_alarm_rule
	cat recover_alarm_rule | tr "\n" "," &> recfiles
	sed -i 's/,$//' recfiles
	recfiles=$(cat recfiles)

	MENU_OPTIONS=
	COUNT=0

	IFS="," read -a MYTYPES <<< $recfiles
	for i in "${MYTYPES[@]}"
	do
		COUNT=$[COUNT+1]
		MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
	done
	cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the Alarm Rule(s) would like to recover:" 0 120 0)
	options=(${MENU_OPTIONS})
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	>myselectedrecfiles
	echo "$choices" >> myselectedrecfiles
	cat myselectedrecfiles|tr "," "\n" &> selectedrecfiles
	while read line
	do
		# create the json file #
		cat backup_alarm_rules/$line &> $line.json

		###  create cookie ###
		curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

		# remove old times from Alarm Rule before recovering the Alarm Rule 
		#sed -i 's/"creation_time": ".*",/"creation_time": 0,/' $line
		#sed -i 's/"update_time": .*,/"update_time": 0,/' $line

		# create the new alarm rule
		curl -s -k --cookie mycookie -X POST -H "content-type: application/json" -d @$line.json https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/alarm/rule/create

		# get new Alarm Rule
		curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name="$line" | jq &> $line.new.json

		# display new Alarm Rule to user
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp alarm rule created ($newarulename)" --msgbox "$(cat $line.new.json)" 0 0
		
		rm $line $line.new.json
	done < selectedrecfiles
	rm -f proftask tmpenv recfiles recover_alarm_rule myselectedtfiles selectedrecfiles
	unset proftask tmpenv recfiles 
	rm -f menu*
	return

elif [[ "$proftask" == 'update_alarm_rules' ]]
then
	curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
	# create checklist with names from all thresholds
	cat threshnames | tr "\n" "," &> pretfiles
	sed -i 's/,$//' prepfiles
	pretfiles=$(cat pretfiles)

	MENU_OPTIONS=
	COUNT=0

	IFS="," read -a MYTYPES <<< $pretfiles
	for i in "${MYTYPES[@]}"
	do
		COUNT=$[COUNT+1]
		MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
	done
	cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the threshold(s) would like to view:" 0 120 0)
	options=(${MENU_OPTIONS})
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	>myselectedtfiles
	echo "$choices" >> myselectedtfiles
	cat myselectedtfiles|tr "," "\n" &> selectedtfiles
	while read line
	do
		# get each selected threshold and save to a json file
		curl -s -k --cookie mycookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name="$line" | jq &> $line.json

		# allow user to edit the selected file
		dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "edit threshold" --editbox $line.json 0 0 2> $line.edited.json

		# update the threshold 
		curl -s -k --cookie mycookie -x put -h "content-type: application/json" -d @$line.edited.json https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/update

		# get updated threshold 
		curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name="$line" | jq &> latest_$line.json

		# display updated threshold to user
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp updated threshold $line" --msgbox "$(cat latest_$line.json)" 0 0
		rm -f latest_$line.json $line.json $line.edited.json

	done < selectedtfiles

	rm -f retval_tmpenv tmpenv retval_proftask proftask threshnames pretfiles myselectedtfiles selectedtfiles thresh.json
	unset proftask tmpenv pretfiles retval_tmpenv retval_proftask
	rm -f menu*
	return

elif [[ "$proftask" == 'import_alarm_rules' ]]
then
	let i=0 # define counting variable
	w=() # define working array
	while read -r line; do # process file by file
		let i=$i+1
		w+=($i "$line")
	#done < <( ls -1 . )
	done < <( find . -maxdepth 1 -type f -name '*.json' )
	file=$(dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "select json formatted file to create profile" --menu "chose one" 24 80 17 "${w[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
	result=$?
	#       echo "$file" &> result
	clear
	if [ $result -eq 0 ]; then # exit with ok
		echo "${w[$((file * 2 -1))]}" &> createfile
		sed -i 's/.\///g' createfile
	fi
	createfile=$(cat createfile)
	profilename=$(cat $createfile|grep name\"|cut -d'"' -f4)
	echo "$profilename" > tester

	###  define and create cookie ###
	mycookie="/root/manual_upi/tncmp_cli_admin/mycookie"
	curl -s -k --cookie-jar $mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

	rm -f proftask tmpenv createfile tester
        unset proftask tmpenv createfile profilename
        rm -f menu*
        return



elif [[ "$proftask" == 'delete_alarm_rules' ]]
then
        # create checklist with names from all thresholds
        cat threshnames | tr "\n" "," &> pretfiles
        sed -i 's/,$//' prepfiles
        pretfiles=$(cat pretfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< $pretfiles
        for i in "${MYTYPES[@]}"
        do
                COUNT=$[COUNT+1]
                MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
        done
        cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the threshold(s) would like to view:" 0 120 0)
        options=(${MENU_OPTIONS})
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        >myselectedtfiles
        echo "$choices" >> myselectedtfiles
        cat myselectedtfiles|tr "," "\n" &> selectedtfiles
        #selectedpfiles=$(cat selectedpfiles)
        while read line
        do
                curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name=$line | jq &> thresh.json
                dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "threshold configuration for $line" --msgbox "$(cat thresh.json | jq)" 0 0
        done < selectedtfiles

        rm -f retval_tmpenv tmpenv retval_proftask proftask threshnames pretfiles myselectedtfiles selectedtfiles thresh.json
        unset proftask tmpenv pretfiles retval_tmpenv retval_proftask
        rm -f menu*
        return

elif [[ "$proftask" == 'list_alarm_targets' ]]
then
        # create checklist with names from all thresholds
        cat threshnames | tr "\n" "," &> pretfiles
        sed -i 's/,$//' prepfiles
        pretfiles=$(cat pretfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< $pretfiles
        for i in "${MYTYPES[@]}"
        do
                COUNT=$[COUNT+1]
                MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
        done
        cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the threshold(s) would like to view:" 0 120 0)
        options=(${MENU_OPTIONS})
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        >myselectedtfiles
        echo "$choices" >> myselectedtfiles
        cat myselectedtfiles|tr "," "\n" &> selectedtfiles
        #selectedpfiles=$(cat selectedpfiles)
        while read line
        do
                curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name=$line | jq &> thresh.json
                dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "threshold configuration for $line" --msgbox "$(cat thresh.json | jq)" 0 0
        done < selectedtfiles

        rm -f retval_tmpenv tmpenv retval_proftask proftask threshnames pretfiles myselectedtfiles selectedtfiles thresh.json
        unset proftask tmpenv pretfiles retval_tmpenv retval_proftask
        rm -f menu*
        return

elif [[ "$proftask" == 'list_alarm_target_groups' ]]
then
        # create checklist with names from all thresholds
        cat threshnames | tr "\n" "," &> pretfiles
        sed -i 's/,$//' prepfiles
        pretfiles=$(cat pretfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< $pretfiles
        for i in "${MYTYPES[@]}"
        do
                COUNT=$[COUNT+1]
                MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
        done
        cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the threshold(s) would like to view:" 0 120 0)
        options=(${MENU_OPTIONS})
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        >myselectedtfiles
        echo "$choices" >> myselectedtfiles
        cat myselectedtfiles|tr "," "\n" &> selectedtfiles
        #selectedpfiles=$(cat selectedpfiles)
        while read line
        do
                curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name=$line | jq &> thresh.json
                dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "threshold configuration for $line" --msgbox "$(cat thresh.json | jq)" 0 0
        done < selectedtfiles

        rm -f retval_tmpenv tmpenv retval_proftask proftask threshnames pretfiles myselectedtfiles selectedtfiles thresh.json
        unset proftask tmpenv pretfiles retval_tmpenv retval_proftask
        rm -f menu*
        return



elif [[ "$proftask" == 'create' ]]
then
	if [[ -z "$createtask" ]]
	then
		createtask=$(mktemp -t checklist.XXXXXXXXX)
		trap 'rm -f "$createtask"' exit
		trap 'exit 127' hup stop term
		dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "create task selection" --clear --radiolist "select how you want to create new theshold." 0 0 0 "copy existing" "select existing threshold to copy and edit" off "create from file" "create new threshold from json formated file" off 2> "$createtask"
		retval=$?
		input=$(cat "$createtask")
		case $retval in
			0)      createtask=$(echo "$input")
				echo "$createtask" > createtask
				;;
			1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so script will exit.')" 0 0
                        	return
                        	;;
                	255)     dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 0 0
                        	return
                        	;;
		esac

		createtask=${createtask,,}    # tolower
	else
		echo "audtask variable is already defined"
	fi

	case $createtask in

		"copy existing")
			##### get cookie #####
			curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
			curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list | jq -r '.. | select(type == "object" and has("name")).name' &> threshnames
			sed -i 's/ /_/g' threshnames

			##### create checklist with names from all thresholds #####
			cat threshnames | tr "\n" "," &> pretfiles
			sed -i 's/,$//' prepfiles
			pretfiles=$(cat pretfiles)

			MENU_OPTIONS=
			COUNT=0

			IFS="," read -a MYTYPES <<< $pretfiles
			for i in "${MYTYPES[@]}"
			do
				COUNT=$[COUNT+1]
				MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
			done
			cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the threshold(s) you would like to copy:" 0 120 0)
			options=(${MENU_OPTIONS})
			choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
			>myselectedtfiles
			echo "$choices" >> myselectedtfiles
			cat myselectedtfiles|tr "," "\n" &> selectedtfiles
			while read line
			do

				# get each selected threshold and save to a json file
				curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name=$line | jq &> $line.json

				# make default changes to specific fields of the copied threshold 
				sed -i 's/"creation_time": ".*",/"creation_time": 0,/' $line.json
				sed -i 's/"update_time": .*,/"update_time": 0,/' $line.json
			#	sed -i 's/"status": ".*",/"status": "",/' $line.json
			#	sed -i 's/"failed_list": ".*",/"failed_list": "",/' $line.json
				
				# get threshold name from copied file to make sure the new file does not use the same name
                                origthreshname=$(cat $line.json | grep -i name | cut -d'"' -f4)
                                newthreshname=$(cat $line.edited.json | grep -i name | cut -d'"' -f4)

				# allow user to edit the selected file
				dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "edit threshold" --editbox $line.json 0 0 2> $line.edited.json

				# get threshold name from copied file to make sure the new file does not use the same name
				origthreshname=$(cat $line.json | grep -i name | cut -d'"' -f4)
				newthreshname=$(cat $line.edited.json | grep -i name | cut -d'"' -f4)

				# check to make sure the threshold names are different
				if [ "$origthreshname" == "$newthreshname" ]
				then
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "threshold name check" --msgbox "$(echo 'the threshold name in your new file cannot be the same as the old threshold name\nyou will either need to use the update function of this tool or\nyou will need to repeat this task and make sure the names are different.\nyou will now be returned to the main menu.')" 10 90
					rm -f proftask tmpenv selectedtfiles myselectedtfiles pretfiles threshnames output.json retval_proftask $line.json $line.edited.json
					unset proftask tmpenv prepfiles origthreshname newthreshname
					return
				fi

				# rename file with new profile name to be safe
				mv $line.edited.json $newthreshname.edited.json

				# create the new threshold
				curl -s -k --cookie mycookie -X POST -h "content-type: application/json" -d @$newthreshname.edited.json https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/create

				# get new threshold 
				curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name="$newthreshname" | jq &> $newthreshname.json

				# display new snmp-discovery profile to user
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp threshold created ($newthreshname)" --msgbox "$(cat $newthreshname.json)" 0 0
				rm -f $newthreshname.json $line.json $line.edited.json $newthreshname.edited.json
				unset newthreshname origthreshname
			done < selectedtfiles

			rm -f proftask tmpenv selectedtfiles myselectedtfiles pretfiles threshnames output.json retval_proftask
			unset proftask tmpenv pretfiles createtask
			rm -f menu*
			return
				
		;;
		"create from file")
		#	let i=0 # define counting variable
		#	w=() # define working array
		#	while read -r line; do # process file by file
		#		let i=$i+1
		#		w+=($i "$line")
		#	#done < <( ls -1 . )
		#	done < <( find . -maxdepth 1 -type f -name '*.json' )
		#	file=$(dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "select json formatted file to create threshold" --menu "chose one" 24 80 17 "${w[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
		#	result=$?
		#	clear
		#	if [ $result -eq 0 ]; then # exit with ok
		#		echo "${w[$((file * 2 -1))]}" &> createfile 
		#		sed -i 's/.\///g' createfile
		#	else 
		#		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "hit escape" --msgbox "$(echo 'you hit escape key so you will exit be returned to the menu')" 0 0
                #                return
		#	fi
		#	createfile=$(cat )	
		#	profilename=$(cat $createfile|grep name\"|cut -d'"' -f4)
		#	echo "$profilename" > tester
#
			###  define and create cookie ###
#			curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

#			curl -s -k --cookie mycookie -X POST -h "content-type: application/json" -d @$createfile https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/create
#			curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list| jq &> output.json
#			cat output.json | grep -o $profilename &> query_result
#			query_result=$(cat output.json | grep -o $profilename)
#			if [[ "$query_result" == "$profilename" ]]
#			then
#				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp snmp-discovery create results" --msgbox "$(echo 'the snmp-discovery profile was successfully created and it will now be fetched for you to validate.')" 5 90
#				# get created snmp-discovery profile
#                        	curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name="$profilename" | jq &> latest.json
#                        	# display updated snmp-discovery profile to user
#                        	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp snmp-discovery profile $profilename created." --msgbox "$(cat latest.json)" 0 0
#			else
#				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp snmp-discovery create results" --msgbox "$(echo 'the snmp-discovery profile was not created. please check what went wrong and try again')" 0 0
#			fi
		;;
	esac	
#	rm -f proftask tmpenv createfile createtask query_result tester latest.json output.json
#        unset proftask tmpenv createfile createtask file result profilename query_result
#        rm -f menu*
#        return


elif [[ "$proftask" == 'delete' ]]
then
	# create checklist with names from all thresholds
        cat threshnames | tr "\n" "," &> pretfiles
        sed -i 's/,$//' prepfiles
        pretfiles=$(cat pretfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< $pretfiles
        for i in "${MYTYPES[@]}"
        do
                COUNT=$[COUNT+1]
                MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
        done
        cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the threshold(s) would like to delete:" 0 120 0)
        options=(${MENU_OPTIONS})
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        >myselectedtfiles
        echo "$choices" >> myselectedtfiles
        cat myselectedtfiles|tr "," "\n" &> selectedtfiles
        #selectedpfiles=$(cat selectedpfiles)
        while read line
        do
		# ask user if they want to backup the threshold in case they want to recover it later
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --yesno "do you want to backup this threshold ($line) for recovery later?" 5 90
                if [ $? -eq 0 ]
                then
			# make backup directory if it does not exist
			mkdir -p backup_thresholds

			# get the current date in mm_dd_yyyy format
			date_formatted=$(date +"%m_%d_%y")

			# create a filename with the formatted date
			filename=$(echo "${line}.${date_formatted}.json")
			>backup_thresholds/$filename

			# get selected threshold chosen and save to a json file
                        curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name=$line | jq &> $line.json

			# copy the threshold to backup directory in json format for rcovery later if needed
			cat $line.json | jq >> backup_thresholds/$filename

                        # confirmation of threshold backup 
                        dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "threshold backup complete for $filename" --msgbox "$(ls -ltr backup_thresholds)" 5 90

			# ask user if they really want to delete the threshold
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --yesno "are you sure you want to delete threshold $line?" 5 60
			if [ $? -eq 0 ]
			then
				# delete the selected threshold
				curl -s -k --cookie mycookie -x delete -h "content-type: application/json" -d @$line.json -k https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/delete

				# confirmation of threshold deletion
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "threshold deleted" --msgbox "$(echo "threshold has been deleted. now fetching threshold list to validate")" 5 90

				# verify deletion to user after the threshold(s) are deleted #####
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "current threshold list for $tmpenv" --msgbox "$(curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list | jq -r '.. | select(type == "object" and has("name")).name')" 0 0

				rm -f $line.json output.json

			elif [ $? -eq 1 ]
			then
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "hit no" --msgbox "$(echo "you hit no so profile $line will not be deleted")" 0 0
				continue
			else
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "hit escape" --msgbox "$(echo 'you hit escape key so you will exit be returned to the menu')" 0 0
				return
			fi


                elif [ $? -eq 1 ]
                then
                        continue
                else
                        dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "hit escape" --msgbox "$(echo 'you hit escape key so you will exit be returned to the menu')" 0 0
                        return
                fi

       done < selectedtfiles

       rm -f retval_tmpenv tmpenv retval_proftask proftask threshnames pretfiles myselectedtfiles selectedtfiles thresh.json
       unset proftask tmpenv pretfiles retval_tmpenv retval_proftask
       rm -f menu*
       return


elif [[ "$proftask" == 'update' ]]
then
	curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
	# create checklist with names from all thresholds
        cat threshnames | tr "\n" "," &> pretfiles
        sed -i 's/,$//' prepfiles
        pretfiles=$(cat pretfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< $pretfiles
        for i in "${MYTYPES[@]}"
        do
                COUNT=$[COUNT+1]
                MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
        done
        cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the threshold(s) would like to view:" 0 120 0)
        options=(${MENU_OPTIONS})
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        >myselectedtfiles
        echo "$choices" >> myselectedtfiles
        cat myselectedtfiles|tr "," "\n" &> selectedtfiles
        while read line
        do
		# get each selected threshold and save to a json file
		curl -s -k --cookie mycookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name="$line" | jq &> $line.json

		# allow user to edit the selected file
		dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "edit threshold" --editbox $line.json 0 0 2> $line.edited.json

		# update the threshold 
		curl -s -k --cookie mycookie -x put -h "content-type: application/json" -d @$line.edited.json https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/update

		# get updated threshold 
		curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name="$line" | jq &> latest_$line.json

		# display updated threshold to user
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp updated threshold $line" --msgbox "$(cat latest_$line.json)" 0 0
		rm -f latest_$line.json $line.json $line.edited.json

        done < selectedtfiles

        rm -f retval_tmpenv tmpenv retval_proftask proftask threshnames pretfiles myselectedtfiles selectedtfiles thresh.json
        unset proftask tmpenv pretfiles retval_tmpenv retval_proftask
        rm -f menu*
        return

elif [[ "$proftask" == 'import' ]]
then
	let i=0 # define counting variable
	w=() # define working array
	while read -r line; do # process file by file
		let i=$i+1
		w+=($i "$line")
	#done < <( ls -1 . )
	done < <( find . -maxdepth 1 -type f -name '*.json' )
	file=$(dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "select json formatted file to create profile" --menu "chose one" 24 80 17 "${w[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
	result=$?
	#       echo "$file" &> result
	clear
	if [ $result -eq 0 ]; then # exit with ok
		echo "${w[$((file * 2 -1))]}" &> createfile
		sed -i 's/.\///g' createfile
	fi
	createfile=$(cat createfile)
	profilename=$(cat $createfile|grep name\"|cut -d'"' -f4)
	echo "$profilename" > tester

	###  define and create cookie ###
	mycookie="/root/manual_upi/tncmp_cli_admin/mycookie"
	curl -s -k --cookie-jar $mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

	rm -f proftask tmpenv createfile tester
        unset proftask tmpenv createfile profilename
        rm -f menu*
        return

elif [[ "$proftask" == 'recover' ]]
then
	# get all files from the backup_recovery directory and present them as checklist to the user 
	ls -1 backup_thresholds/* > recover_threshold
        cat recover_threshold | tr "\n" "," &> recfiles
        sed -i 's/,$//' recfiles
        recfiles=$(cat recfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< $recfiles
        for i in "${MYTYPES[@]}"
        do
                COUNT=$[COUNT+1]
                MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
        done
        cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the threshold(s) would like to recover:" 0 120 0)
        options=(${MENU_OPTIONS})
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        >myselectedrecfiles
        echo "$choices" >> myselectedrecfiles
        cat myselectedrecfiles|tr "," "\n" &> selectedrecfiles
        while read line
        do

		###  create cookie ###
                curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

                # remove old times from threshold before recovering the threshold 
		sed -i 's/"creation_time": ".*",/"creation_time": 0,/' $line
                sed -i 's/"update_time": .*,/"update_time": 0,/' $line


		# create the new threshold
		curl -s -k --cookie mycookie -X POST -h "content-type: application/json" -d @$line https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/create

		# get new threshold
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "recovered threshold should show on list of thresholds now" --msgbox "$(curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list | jq -r '.. | select(type == "object" and has("name")).name')" 0 0
	done < selectedrecfiles
        rm -f proftask tmpenv recfiles recover_threshold myselectedtfiles selectedrecfiles
        unset proftask tmpenv recfiles 
        rm -f menu*
        return

else
	echo "variable not found"	
fi


}
threshmanagement()
{
if [[ -z "$tmpenv" ]]
then
	tmpenv=$(mktemp -t checklist.XXXXXXXXX)
	trap 'rm -f "$tmpenv"' exit
	trap 'exit 127' hup stop term
	dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "environment/lab/cluster selection" --radiolist "select which openshift environment you want to work with thresholds on." 0 80 0 "openshift" "lab1 environment" off "openshift2" "lab2 environment" off 2> "$tmpenv"
	retval=$?
	echo "$retval" > retval_tmpenv
	retval_tmpenv=$(cat retval_tmpenv)
	input=$(cat "$tmpenv")
	case $retval_tmpenv in
		1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so script will exit.')" 5 50
			rm -f retval_tmpenv menu* tmpenv
			unset retval retval_tmpenv input tmpenv
			return
			;;
		255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 50
			rm -f retval_tmpenv menu* tmpenv
			unset retval retval_tmpenv input tmpenv
			return
			;;
		0)      tmpenv=$(echo "$input")
			echo "$tmpenv" > tmpenv
			tmpenv=${tmpenv,,}    # tolower
			;;
		*)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "unauthorized key was pressed." --msgbox "$(echo 'unauthorized key was pressed so you will be returned to menu.')" 5 60
			rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
			unset retval retval_proftask input proftask retval_tmpenv input tmpenv
			return
			;;
	esac

	#tmpenv=${tmpenv,,}    # tolower
else
	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp variable exists" --msgbox "$(echo 'tempenv variable is already defined')" 0 0
	rm -f tmpenv
	unset tmpenv
	return
fi

if [[ -z "$proftask" ]]
then
        proftask=$(mktemp -t checklist.XXXXXXXXX)
        trap 'rm -f "$proftask"' exit
        trap 'exit 127' hup stop term
        dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "task selection" --clear --radiolist "select the task for working with thresholds." 0 80 0 "view" "view thresholds" off "create" "create thresholds" off "delete" "delete thresholds" off "update" "update thresholds" off "import" "import thresholds" off "recover" "recover a backed up threshold" off 2> "$proftask"
        retval=$?
        echo "$retval" > retval_proftask
        retval_proftask=$(cat retval_proftask)
        input=$(cat "$proftask")
        case $retval_proftask in
                1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so script will exit.')" 5 50
                        rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
                        unset retval retval_proftask input proftask retval_tmpenv input tmpenv
                        return
                        ;;
                255)     dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 50
                        rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
                        unset retval retval_proftask input proftask retval_tmpenv input tmpenv
                        return
                        ;;
                0)      proftask=$(echo "$input")
                        echo "$proftask" > proftask
                        proftask=${proftask,,}    # tolower
                        ;;
                *)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "unauthorized key was pressed." --msgbox "$(echo 'unauthorized key was pressed so you will be returned to menu.')" 5 60
                        rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
                        unset retval retval_proftask input proftask retval_tmpenv tmpenv
                        return
                        ;;
        esac

else
        dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp variable already exists" --msgbox "$(echo 'proftask variable is already defined')" 0 0
        rm -f proftask
        unset proftask
        return
fi

##### get cookie #####
curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list | jq -r '.. | select(type == "object" and has("name")).name' &> threshnames
sed -i 's/ /_/g' threshnames

if [[ "$proftask" == 'view' ]]
then
	# create checklist with names from all thresholds 
	cat threshnames | tr "\n" "," &> pretfiles 
	sed -i 's/,$//' prepfiles
	pretfiles=$(cat pretfiles)

	MENU_OPTIONS=
	COUNT=0

	IFS="," read -a MYTYPES <<< $pretfiles
	for i in "${MYTYPES[@]}"
	do
		COUNT=$[COUNT+1]
		MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
	done
	cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the threshold(s) would like to view:" 0 120 0)
	options=(${MENU_OPTIONS})
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	>myselectedtfiles
	echo "$choices" >> myselectedtfiles
	cat myselectedtfiles|tr "," "\n" &> selectedtfiles
	#selectedpfiles=$(cat selectedpfiles)
	while read line
	do
		curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name=$line | jq &> thresh.json
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "threshold configuration for $line" --msgbox "$(cat thresh.json | jq)" 0 0
	done < selectedtfiles

	rm -f retval_tmpenv tmpenv retval_proftask proftask threshnames pretfiles myselectedtfiles selectedtfiles thresh.json
	unset proftask tmpenv pretfiles retval_tmpenv retval_proftask 
	rm -f menu*
	return

elif [[ "$proftask" == 'create' ]]
then
	if [[ -z "$createtask" ]]
	then
		createtask=$(mktemp -t checklist.XXXXXXXXX)
		trap 'rm -f "$createtask"' exit
		trap 'exit 127' hup stop term
		dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "create task selection" --clear --radiolist "select how you want to create new theshold." 0 0 0 "copy existing" "select existing threshold to copy and edit" off "create from file" "create new threshold from json formated file" off 2> "$createtask"
		retval=$?
		input=$(cat "$createtask")
		case $retval in
			0)      createtask=$(echo "$input")
				echo "$createtask" > createtask
				;;
			1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so script will exit.')" 0 0
                        	return
                        	;;
                	255)     dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 0 0
                        	return
                        	;;
		esac

		createtask=${createtask,,}    # tolower
	else
		echo "audtask variable is already defined"
	fi

	case $createtask in

		"copy existing")
			##### get cookie #####
			curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
			curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list | jq -r '.. | select(type == "object" and has("name")).name' &> threshnames
			sed -i 's/ /_/g' threshnames

			##### create checklist with names from all thresholds #####
			cat threshnames | tr "\n" "," &> pretfiles
			sed -i 's/,$//' prepfiles
			pretfiles=$(cat pretfiles)

			MENU_OPTIONS=
			COUNT=0

			IFS="," read -a MYTYPES <<< $pretfiles
			for i in "${MYTYPES[@]}"
			do
				COUNT=$[COUNT+1]
				MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
			done
			cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the threshold(s) you would like to copy:" 0 120 0)
			options=(${MENU_OPTIONS})
			choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
			>myselectedtfiles
			echo "$choices" >> myselectedtfiles
			cat myselectedtfiles|tr "," "\n" &> selectedtfiles
			while read line
			do

				# get each selected threshold and save to a json file
				curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name=$line | jq &> $line.json

				# make default changes to specific fields of the copied threshold 
				sed -i 's/"creation_time": ".*",/"creation_time": 0,/' $line.json
				sed -i 's/"update_time": .*,/"update_time": 0,/' $line.json
			#	sed -i 's/"status": ".*",/"status": "",/' $line.json
			#	sed -i 's/"failed_list": ".*",/"failed_list": "",/' $line.json
				
				# get threshold name from copied file to make sure the new file does not use the same name
                                origthreshname=$(cat $line.json | grep -i name | cut -d'"' -f4)
                                newthreshname=$(cat $line.edited.json | grep -i name | cut -d'"' -f4)

				# allow user to edit the selected file
				dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "edit threshold" --editbox $line.json 0 0 2> $line.edited.json

				# get threshold name from copied file to make sure the new file does not use the same name
				origthreshname=$(cat $line.json | grep -i name | cut -d'"' -f4)
				newthreshname=$(cat $line.edited.json | grep -i name | cut -d'"' -f4)

				# check to make sure the threshold names are different
				if [ "$origthreshname" == "$newthreshname" ]
				then
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "threshold name check" --msgbox "$(echo 'the threshold name in your new file cannot be the same as the old threshold name\nyou will either need to use the update function of this tool or\nyou will need to repeat this task and make sure the names are different.\nyou will now be returned to the main menu.')" 10 90
					rm -f proftask tmpenv selectedtfiles myselectedtfiles pretfiles threshnames output.json retval_proftask $line.json $line.edited.json
					unset proftask tmpenv prepfiles origthreshname newthreshname
					return
				fi

				# rename file with new profile name to be safe
				mv $line.edited.json $newthreshname.edited.json

				# create the new threshold
				curl -s -k --cookie mycookie -X POST -h "content-type: application/json" -d @$newthreshname.edited.json https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/create

				# get new threshold 
				curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name="$newthreshname" | jq &> $newthreshname.json

				# display new snmp-discovery profile to user
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp threshold created ($newthreshname)" --msgbox "$(cat $newthreshname.json)" 0 0
				rm -f $newthreshname.json $line.json $line.edited.json $newthreshname.edited.json
				unset newthreshname origthreshname
			done < selectedtfiles

			rm -f proftask tmpenv selectedtfiles myselectedtfiles pretfiles threshnames output.json retval_proftask
			unset proftask tmpenv pretfiles createtask
			rm -f menu*
			return
				
		;;
		"create from file")
		#	let i=0 # define counting variable
		#	w=() # define working array
		#	while read -r line; do # process file by file
		#		let i=$i+1
		#		w+=($i "$line")
		#	#done < <( ls -1 . )
		#	done < <( find . -maxdepth 1 -type f -name '*.json' )
		#	file=$(dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "select json formatted file to create threshold" --menu "chose one" 24 80 17 "${w[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
		#	result=$?
		#	clear
		#	if [ $result -eq 0 ]; then # exit with ok
		#		echo "${w[$((file * 2 -1))]}" &> createfile 
		#		sed -i 's/.\///g' createfile
		#	else 
		#		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "hit escape" --msgbox "$(echo 'you hit escape key so you will exit be returned to the menu')" 0 0
                #                return
		#	fi
		#	createfile=$(cat )	
		#	profilename=$(cat $createfile|grep name\"|cut -d'"' -f4)
		#	echo "$profilename" > tester
#
			###  define and create cookie ###
#			curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

#			curl -s -k --cookie mycookie -X POST -h "content-type: application/json" -d @$createfile https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/create
#			curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list| jq &> output.json
#			cat output.json | grep -o $profilename &> query_result
#			query_result=$(cat output.json | grep -o $profilename)
#			if [[ "$query_result" == "$profilename" ]]
#			then
#				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp snmp-discovery create results" --msgbox "$(echo 'the snmp-discovery profile was successfully created and it will now be fetched for you to validate.')" 5 90
#				# get created snmp-discovery profile
#                        	curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name="$profilename" | jq &> latest.json
#                        	# display updated snmp-discovery profile to user
#                        	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp snmp-discovery profile $profilename created." --msgbox "$(cat latest.json)" 0 0
#			else
#				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp snmp-discovery create results" --msgbox "$(echo 'the snmp-discovery profile was not created. please check what went wrong and try again')" 0 0
#			fi
		;;
	esac	
#	rm -f proftask tmpenv createfile createtask query_result tester latest.json output.json
#        unset proftask tmpenv createfile createtask file result profilename query_result
#        rm -f menu*
#        return


elif [[ "$proftask" == 'delete' ]]
then
	# create checklist with names from all thresholds
        cat threshnames | tr "\n" "," &> pretfiles
        sed -i 's/,$//' prepfiles
        pretfiles=$(cat pretfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< $pretfiles
        for i in "${MYTYPES[@]}"
        do
                COUNT=$[COUNT+1]
                MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
        done
        cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the threshold(s) would like to delete:" 0 120 0)
        options=(${MENU_OPTIONS})
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        >myselectedtfiles
        echo "$choices" >> myselectedtfiles
        cat myselectedtfiles|tr "," "\n" &> selectedtfiles
        #selectedpfiles=$(cat selectedpfiles)
        while read line
        do
		# ask user if they want to backup the threshold in case they want to recover it later
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --yesno "do you want to backup this threshold ($line) for recovery later?" 5 90
                if [ $? -eq 0 ]
                then
			# make backup directory if it does not exist
			mkdir -p backup_thresholds

			# get the current date in mm_dd_yyyy format
			date_formatted=$(date +"%m_%d_%y")

			# create a filename with the formatted date
			filename=$(echo "${line}.${date_formatted}.json")
			>backup_thresholds/$filename

			# get selected threshold chosen and save to a json file
                        curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name=$line | jq &> $line.json

			# copy the threshold to backup directory in json format for rcovery later if needed
			cat $line.json | jq >> backup_thresholds/$filename

                        # confirmation of threshold backup 
                        dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "threshold backup complete for $filename" --msgbox "$(ls -ltr backup_thresholds)" 5 90

			# ask user if they really want to delete the threshold
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --yesno "are you sure you want to delete threshold $line?" 5 60
			if [ $? -eq 0 ]
			then
				# delete the selected threshold
				curl -s -k --cookie mycookie -X DELETE -H "Content-Type: application/json" -d @$line.json -k https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/delete

				# confirmation of threshold deletion
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "threshold deleted" --msgbox "$(echo "threshold has been deleted. now fetching threshold list to validate")" 5 90

				# verify deletion to user after the threshold(s) are deleted #####
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "current threshold list for $tmpenv" --msgbox "$(curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list | jq -r '.. | select(type == "object" and has("name")).name')" 0 0

				rm -f $line.json output.json

			elif [ $? -eq 1 ]
			then
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "hit no" --msgbox "$(echo "you hit no so profile $line will not be deleted")" 0 0
				continue
			else
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "hit escape" --msgbox "$(echo 'you hit escape key so you will exit be returned to the menu')" 0 0
				return
			fi


                elif [ $? -eq 1 ]
                then
                        continue
                else
                        dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "hit escape" --msgbox "$(echo 'you hit escape key so you will exit be returned to the menu')" 0 0
                        return
                fi

       done < selectedtfiles

       rm -f retval_tmpenv tmpenv retval_proftask proftask threshnames pretfiles myselectedtfiles selectedtfiles thresh.json
       unset proftask tmpenv pretfiles retval_tmpenv retval_proftask
       rm -f menu*
       return


elif [[ "$proftask" == 'update' ]]
then
	curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
	# create checklist with names from all thresholds
        cat threshnames | tr "\n" "," &> pretfiles
        sed -i 's/,$//' prepfiles
        pretfiles=$(cat pretfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< $pretfiles
        for i in "${MYTYPES[@]}"
        do
                COUNT=$[COUNT+1]
                MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
        done
        cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the threshold(s) would like to view:" 0 120 0)
        options=(${MENU_OPTIONS})
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        >myselectedtfiles
        echo "$choices" >> myselectedtfiles
        cat myselectedtfiles|tr "," "\n" &> selectedtfiles
        while read line
        do
		# get each selected threshold and save to a json file
		curl -s -k --cookie mycookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name="$line" | jq &> $line.json

		# allow user to edit the selected file
		dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "edit threshold" --editbox $line.json 0 0 2> $line.edited.json

		# update the threshold 
		curl -s -k --cookie mycookie -x put -h "content-type: application/json" -d @$line.edited.json https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/update

		# get updated threshold 
		curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list?name="$line" | jq &> latest_$line.json

		# display updated threshold to user
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp updated threshold $line" --msgbox "$(cat latest_$line.json)" 0 0
		rm -f latest_$line.json $line.json $line.edited.json

        done < selectedtfiles

        rm -f retval_tmpenv tmpenv retval_proftask proftask threshnames pretfiles myselectedtfiles selectedtfiles thresh.json
        unset proftask tmpenv pretfiles retval_tmpenv retval_proftask
        rm -f menu*
        return

elif [[ "$proftask" == 'import' ]]
then
	let i=0 # define counting variable
	w=() # define working array
	while read -r line; do # process file by file
		let i=$i+1
		w+=($i "$line")
	#done < <( ls -1 . )
	done < <( find . -maxdepth 1 -type f -name '*.json' )
	file=$(dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "select json formatted file to create profile" --menu "chose one" 24 80 17 "${w[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
	result=$?
	#       echo "$file" &> result
	clear
	if [ $result -eq 0 ]; then # exit with ok
		echo "${w[$((file * 2 -1))]}" &> createfile
		sed -i 's/.\///g' createfile
	fi
	createfile=$(cat createfile)
	profilename=$(cat $createfile|grep name\"|cut -d'"' -f4)
	echo "$profilename" > tester

	###  define and create cookie ###
	mycookie="/root/manual_upi/tncmp_cli_admin/mycookie"
	curl -s -k --cookie-jar $mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

	rm -f proftask tmpenv createfile tester
        unset proftask tmpenv createfile profilename
        rm -f menu*
        return

elif [[ "$proftask" == 'recover' ]]
then
	# get all files from the backup_recovery directory and present them as checklist to the user 
	ls -1 backup_thresholds/* > recover_threshold
        cat recover_threshold | tr "\n" "," &> recfiles
        sed -i 's/,$//' recfiles
        recfiles=$(cat recfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< $recfiles
        for i in "${MYTYPES[@]}"
        do
                COUNT=$[COUNT+1]
                MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
        done
        cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the threshold(s) would like to recover:" 0 120 0)
        options=(${MENU_OPTIONS})
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        >myselectedrecfiles
        echo "$choices" >> myselectedrecfiles
        cat myselectedrecfiles|tr "," "\n" &> selectedrecfiles
        while read line
        do

		###  create cookie ###
                curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

                # remove old times from threshold before recovering the threshold 
		sed -i 's/"creation_time": ".*",/"creation_time": 0,/' $line
                sed -i 's/"update_time": .*,/"update_time": 0,/' $line


		# create the new threshold
		curl -s -k --cookie mycookie -X POST -h "content-type: application/json" -d @$line https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/create

		# get new threshold
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "recovered threshold should show on list of thresholds now" --msgbox "$(curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/threshold/rest/threshold/list | jq -r '.. | select(type == "object" and has("name")).name')" 0 0
	done < selectedrecfiles
        rm -f proftask tmpenv recfiles recover_threshold myselectedtfiles selectedrecfiles
        unset proftask tmpenv recfiles 
        rm -f menu*
        return

else
	echo "variable not found"	
fi

}
getnfsdirtrees()
{
###### which lab cluster do you want to choose - openshift or openshift2 #######################################################

#if [[ -z "$tmpenv" ]]
#then
#        tmpenv=$(mktemp -t checklist.XXXXXXXXX)
#        trap 'rm -f "$tmpenv"' exit
#        trap 'exit 127' hup stop term
#        dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "environment/lab/cluster selection" --clear --radiolist "select which openshift environment you want to delete all resources from." 0 0 0 "openshift" "lab1 environment" off "openshift2" "lab2 environment" off 2> "$tmpenv"
#        retval=$?
#        input=$(cat "$tmpenv")
#        case $retval in
#                0)      tmpenv=$(echo "$input")
#                        echo "$tmpenv" > tmpenv
#                        ;;
#                1)      echo "cancel was pressed so script will exit."
#                        exit
#                        ;;
#        esac
#
#        tmpenv=${tmpenv,,}    # tolower
#else
#        echo "tempenv variable is already defined"
#fi
#
#if [[ "$tmpenv" == 'openshift' ]]
#then
#	hostip=10.160.50.220
#elif [[ "$tmpenv" == 'openshift2' ]]
#then
#	hostip=10.160.50.23
#else
#	echo "could not find ip address"
#fi



# remove directory trees directory if it exists
rm -rf /root/manual_upi/tncmp_cli_admin/treedirs

# run script on openshift-nfs server to get new directory tree output
ssh root@10.160.50.220 "/root/scripts/get_tree_data.sh" > /dev/null 2>&1

# move the directory tree manifest file 
#mv /root/manual_upi/tncmp_cli_admin/treedirs/tree_dirs /root/manual_upi/tncmp_cli_admin/tree_dirs

#rm -f /root/manual_upi/tncmp_cli_admin/tree_dirs/1*

# remove empty lines from tree_dirs file
#sed -i '/^$/d' /root/manual_upi/tncmp_cli_admin/tree_dirs

# remove any files returned without a name
#sed -i '/:/d' /root/manual_upi/tncmp_cli_admin/tree_dirs

seltreedirs="/root/manual_upi/tncmp_cli_admin/selectedtreedirs"
#seltreedirs="/root/manual_upi/tncmp_cli_admin/treedirs"
MENU_OPTIONS=
COUNT=0
treedirfile=$(ls -1 /root/manual_upi/tncmp_cli_admin/treedirs | tr "\n" ",")
IFS="," read -a MYHOSTS <<< $treedirfile
for i in "${MYHOSTS[@]}"
do
        COUNT=$[COUNT+1]
        MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
done
cmd=(dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp dir tree view" --separate-output --checklist "select options:" 0 0 0)
options=(${MENU_OPTIONS})
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
>$seltreedirs
echo "$choices" >> $seltreedirs 

while read line
do
	treeview="/root/manual_upi/tncmp_cli_admin/treedirs/$line"
	dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp tree view for directory $line" --textbox $treeview 0 0
done < $seltreedirs
rm -f menuchoices*
}
viewstatus()
{

dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "tncmp openshift status" --msgbox "$(oc get all)" 80 180

rm -f menuchoices*
clear
return
}
tspodlogs()
{
if [[ -z "$logtask" ]]
then
	logtask=$(mktemp -t checklist.XXXXXXXXX)
	trap 'rm -f "$logtask"' exit
	trap 'exit 127' hup stop term
	dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "task selection" --radiolist "select the task for working with pod logs." 0 80 0 "viewlog" "view entire pod log" off "viewsummary" "view summary of error and warning messages for selected pod" off "viewerror" "view just error messages for selected pod" off "viewwarning" "view just warning messages for selected pod" off "viewinfo" "view just info messages for selected pod" off "viewdebug" "view just debug messages for selected pod" off "viewtags" "view log messages by unique tags if available" off 2> "$logtask"
	retval=$?
	input=$(cat "$logtask")
	case $retval in
		0)      logtask=$(echo "$input")
			echo "$logtask" > logtask
			logtask=${logtask,,}    # tolower
			;;
		1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so script will exit.')" 5 50
			rm -f retval_logtask logtask retval_tmpenv tmpenv menu*
			unset retval retval_logtask input logtask retval_tmpenv input tmpenv
			return
			;;
		255)     dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 50
			rm -f retval_logtask logtask retval_tmpenv tmpenv menu*
			unset retval1 retval_logtask input1 logtask retval_tmpenv tmpenv
			return
			;;
		*)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "unauthorized key was pressed." --msgbox "$(echo 'unauthorized key was pressed so you will be returned to menu.')" 5 60
			rm -f retval_logtask logtask retval_tmpenv tmpenv menu*
			unset retval retval_logtask input logtask retval_tmpenv tmpenv
			return
			;;
	esac
else
	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "variable already exists" --msgbox "$(echo 'logtask variable is already defined')" 0 0
fi

if [[ -z "$tmpenv" ]]
then
	tmpenv=$(mktemp -t checklist.XXXXXXXXX)
	trap 'rm -f "$tmpenv"' EXIT
	trap 'exit 127' HUP STOP TERM
	dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Environment/Lab/Cluster Selection" --radiolist "Select which openshift environment you want to delete all resources from." 0 80 0 "openshift" "Lab1 Environment" off "openshift2" "Lab2 Environment" off 2> "$tmpenv"
	retval=$?
	echo "$retval" > retval_tmpenv
	retval_tmpenv=$(cat retval_tmpenv)
	input=$(cat "$tmpenv")
	case $retval_tmpenv in
		1)	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Cancel was pressed." --msgbox "$(echo 'Cancel was pressed so script will exit.')" 5 50
			rm -f retval_tmpenv menu* tmpenv
			unset retval retval_tmpenv input tmpenv
			return
			;;
		255)	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Esc was pressed." --msgbox "$(echo 'Esc Key was pressed so will return to menu.')" 5 50
			rm -f retval_tmpenv menu* tmpenv
			unset retval retval_tmpenv input tmpenv
			return
			;;
		0)	tmpenv=$(echo "$input")
			echo "$tmpenv" > tmpenv
			tmpenv=${tmpenv,,}    # tolower
			;;
		*)	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Unauthorized Key was pressed." --msgbox "$(echo 'Unauthorized key was pressed so you will be returned to menu.')" 5 60
			rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
			unset retval retval_proftask input proftask retval_tmpenv input tmpenv
			return
			;;
	esac

	#tmpenv=${tmpenv,,}    # tolower
else
	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery profile list view for $tmpenv" --msgbox "$(echo 'tempenv variable is already defined')" 0 0
fi


##### pod names #####
# analytics-batch-0
# analytics-stream-0
# app-0
# cassandra-0
# dashboard-0
# diamond-db-0
# diamond-db-export-0
# diamond-db-read-0
# file-collector-0
# inventory-0
# kafka-0
# nfs-client-provisioner-8449f796b4-vtcpm
# nifi-0
# pack-service-0
# ping-collector-0
# POSTgres-0
# POSTgres-th-0
# security-0
# snmp-collector-0
# snmp-discovery-0
# threshold-0
# timeseries-0
# ui-0
# zookeeper-0
###################

##### pod log entries so far #####

# timeseries pod

# this will show the latest count of metrics being processed by time
#grep gymts1004i testme1 | grep -v "processed 0" | cut -d' ' -f2,3,5- | sed 's/ \[/ in /g' | sed 's/\] processed/ - processed/' | sed 's/\[//' | sed 's/\]//'
if [[ "$logtask" == "viewtags" ]]	
then
	logs_with_uniq_tags="timeseries-0,threshold-0"

	echo "$logs_with_uniq_tags" | tr "," "\n" &> preuniquetags

	# create checklist of pod's from above variable to the user 
	# note: the pod names in above variable have already been vetted for unique tags
	cat preuniquetags | tr "\n" "," &> utags 
	sed -i 's/,$//' utags 
	utags=$(cat utags)

	MENU_OPTIONS=
	COUNT=0

	IFS="," read -a MYTYPES <<< $utags
	for i in "${MYTYPES[@]}"
	do
		COUNT=$[COUNT+1]
		MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
	done
	cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the pod(s) with unique tags that you would like to view:" 0 120 0)
	options=(${MENU_OPTIONS})
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	>myselectedutags
	echo "$choices" >> myselectedutags
	cat myselectedutags | tr "," "\n" &> selectedutags
	while read line
	do
		if [[ "$line" == "timeseries-0" ]]
		then
			# get logs for pod and save to a file
			oc logs $line &> logoutput

			# fix a couple lines and replace spaces with underscores for better performance
			cat logoutput | cut -d':' -f3 | grep "\]" | cut -d']' -f2 | cut -d' ' -f2,3 | grep -v } | sort | uniq &> out1
			cat out1 | sed 's/ /_/g' | sed 's/batch_.*/batch/g' | sed 's/ingestingshards=/ingestingshards/g' | sort | uniq &> tagsready	

			# create checklist of pod names for user to select from
			cat tagsready | tr "\n" "," &> tagnames
			sed -i 's/,$//' tagnames
			tagnames=$(cat tagnames)

			MENU_OPTIONS=
			COUNT=0

			IFS="," read -a MYTYPES <<< $tagnames
			for i in "${MYTYPES[@]}"
			do
				COUNT=$[COUNT+1]
				MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
			done
			cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "select the log tag(s) that you would like to view:" 0 120 0)
			options=(${MENU_OPTIONS})
			choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
			>myselectedtags
			echo "$choices" >> myselectedtags
			cat myselectedtags | tr "," "\n" &> selectedtags
			sed -i 's/_/ /g' selectedtags
			while read tline
			do
				grep "$tline" logoutput &> tagout
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "$line log tag: $tline" --textbox tagout 0 0

			done < selectedtags	
			unset retval retval_logtask input logtask retval_tmpenv tmpenv

		elif [[ "$line" == "threshold-0" ]]
		then
			# get logs for pod and save to a file
		#	oc logs $line &> logoutput

			# Fix a couple lines and replace spaces with underscores for better performance
		#	cat logoutput | cut -d':' -f3 | grep "\]" | cut -d']' -f2 | cut -d' ' -f2,3 | grep -v } | sort | uniq &> out1
		#	cat out1 | sed 's/ /_/g' | sed 's/Batch_.*/Batch/g' | sed 's/ingestingShards=/ingestingShards/g' | sort | uniq &> tagsready

			# Create checklist of pod names for user to select from
		#	cat tagsready | tr "\n" "," &> tagnames
		#	sed -i 's/,$//' tagnames
		#	tagnames=$(cat tagnames)


		#	MENU_OPTIONS=
		#	COUNT=0

		#	IFS="," read -a MYTYPES <<< $tagnames
		#	for i in "${MYTYPES[@]}"
		#	do
		#		COUNT=$[COUNT+1]
		#		MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
		#	done
		#	cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "Select the log tag(s) that you would like to view:" 0 120 0)
		#	options=(${MENU_OPTIONS})
		#	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		#	>myselectedtags
		#	echo "$choices" >> myselectedtags
		#	cat myselectedtags | tr "," "\n" &> selectedtags
		#	sed -i 's/_/ /g' selectedtags
		#	while read tline
		#	do
		#		grep "$tline" logoutput &> tagout
		#		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "$line log TAG: $tline" --textbox tagout 0 0
#
#				done < selectedtags
			nothing=nothing

		else
			nothing=nothing
		fi
	done < selectedutags 
		#rm -f retval_logtask logtask retval_tmpenv tmpenv logoutput out1 tagsready tagnames myselectedtags selectedtags tagout preuniquetags utags myselectedutags selectedutags
		#unset retval retval_logtask input logtask retval_tmpenv tmpenv
		#return

else
	# Get the current date in MM_DD_YYYY format
	fdate=$(date +"%m_%d_%Y")

	# Create variables for getting specific loglevels
	#errormess=$(grep "\[ERROR\]" logoutput)
	#warnmess=$(grep "\[WARNING\]" logoutput)
	#infomess=$(grep "\[INFO\]" logoutput)
	#debugmess=$(grep "\[DEBUG\]" logoutput)

	# Get pod names and present checklist for user
	oc get pods --no-headers=true | cut -d' ' -f1 | grep -v nfs &> prepodnames

	# Create checklist of pod names for user to select from
	cat prepodnames | tr "\n" "," &> podnames 
	sed -i 's/,$//' podnames
	podnames=$(cat podnames)

	MENU_OPTIONS=
	COUNT=0

	IFS="," read -a MYTYPES <<< $podnames
	for i in "${MYTYPES[@]}"
	do
		COUNT=$[COUNT+1]
		MENU_OPTIONS="${MENU_OPTIONS} "$i" ${COUNT} off "
	done
	cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "Select the log tag(s) that you would like to view:" 0 120 0)
	options=(${MENU_OPTIONS})
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	>myselectedpods
	echo "$choices" >> myselectedpods
	cat myselectedpods | tr "," "\n" &> selectedpods
	while read line
	do
		# get logs for pod and save to a file
		oc logs $line &> logoutput

		if [[ "$logtask" == "viewlog" ]]
		then
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Current log for $line" --textbox logoutput 0 0

		elif [[ "$logtask" == "viewsummary" ]]
		then

			# Interesting things from specific pod files:
			# timeseries-0
			# TTT: Workers
			# below query will get stat entries from the snmp-collector logs (when in debug) and put them in csv format to be fed into nifi for metrics
			# head -10 snmp-collector-workers-pool | cut -d' ' -f2,3,6- | sed 's/\[//g' | sed 's/\]//g' | sed 's/ /_/g' | sed 's/:_/: /g' | sed 's/,_/, /g' | sed 's/_Workers/, Workers/g' | sed 's/\._/, /g' | sed 's/: /,/g' | sed 's/161-count/161,count/g' | sed 's/, /,/g' | sed 's/=/,/g' | sed 's/_ms//g' | sed 's/_oids//g'
			>summary_report
				echo "Summary Log Report for Pod $line on $fdate" >> summary_report
				echo "=========================================== " >> summary_report
				echo " " >> summary_report
				echo "ERROR Messages" >> summary_report
				echo "--------------" >> summary_report
				echo " " >> summary_report
				echo "$errormess" >> summary_report
				echo " " >> summary_report
				echo " " >> summary_report
				echo "WARNING Messages" >> summary_report
				echo "--------------" >> summary_report
				echo " " >> summary_report
				echo "$errormess" >> summary_report
				if [ -n "$(find . -name 'moi1' -type f)" ]
				then
					echo " " >> summary_report
					echo " " >> summary_report
					echo "Messages of interest 1" >> summary_report
					echo "--------------" >> summary_report
					echo " " >> summary_report
					echo "$errormess" >> summary_report
				fi
				if [ -n "$(find . -name 'moi2' -type f)" ]
				then
					echo " " >> summary_report
					echo " " >> summary_report
					echo "Messages of interest 2" >> summary_report
					echo "--------------" >> summary_report
					echo " " >> summary_report
					echo "$errormess" >> summary_report
				fi
				if [ -n "$(find . -name 'moi3' -type f)" ]
				then
					echo " " >> summary_report
					echo " " >> summary_report
					echo "Messages of interest 3" >> summary_report
					echo "--------------" >> summary_report
					echo " " >> summary_report
					echo "$errormess" >> summary_report
				fi
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Summary Log Report for $line" --textbox summary_report 0 0
			

		elif [[ "$logtask" == "viewerror" ]]
		then
			grep ERROR logoutput &> errormessages

			if [[ -f errormessages && -s errormessages ]]
			then
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Error Messages for $line" --textbox errormessages 0 100
			else
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Error Messages for $line" --msgbox "$(echo "There are no Error messages in the $line pod log")" 10 100
			fi

		elif [[ "$logtask" == "viewwarning" ]]
		then
			grep WARN logoutput &> warnmessages

			if [[ -f warnmessages && -s warnmessages ]]
			then
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Warning Messages for $line" --textbox warnmessages 0 100
			else
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Warning Messages for $line" --msgbox "$(echo "There are no Warning messages in the $line pod log")" 10 100
			fi

		elif [[ "$logtask" == "viewinfo" ]]
		then
			grep INFO logoutput &> infomessages
			if [[ -f infomessages && -s infomessages ]]
			then
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Info Messages for $line" --textbox infomessages 0 100
			else
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Info Messages for $line" --msgbox "$(echo "There are no Info messages in the $line pod log")" 10 100
			fi

		elif [[ "$logtask" == "viewdebug" ]]
		then
			grep DEBUG logoutput &> debugmessages

			if [[ -f debugmessages && -s debugmessages ]]
			then
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Debug Messages for $line" --textbox debugmessages 0 100
			else
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Debug Messages for $line" --msgbox "$(echo "There are no Debug messages in the $line pod log")" 10 100
			fi
		else
			nothing=nothing
		fi

		#elif [[ "$line" == "timeseries-0" ]]
		#then
		#	if [[ "$logtask" == "viewlog" ]]
		#	then
#		#		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "View Log for pod $line" --msgbox "$(cat logoutput)" 0 0
#
#					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "View Log for pod $line" --textbox logoutput 0 0
#
#				elif [[ "$logtask" == "viewsummary" ]]
#				then
#					# Messages of Interest here and name each moi1....moi2....etc
#					grep GYMTS1004I logoutput | grep -v "Processed 0" | cut -d' ' -f2,3,5- | sed 's/ \[/ in /g' | sed 's/\] Processed/ - Processed/' | sed 's/\[//' | sed 's/\]//' &> moi1

#					>summary_report
#					echo "Summary Log Report for Pod $line on $fdate" >> summary_report
#					echo "=========================================== " >> summary_report
#					echo " " >> summary_report
#					echo "ERROR Messages" >> summary_report
#					echo "--------------" >> summary_report
#					echo " " >> summary_report
#					echo "$errormess" >> summary_report
#					echo " " >> summary_report
#					echo " " >> summary_report
#					echo "WARNING Messages" >> summary_report
#					echo "--------------" >> summary_report
#					echo " " >> summary_report
#					echo "$errormess" >> summary_report
#					if [ -n "$(find . -name 'moi1' -type f)" ]
#					then
#						echo " " >> summary_report
#						echo " " >> summary_report
#						echo "Messages of interest 1" >> summary_report
#						echo "--------------" >> summary_report
##						echo " " >> summary_report
#						echo "$errormess" >> summary_report
#					fi
#					if [ -n "$(find . -name 'moi2' -type f)" ]
#					then
#						echo " " >> summary_report
#						echo " " >> summary_report
#						echo "Messages of interest 2" >> summary_report
#						echo "--------------" >> summary_report
#						echo " " >> summary_report
#						echo "$errormess" >> summary_report
#					fi
#					if [ -n "$(find . -name 'moi3' -type f)" ]
#					then
#						echo " " >> summary_report
#						echo " " >> summary_report
#						echo "Messages of interest 3" >> summary_report
#						echo "--------------" >> summary_report
#						echo " " >> summary_report
#						echo "$errormess" >> summary_report
#					fi
				
#			else

#				nothing=nothing
#			fi
	done < selectedpods
#	rm -f retval_logtask logtask retval_tmpenv tmpenv out1 tagsready tagnames myselectedtags selectedtags tagout preuniquetags utags myselectedutags selectedutags prepodnames podnames myselectedpods errormessages warnmessages infomessages debugmessages
#	unset retval retval_logtask input logtask retval_tmpenv tmpenv
#	return
fi
rm -f retval_logtask logtask retval_tmpenv tmpenv logoutput out1 tagsready tagnames myselectedtags selectedtags tagout preuniquetags utags myselectedutags selectedutags prepodnames podnames myselectedpods selectedpods errormessages warnmessages infomessages debugmessages
unset retval retval_logtask input logtask retval_tmpenv tmpenv
return
}
pollingmanagement()
{
###### which lab cluster do you want to choose - openshift or openshift2 #######################################################

if [[ -z "$tmpenv" ]]
then
	tmpenv=$(mktemp -t checklist.XXXXXXXXX)
	trap 'rm -f "$tmpenv"' exit
	trap 'exit 127' hup stop term
	dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "environment/lab/cluster selection" --clear --radiolist "select which openshift environment you want to perfom this task on." 0 0 0 "openshift" "lab1 environment" off "openshift2" "lab2 environment" off 2> "$tmpenv"
	retval=$?
	input=$(cat "$tmpenv")
	case $retval in
		0)      tmpenv=$(echo "$input")
			echo "$tmpenv" > tmpenv
			;;
		1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so will return to menu.')" 5 100
			return
			;;
		255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
			return
			;;
	esac

	tmpenv=${tmpenv,,}    # tolower
else
	echo "tempenv variable is already defined"
fi

if [[ -z "$taskdetail" ]]
then
	taskdetail=$(mktemp -t checklist.XXXXXXXXX)
	trap 'rm -f "$taskdetail"' exit
	trap 'exit 127' hup stop term
	dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "specify subtask" --clear --radiolist "How do you want to change polling." 0 80 0 "all" "all resources" off "bydevice" "select resources by device(s)" off "bytype" "select resources by type" off 2> "$taskdetail"

	retval=$?
	input=$(cat "$taskdetail")
	case $retval in
		0)      taskdetail=$(echo "$input")
			echo "$taskdetail" > taskdetail
			;;
		1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so will return to menu.')" 5 100
			return
			;;
		255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
			return
			;;
	esac

	taskdetail=${taskdetail,,}    # tolower
else
	echo "temptask variable is already defined"
fi

if [[ -z "$tmppoll" ]]
then
        tmppoll=$(mktemp -t checklist.XXXXXXXXX)
        trap 'rm -f "$tmppoll"' exit
        trap 'exit 127' hup stop term
        dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "environment/lab/cluster selection" --clear --radiolist "select polling interval." 0 0 0 "0" "Stop Polling" off "1" "1 minute" off "2" "2 minutes" off "5" "5 minutes" off "10" "10 minutes" off "15" "15 minutes" off "20" "20 minutes" off 2> "$tmppoll"
        retval=$?
        input=$(cat "$tmppoll")
        case $retval in
                0)      tmppoll=$(echo "$input")
                        echo "$tmppoll" > prepollprd
			prepollprd=$(cat prepollprd)
			if [[ "$prepollprd" == 0 ]]
			then
				pollprd=0
			elif [[ "$prepollprd" == 1 ]]
			then
				pollprd=60
			elif [[ "$prepollprd" == 2 ]]
                        then
				pollprd=120
			elif [[ "$prepollprd" == 5 ]]
                        then
                                pollprd=300
                        elif [[ "$prepollprd" == 10 ]]
                        then
                                pollprd=600
			elif [[ "$prepollprd" == 15 ]]
                        then
                                pollprd=900
                        elif [[ "$prepollprd" == 20 ]]
                        then
                                pollprd=1200
			else
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "No poll period selected." --msgbox "$(echo 'No poll period selected so will return to menu.')" 5 100
                        	return
			fi
			echo "$pollprd" &> pollprd
                        ;;
                1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "cancel was pressed." --msgbox "$(echo 'cancel was pressed so will return to menu.')" 5 100
                        return
                        ;;
                255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "esc was pressed." --msgbox "$(echo 'esc key was pressed so will return to menu.')" 5 100
                        return
                        ;;
        esac

else
        echo "tempenv variable is already defined"
fi

if [[ "$taskdetail" == 'all' ]]
then
	pollprd=$(cat pollprd)
	##### will get security cookie #####
	curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

	##### Get all resources in the system #####
	curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=*&projections=id,tenant,type,index,pollingInterval" | jq &> fix_pollingInterval.json

	##### Fix format in json payload file #####
	sed -i '/totalrecords/d' fix_pollingInterval.json
	sed -i 's/result/resources/' fix_pollingInterval.json

	##### Remove polling interval from all resources #####
	sed -i '/pollingInterval/d' fix_pollingInterval.json

	##### Add pollingInteval property to every resource #####
	sed -i "/index/a \"pollingInterval\":$pollprd," fix_pollingInterval.json

	##### adding 2 tabs before the property #####
	sed -i 's/"polling/     "polling/g' fix_pollingInterval.json

	##### This finishes formatting the file so it can be the payload needed #####
	cat fix_pollingInterval.json | jq | sed '/^      ]/d' | sed '/^    },/d' | sed '/^    {/d' | sed '/\"powerSupply\":/d' | sed '/\"interface\":/d' | sed '/\"cpu\":/d' | sed '/\"memory\":/d' | sed '/\"snmpagent\":/d' | sed '/\"fan\":/d' | sed '/\"temperature\":/d' | sed 's/^        }$/        },/g' | sed '/^    }/d' | awk '/,/{for(i=1;i<=n;i++)print s[i];n=0}{s[++n]=$0}END{p=1;while(i=index(substr(s[1],p),","))p+=i;s[1]=substr(s[1],1,p-2)substr(s[1],p);for(i=1;i<=n;i++)print s[i]}' &> final_fixed.json

	##### This is yet another stupid fix because it looks like PSL messed up on their code and this property is the only one that requires no space between the colon and value #####
	sed -i "s/\"pollingInterval\": $pollprd,/\"pollingInterval\":$pollprd,/g" final_fixed.json

	##### Remove quotes in pollingInterval if they exist #####
	sed -i "s/\"pollingInterval\": \"$pollprd\",/\"pollingInterval\":$pollprd,/g" final_fixed.json	

	##### Create/update the pollingInterval property for each resource #####
	curl -s -k --cookie mycookie -X POST -H "Content-Type: application/json" -d @final_fixed.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/create"

	##### Inform user that command is complete and prepare to verify #####
	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Validate Changes" --msgbox "$(echo 'All resources should now have pollingInterval property. The new json list of all resources\nwill be provided for verification')" 20 120

	##### Get all resources after change #####
	curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=*&projections=id,tenant,type,index,pollingInterval" | jq &> after_fix.json

	##### Present updated json file of resources for verification #####
	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Validate pollingInterval Property" --textbox after_fix.json 0 0

	##### Cleanup temp files #####
	#rm -f fix_pollingInterval.json after_fix.json


elif [[ "$taskdetail" == 'bydevice' ]]
then
	##### Set the pollprd variable #####
	pollprd=$(cat pollprd)

	##### get all devices #####
	curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources?type=device" | jq -r | sed 's/\"//g' | sed 's/ //g' | sed 's/{//g' | sed 's/}//g' | sed 's/,//g' | sed 's/\[//g' | sed 's/\]//g' | sed 's/id://' | sed '/tenant/d' | sed '/result/d' | sed '/total/d' | sed '/type/d' | sed '/resources/d' | sed '/./!d' | sort &> device_export

	# create checklist of devices for user to choose
	cat device_export | tr "\n" "," &> devices
	sed -i 's/,$//' devices
	devices=$(cat devices)

	MENU_OPTIONS=
	COUNT=0

	IFS="," read -a MYTYPES <<< $devices
	for i in "${MYTYPES[@]}"
	do
		COUNT=$[COUNT+1]
		MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
	done
		cmd=(dialog --separate-output --checklist "select the device(s) with the resources that you would like to change polling for:" 40 60 0)
		options=(${MENU_OPTIONS})
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		>myselecteddevices
		echo "$choices" >> myselecteddevices
		cat myselecteddevices | tr "," "\n" &> selecteddevices

		while read line
		do

			if [[ -z "$rselect" ]]
			then
				rselect=$(mktemp -t checklist.XXXXXXXXX)
				trap 'rm -f "$rselect"' exit
				trap 'exit 127' hup stop term
				dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "resource selection" --clear --radiolist "Select resources to change polling on for device $line ?" 0 80 0 "all" "all resources" off "selecttype" "view all by resource type" off "selectspecific" "select a specific resource to view" off 2> "$rselect"

				retval=$?
				input=$(cat "$rselect")
				case $retval in
					0)      rselect=$(echo "$input")
						echo "$rselect" > rselect
						;;
					1)      echo "cancel was pressed so script will exit."
						exit
						;;
				esac

				rselect=${rselect,,}    # tolower
			else
				echo "rselect variable is already defined"
			fi

			if [[ "$rselect" == 'all' ]]
			then
			##### will get security cookie #####
			curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

			##### Get all resources in the system #####
			curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=*&projections=id,tenant,type,index,pollingInterval" | jq &> fix_pollingInterval.json

			##### Fix format in json payload file #####
			sed -i '/totalrecords/d' fix_pollingInterval.json
			sed -i 's/result/resources/' fix_pollingInterval.json

			##### Remove polling interval from all resources #####
			sed -i '/pollingInterval/d' fix_pollingInterval.json

			##### Add pollingInteval property to every resource #####
			sed -i '/index/a "pollingInterval":$pollprd,' fix_pollingInterval.json

			##### adding 2 tabs before the property #####
			sed -i 's/"polling/     "polling/g' fix_pollingInterval.json

			##### This finishes formatting the file so it can be the payload needed #####
			cat fix_pollingInterval.json | jq | sed '/^      ]/d' | sed '/^    },/d' | sed '/^    {/d' | sed '/\"powerSupply\":/d' | sed '/\"interface\":/d' | sed '/\"cpu\":/d' | sed '/\"memory\":/d' | sed '/\"snmpagent\":/d' | sed '/\"fan\":/d' | sed '/\"temperature\":/d' | sed 's/^        }$/        },/g' | sed '/^    }/d' | awk '/,/{for(i=1;i<=n;i++)print s[i];n=0}{s[++n]=$0}END{p=1;while(i=index(substr(s[1],p),","))p+=i;s[1]=substr(s[1],1,p-2)substr(s[1],p);for(i=1;i<=n;i++)print s[i]}' &> final_fixed.json

			##### This is yet another stupid fix because it looks like PSL messed up on their code and this property is the only one that requires no space between the colon and value #####
			sed -i 's/\"pollingInterval\": $pollprd,/"pollingInterval":$pollprd,/g' final_fixed.json

			##### Create/update the pollingInterval property for each resource #####
			curl -s -k --cookie mycookie -X POST -H "Content-Type: application/json" -d @final_fixed.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/create"

			##### Inform user that command is complete and prepare to verify #####
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Validate Changes" --msgbox "$(echo 'All resources should now have pollingInterval property. The new json list of all resources\nwill be provided for verification')" 20 120

			##### Get all resources after change #####
			curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=*&projections=id,tenant,type,index,pollingInterval" | jq &> after_fix.json

			##### Present updated json file of resources for verification #####
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Validate pollingInterval Property" --textbox after_fix.json 0 0

			##### Cleanup temp files #####
			#rm -f fix_pollingInterval.json after_fix.json

					# get all properties for a specific device
					curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=$line&projections=*" | jq &> allresources.json

					##### list all resources #####
					dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "viewing all resources for device $line" --textbox allresources.json 80 100

			elif [[ "$rselect" == 'selecttype' ]]
			then
				curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=$line&projections=*" | jq -r '.[]' | grep "\[" | sed 's/://g' | sed 's/"//g' | sed 's/ //g' | sed 's/\[//g' | sed '1d' &> artypes

				# create checklist of devices for user to choose
				cat artypes | tr "\n" "," &> myartypes
				sed -i 's/,$//' myartypes
				myartypes=$(cat myartypes)

				MENU_OPTIONS=
				COUNT=0

				IFS="," read -a MYTYPES <<< $myartypes
				for i in "${MYTYPES[@]}"
				do
					COUNT=$[COUNT+1]
					MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
				done
				cmd=(dialog --separate-output --checklist "select the resource type(s) that you would like to change polling for:" 40 60 0)
				options=(${MENU_OPTIONS})
				choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
				>myselectedartypes
				echo "$choices" >> myselectedartypes
				cat myselectedartypes | tr "," "\n" &> selectedartypes

				while read arline
				do
					##### Get all selected resourceTypes in the system #####
					curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=$arline&relationship=contain&target_index=*&source_id=$line&projections=id,tenant,type,index,pollingInterval" | jq &> fix_pollingInterval.json

					##### Fix format in json payload file #####
					sed -i '/totalrecords/d' fix_pollingInterval.json
					sed -i 's/result/resources/' fix_pollingInterval.json

					##### Remove polling interval from all resources #####
					sed -i '/pollingInterval/d' fix_pollingInterval.json

					##### Add pollingInteval property to every resource #####
					sed -i '/index/a "pollingInterval":$pollprd,' fix_pollingInterval.json

					##### adding 2 tabs before the property #####
					sed -i 's/"polling/     "polling/g' fix_pollingInterval.json

					##### This finishes formatting the file so it can be the payload needed #####
					cat fix_pollingInterval.json | jq | sed '/^      ]/d' | sed '/^    },/d' | sed '/^    {/d' | sed '/\"powerSupply\":/d' | sed '/\"interface\":/d' | sed '/\"cpu\":/d' | sed '/\"memory\":/d' | sed '/\"snmpagent\":/d' | sed '/\"fan\":/d' | sed '/\"temperature\":/d' | sed 's/^        }$/        },/g' | sed '/^    }/d' | awk '/,/{for(i=1;i<=n;i++)print s[i];n=0}{s[++n]=$0}END{p=1;while(i=index(substr(s[1],p),","))p+=i;s[1]=substr(s[1],1,p-2)substr(s[1],p);for(i=1;i<=n;i++)print s[i]}' &> final_fixed.json

					##### This is yet another stupid fix because it looks like PSL messed up on their code and this property is the only one that requires no space between the colon and value #####
					# fyi...be aware that if you cat the file and pipe to jq you will see a space still existing but it is only because jq adds it and the file still has no space there
                                        sed -i '/pollingInterval/s/[[:space:]]//g' final_fixed.json

					##### Create/update the pollingInterval property for each resource #####
					curl -s -k --cookie mycookie -X POST -H "Content-Type: application/json" -d @final_fixed.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/create"

					##### Inform user that command is complete and prepare to verify #####
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Validate Changes" --msgbox "$(echo 'All resources should now have pollingInterval property. The new json list of all resources\nwill be provided for verification')" 20 120

					##### Get all selected resourceTypes in the system #####
					curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=$arline&relationship=contain&target_index=*&source_id=$line&projections=id,tenant,type,index,pollingInterval" | jq &> after_fix.json

					##### Present updated json file of resources for verification #####
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Validate pollingInterval Property" --textbox after_fix.json 0 0


				done < selectedartypes
				#return

			elif [[ "$rselect" == 'selectspecific' ]]
			then
			        ##### Set the pollprd variable #####
				pollprd=$(cat pollprd)

				##### Get resource ID's for checklist#####
				curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=*&relationship=contain&target_index=*&source_id=$line&projections=*" | jq | sed '/records/d' &> testme && cat testme | jq -r '.. | select(type == "object" and has("id")).id' &> rids

				# create checklist of resource ids for user to choose
				cat rids | tr "\n" "," &> myrids
				sed -i 's/,$//' myrids
				myrids=$(cat myrids)

				MENU_OPTIONS=
				COUNT=0

				IFS="," read -a MYTYPES <<< $myrids
				for i in "${MYTYPES[@]}"
				do
					COUNT=$[COUNT+1]
					MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
				done
				cmd=(dialog --separate-output --checklist "select the specific resource(s) id(s) from $line that you would like to change polling for:" 40 60 0)
				options=(${MENU_OPTIONS})
				choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
				>myselectedrids
				echo "$choices" >> myselectedrids
				cat myselectedrids | tr "," "\n" &> selectedrids
				sed -i 's/memorypool/memory/g' selectedrids
				sed -i 's/temperaturetestpoint/temperature/g' selectedrids
				sed -i 's/processorname/cpu/g' selectedrids
				sed -i 's/voltagetestpoint/powersupply/g' selectedrids


				while read rline
				do
					##### Set the pollprd variable #####
        				pollprd=$(cat pollprd)

					targettype=$(echo "$rline" | cut -d'_' -f2 | cut -d':' -f1)
					targetindex=$(echo "$rline" | cut -d'<' -f2 | cut -d'>' -f1)

					##### Get specific resource to change polling on #####
					curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=$targettype&relationship=contain&target_index=$targetindex&source_id=$line&projections=id,tenant,type,index,pollingInterval" | jq &> fix_pollingInterval.json

					##### Fix format in json payload file #####
					sed -i '/totalrecords/d' fix_pollingInterval.json
					sed -i 's/result/resources/' fix_pollingInterval.json

					##### Remove polling interval from all resources #####
					sed -i '/pollingInterval/d' fix_pollingInterval.json

					##### Add pollingInteval property to every resource #####
					sed -i "/index/a \"pollingInterval\":$pollprd," fix_pollingInterval.json

					##### adding 2 tabs before the property #####
					sed -i 's/"polling/	"polling/g' fix_pollingInterval.json

					##### This finishes formatting the file so it can be the payload needed #####
					cat fix_pollingInterval.json | jq | sed '/^      ]/d' | sed '/^    },/d' | sed '/^    {/d' | sed '/\"powerSupply\":/d' | sed '/\"interface\":/d' | sed '/\"cpu\":/d' | sed '/\"memory\":/d' | sed '/\"snmpagent\":/d' | sed '/\"fan\":/d' | sed '/\"temperature\":/d' | sed 's/^        }$/        },/g' | sed '/^    }/d' | awk '/,/{for(i=1;i<=n;i++)print s[i];n=0}{s[++n]=$0}END{p=1;while(i=index(substr(s[1],p),","))p+=i;s[1]=substr(s[1],1,p-2)substr(s[1],p);for(i=1;i<=n;i++)print s[i]}' &> final_fixed.json

					##### This is yet another stupid fix because it looks like PSL messed up on their code and this property is the only one that requires no space between the colon and value #####
					# fyi...be aware that if you cat the file and pipe to jq you will see a space still existing but it is only because jq adds it and the file still has no space there
					sed -i '/pollingInterval/s/[[:space:]]//g' final_fixed.json 
					#sed -i "s/\"pollingInterval\": $pollprd,/\"pollingInterval\":$pollprd,/g" final_fixed.json

					##### Create/update the pollingInterval property for each resource #####
					curl -s -k --cookie mycookie -X POST -H "Content-Type: application/json" -d @final_fixed.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/create"

					##### Inform user that command is complete and prepare to verify #####
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Validate Changes" --msgbox "$(echo 'All resources should now have pollingInterval property. The new json list of all resources\nwill be provided for verification')" 20 120

					##### Get all resources after change #####
					curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=$targettype&relationship=contain&target_index=$targetindex&source_id=$line&projections=id,tenant,type,index,pollingInterval" | jq &> after_fix.json

					##### Present updated json file of resources for verification #####
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Validate pollingInterval Property" --textbox after_fix.json 20 120


				done < selectedrids

			else
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "no matches" --msgbox "$(echo 'no matches were found so you will be returned to the menu')" 10 60
			fi
		done < selecteddevices
		#unset tmpenv tmptask rtargets mtask devices myrids rselect taskdetail myartypes rtypes myrtypes
		#rm -f tmpenv tmptask selectedtargets mtask rtargets myselectedtargets selectedtargets.json relation_targets selectedsources rsources myselectedsources selectedsource.json relation_sources taskdetail selecteddevices rselect myselecteddevices devices rids myrids myselectedrids selectedrids device_export allresources.json myartypes myselectedartypes selectedartypes *.resexport.json ids_to_be_deleted artypes byrtype.json retval_tmpenv rtypes myrtypes myselectedrtypes selectedrtypes device_export2 stype.json targettype targetindex



elif [[ "$taskdetail" == 'bytype' ]]
then
	##### create cookie #####
	curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

	##### get resourcetypes #####
	curl -s -k --cookie mycookie https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/insight/service/dataset/resourceTypes | jq -r '.[].resourceType' &> resourcetypes

	cat resourcetypes | tr "\n" "," &> rtypes
	sed -i 's/,$//' rtypes
	rtypes=$(cat rtypes)

	MENU_OPTIONS=
	COUNT=0

	IFS="," read -a MYTYPES <<< $rtypes
	for i in "${MYTYPES[@]}"
	do
		COUNT=$[COUNT+1]
		MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
	done
	cmd=(dialog --separate-output --checklist "select resource type(s) you would like to change polling for:" 40 60 0)
	options=(${MENU_OPTIONS})
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	>myselectedrtypes
	echo "$choices" >> myselectedrtypes
	cat myselectedrtypes | tr "," "\n" &> selectedrtypes

	##### create cookie #####
	curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

	##### view selected resourceTypes #####
	while read line
	do
		##### Get all selected resourceTypes in the system #####
		curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=$line&relationship=contain&target_index=*&source_id=*&projections=id,tenant,type,index,pollingInterval" | jq &> fix_pollingInterval.json

		##### Fix format in json payload file #####
		sed -i '/totalrecords/d' fix_pollingInterval.json
		sed -i 's/result/resources/' fix_pollingInterval.json

		##### Remove polling interval from all resources #####
		sed -i '/pollingInterval/d' fix_pollingInterval.json

		##### Add pollingInteval property to every resource #####
		sed -i "/index/a \"pollingInterval\":$pollprd," fix_pollingInterval.json

		##### adding 10 spaces before the property #####
		sed -i 's/"polling/		"polling/g' fix_pollingInterval.json

		##### This finishes formatting the file so it can be the payload needed #####
		cat fix_pollingInterval.json | jq | sed '/^      ]/d' | sed '/^    },/d' | sed '/^    {/d' | sed '/\"powerSupply\":/d' | sed '/\"interface\":/d' | sed '/\"cpu\":/d' | sed '/\"memory\":/d' | sed '/\"snmpagent\":/d' | sed '/\"fan\":/d' | sed '/\"temperature\":/d' | sed 's/^        }$/        },/g' | sed '/^    }/d' | awk '/,/{for(i=1;i<=n;i++)print s[i];n=0}{s[++n]=$0}END{p=1;while(i=index(substr(s[1],p),","))p+=i;s[1]=substr(s[1],1,p-2)substr(s[1],p);for(i=1;i<=n;i++)print s[i]}' &> final_fixed.json

		##### This is yet another stupid fix because it looks like PSL messed up on their code and this property is the only one that requires no space between the colon and value #####
		# fyi...be aware that if you cat the file and pipe to jq you will see a space still existing but it is only because jq adds it and the file still has no space there
		sed -i "/pollingInterval/s/\"pollingInterval\": /\"pollingInterval\":/g" final_fixed.json

		##### Create/update the pollingInterval property for each resource #####
		curl -s -k --cookie mycookie -X POST -H "Content-Type: application/json" -d @final_fixed.json "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/create"

		##### Inform user that command is complete and prepare to verify #####
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Validate Changes" --msgbox "$(echo 'All resources should now have pollingInterval property. The new json list of all resources\nwill be provided for verification')" 20 120

		##### Get all selected resourceTypes in the system #####
		curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/inventory/rest/topology/resources/descendants?source_type=device&target_type=$line&relationship=contain&target_index=*&source_id=*&projections=id,tenant,type,index,pollingInterval" | jq &> after_fix.json

		##### Present updated json file of resources for verification #####
		dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Validate pollingInterval Property" --textbox after_fix.json 0 0


	done < selectedrtypes
	rm -f tmpenv taskdetail prepollprd pollprd resourcetypes rtypes myselectedrtypes selectedrtypes fix_pollingInterval.json final_fixed.json after_fix.json final_fixed2.json
	return
else
	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "No variable found" --msgbox "$(echo 'Variable taskdetail not found. You will be returned to the menu')" 0 0
	return
fi
}
discoveryprofiles()
{
if [[ -z "$tmpenv" ]]
then
        tmpenv=$(mktemp -t checklist.XXXXXXXXX)
        trap 'rm -f "$tmpenv"' EXIT
        trap 'exit 127' HUP STOP TERM
        dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Environment/Lab/Cluster Selection" --radiolist "Select which openshift environment you want to work in." 0 80 0 "openshift" "Lab1 Environment" off "openshift2" "Lab2 Environment" off 2> "$tmpenv"
        retval=$?
	echo "$retval" > retval_tmpenv
	retval_tmpenv=$(cat retval_tmpenv)
        input=$(cat "$tmpenv")
        case $retval_tmpenv in
		1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Cancel was pressed." --msgbox "$(echo 'Cancel was pressed so script will exit.')" 5 90
			rm -f retval_tmpenv menu* tmpenv
                        unset retval retval_tmpenv input tmpenv
                        return
                        ;;
		255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Esc was pressed." --msgbox "$(echo 'Esc Key was pressed so will return to menu.')" 5 90
			rm -f retval_tmpenv menu* tmpenv
			unset retval retval_tmpenv input tmpenv
			return
                        ;;
		0)      tmpenv=$(echo "$input")
                        echo "$tmpenv" > tmpenv
			tmpenv=${tmpenv,,}    # tolower
                        ;;
		*)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Unauthorized Key was pressed." --msgbox "$(echo 'Unauthorized key was pressed so you will be returned to menu.')" 5 90
                        rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
                        unset retval retval_proftask input proftask retval_tmpenv input tmpenv
                        return
                        ;;
        esac

        #tmpenv=${tmpenv,,}    # tolower
else
        dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery profile list view for $tmpenv" --msgbox "$(echo 'tempenv variable is already defined')" 0 0
fi

if [[ -z "$proftask" ]]
then
	proftask=$(mktemp -t checklist.XXXXXXXXX)
	trap 'rm -f "$proftask"' EXIT
	trap 'exit 127' HUP STOP TERM
	dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Task Selection" --clear --radiolist "Select the task for working with SNMP-Discovery Profiles." 0 80 0 "View" "View SNMP-Discovery Profiles" off "Create" "Create SNMP-Discovery Profiles" off "Delete" "Delete SNMP-Discovery Profiles" off "Update" "Update SNMP-Discovery Profile" off "RunTest" "Run SNMP-Discovery Profile in Test Mode" off "Run" "Run SNMP-Discovery Profiles" off "Stop" "Stop Discovery for a profile" off "Import" "Import SNMP-Discovery Profiles" off "Log" "Get SNMP-Discovery Profile Log" off 2> "$proftask"
	retval=$?
	echo "$retval" > retval_proftask
	retval_proftask=$(cat retval_proftask)
	input=$(cat "$proftask")
	case $retval_proftask in
		1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Cancel was pressed." --msgbox "$(echo 'Cancel was pressed so script will exit.')" 5 50
			rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
                        unset retval retval_proftask input proftask retval_tmpenv input tmpenv
                        return
                        ;;
                255)     dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Esc was pressed." --msgbox "$(echo 'Esc Key was pressed so will return to menu.')" 5 50
			rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
                        unset retval retval_proftask input proftask retval_tmpenv input tmpenv
                        return
                        ;;
		0)      proftask=$(echo "$input")
                        echo "$proftask" > proftask
			proftask=${proftask,,}    # tolower
                        ;;
		*)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Unauthorized Key was pressed." --msgbox "$(echo 'Unauthorized key was pressed so you will be returned to menu.')" 5 60
                        rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
                        unset retval retval_proftask input proftask retval_tmpenv tmpenv
                        return
                        ;;
	esac

	#proftask=${proftask,,}    # tolower
else
        dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery Variable Already exists" --msgbox "$(echo 'proftask variable is already defined')" 0 0
fi

if [[ "$proftask" == 'view' ]]
then
	curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&Login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
	curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list| jq &> output.json
	grep NAME\" output.json | cut -d'"' -f4 &> profile_names

	# Create Checklist with names from each SNMP-Discovery profile name
	cat profile_names | tr "\n" "," &> prepfiles
	sed -i 's/,$//' prepfiles
	prepfiles=$(cat prepfiles)

	MENU_OPTIONS=
	COUNT=0

	IFS="," read -a MYTYPES <<< $prepfiles
	for i in "${MYTYPES[@]}"
	do
		COUNT=$[COUNT+1]
		MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
	done
		cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "Select the profile name you would like to view:" 0 60 0)
		options=(${MENU_OPTIONS})
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		>myselectedpfiles
		echo "$choices" >> myselectedpfiles
		cat myselectedpfiles|tr "," "\n" &> selectedpfiles
		#selectedpfiles=$(cat selectedpfiles)
		while read line
		do
			# Get each profile chosen and save to a json file
			curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list?name="$line" | jq &> $line.json
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Viewing TNCMP SNMP-Discovery profile $line" --msgbox "$(cat $line.json | jq)" 0 0
			rm -f $line.json	
		done < selectedpfiles
		rm -f proftask tmpenv selectedpfiles myselectedpfiles prepfiles profile_names output.json retval_tmpenv retval_proftask
		unset proftask tmpenv prepfiles retval_tmpenv retval_proftask
		rm -f menu*
		return

elif [[ "$proftask" == 'create' ]]
then
	if [[ -z "$createtask" ]]
	then
		createtask=$(mktemp -t checklist.XXXXXXXXX)
		trap 'rm -f "$createtask"' EXIT
		trap 'exit 127' HUP STOP TERM
		dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Create Task Selection" --clear --radiolist "Select how you want to create new SNMP-Discovery profile." 0 0 0 "Copy Existing" "Select existing profile to copy and edit" off "Create from file" "Create new SNMP-Discovery profile from json formated file" off 2> "$createtask"
		retval=$?
		input=$(cat "$createtask")
		case $retval in
			0)      createtask=$(echo "$input")
				echo "$createtask" > createtask
				;;
			1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Cancel was pressed." --msgbox "$(echo 'Cancel was pressed so script will exit.')" 5 90
				rm -f proftask tmpenv selectedpfiles myselectedpfiles prepfiles profile_names output.json retval_tmpenv retval_proftask
				unset proftask tmpenv prepfiles retval_tmpenv retval_proftask
				rm -f menu*
				return
                        	;;
                	255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Esc was pressed." --msgbox "$(echo 'Esc Key was pressed so will return to menu.')" 5 90
				rm -f proftask tmpenv selectedpfiles myselectedpfiles prepfiles profile_names output.json retval_tmpenv retval_proftask
                                unset proftask tmpenv prepfiles retval_tmpenv retval_proftask
                                rm -f menu*
                        	return
                        	;;
		esac

		createtask=${createtask,,}    # tolower
	else
		echo "audtask variable is already defined"
	fi

	case $createtask in

		"copy existing")
			curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&Login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
			curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list| jq &> output.json
			grep NAME\" output.json | cut -d'"' -f4 &> profile_names

			# Create Checklist with names from each SNMP-Discovery profile name
			cat profile_names | tr "\n" "," &> prepfiles
			sed -i 's/,$//' prepfiles
			prepfiles=$(cat prepfiles)

			MENU_OPTIONS=
			COUNT=0

			IFS="," read -a MYTYPES <<< $prepfiles
			for i in "${MYTYPES[@]}"
			do
				COUNT=$[COUNT+1]
				MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
			done
				cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "Select the profile name you would like to copy and edit:" 0 90 0)
				options=(${MENU_OPTIONS})
				choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
				>myselectedpfiles
				echo "$choices" >> myselectedpfiles
				cat myselectedpfiles|tr "," "\n" &> selectedpfiles
				#selectedpfiles=$(cat selectedpfiles)
				while read line
				do
					# Get each profile chosen and save to a json file
					curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list?name="$line" | jq &> $line.json
					# Make default changes to specific fields of the copied profile
					sed -i 's/"IS_RUNNING": ".*",/"IS_RUNNING": "Not run",/' $line.json
					sed -i 's/"LAST_RUN": .*,/"LAST_RUN": 0,/' $line.json
					sed -i 's/"STATUS": ".*",/"STATUS": "",/' $line.json
					sed -i 's/"FAILED_LIST": ".*",/"FAILED_LIST": "",/' $line.json

					# Allow user to edit the selected file
					dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Edit SNMP-Discovery Profile" --editbox $line.json 0 0 2> $line.edited.json

					# Get profile name from copied file to make sure the new file does not use the same name
					origprofilename=$(cat $line.json|grep NAME\"|cut -d'"' -f4)
					newprofilename=$(cat $line.edited.json|grep NAME\"|cut -d'"' -f4)

					# Check to make sure the profile names are different
					if [ "$origprofilename" == "$newprofilename" ]
					then
						dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Profile Name Check" --msgbox "$(echo 'The profile name in your new file cannot be the same as the old profile name\nYou will either need to use the update function of this tool or\nyou will need to repeat this task and make sure the names are different.\nYou will now be returned to the main menu.')" 10 90
						rm -f proftask tmpenv selectedpfiles myselectedpfiles prepfiles profile_names output.json retval_proftask $line.json $line.edited.json
						unset proftask tmpenv prepfiles origprofilename newprofilename
						return
					fi

					# Rename file with new profile name to be safe
					mv $line.edited.json $newprofilename.edited.json

					# Create the new SNMP-Discovery profile
					curl -s -k --cookie mycookie -X POST -H "Content-Type: application/json" -d @$newprofilename.edited.json https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/create

					# Get New SNMP-Discovery Profile
					curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list?name="$newprofilename" | jq &> $newprofilename.json

					# Display New SNMP-Discovery profile to user
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery Created Profile $newprofilename" --msgbox "$(cat $newprofilename.json)" 0 0
					rm -f $newprofilename.json $line.json $line.edited.json $newprofilename.edited.json
					unset newprofilename origprofilename
				done < selectedpfiles

			rm -f proftask tmpenv selectedpfiles myselectedpfiles prepfiles profile_names
			unset proftask tmpenv prepfiles
			rm -f menu*
			return
				
		;;
		"create from file")
			let i=0 # define counting variable
			W=() # define working array
			while read -r line; do # process file by file
				let i=$i+1
				W+=($i "$line")
			#done < <( ls -1 . )
			done < <( find . -maxdepth 1 -type f -name '*.json' )
			FILE=$(dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Select json formatted file to create profile" --menu "Chose one" 24 80 17 "${W[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
			RESULT=$?
			clear
			if [ $RESULT -eq 0 ]; then # Exit with OK
				echo "${W[$((FILE * 2 -1))]}" &> createfile 
				sed -i 's/.\///g' createfile
			else 
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Hit Escape" --msgbox "$(echo 'You hit Escape Key so you will exit be returned to the menu')" 5 90
                                return
			fi
			createfile=$(cat createfile)	
			profilename=$(cat $createfile|grep NAME\"|cut -d'"' -f4)
			echo "$profilename" > tester

			###  Define and Create cookie ###
			mycookie="/root/manual_upi/tncmp_cli_admin/mycookie"
			curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&Login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

			curl -s -k --cookie mycookie -X POST -H "Content-Type: application/json" -d @$createfile https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/create
			curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list | jq &> output.json
			cat output.json | grep -o $profilename &> query_result
			query_result=$(cat output.json | grep -o $profilename)
			if [[ "$query_result" == "$profilename" ]]
			then
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery Create Results" --msgbox "$(echo 'The SNMP-Discovery Profile was successfully created and it will now be fetched for you to validate.')" 5 90
				# Get Created SNMP-Discovery Profile
                        	curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list?name="$profilename" | jq &> latest.json
                        	# Display updated SNMP-Discovery profile to user
                        	dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery profile $profilename created." --msgbox "$(cat latest.json)" 0 0
			else
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery Create Results" --msgbox "$(echo 'The SNMP-Discovery Profile was not created. Please check what went wrong and try again')" 0 0
			fi
		;;
	esac	
	rm -f proftask tmpenv createfile createtask query_result tester latest.json output.json
        unset proftask tmpenv createfile createtask FILE RESULT profilename query_result
        rm -f menu*
        return


elif [[ "$proftask" == 'delete' ]]
then
	cookie="/root/manual_upi/tncmp_cli_admin/mycookie"
        curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&Login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
        curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list| jq &> output.json
        grep NAME\" output.json | cut -d'"' -f4 &> profile_names

        # Create Checklist with names from each SNMP-Discovery profile name
        cat profile_names | tr "\n" "," &> prepfiles
        sed -i 's/,$//' prepfiles
        prepfiles=$(cat prepfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< $prepfiles
        for i in "${MYTYPES[@]}"
        do
               COUNT=$[COUNT+1]
               MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
        done
               cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "Select the profile name(s) you would like to delete:" 0 60 0)
               options=(${MENU_OPTIONS})
               choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
               >myselectedpfiles
               echo "$choices" >> myselectedpfiles
               cat myselectedpfiles|tr "," "\n" &> selectedpfiles
               #selectedpfiles=$(cat selectedpfiles)
               while read line
               do

                      # Get each profile chosen and save to a json file
                        curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list?name="$line" | jq &> $line.json

                        # Ask user if they really want to delete profile
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --yesno "Are you sure you want to delete profile $line?" 5 60
			if [ $? -eq 0 ]
			then
				# Delete the SNMP-Discovery profile
                        	curl -s -k --cookie mycookie -X DELETE -H "Content-Type: application/json" -d @$line.json -k https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/delete
                        	#curl -s -k --cookie mycookie -X POST -H "Content-Type: application/json" -d @$line.edited.json https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/update
				# Confirmation of profile deletion
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Profile Deleted" --msgbox "$(echo "Profile $line has been deleted. Now fetching profile list to validate")" 5 90
                        	# List SNMP-Discovery profiles to user after the delete
				curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list| jq &> output.json
        			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery profile list view for $tmpenv" --msgbox "$(cat output.json | jq)" 0 0
                        	rm -f $line.json output.json

			elif [ $? -eq 1 ]
			then
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "HIT NO" --msgbox "$(echo 'You hit NO so profile $line will not be deleted')" 5 90
				continue
			else
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Hit Escape" --msgbox "$(echo 'You hit Escape Key so you will exit be returned to the menu')" 5 90 
				return
			fi

               done < selectedpfiles

        rm -f proftask tmpenv selectedpfiles myselectedpfiles prepfiles profile_names
        unset proftask tmpenv prepfiles
        rm -f menu*
        return

elif [[ "$proftask" == 'update' ]]
then
	curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&Login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
	curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list| jq &> output.json
	grep NAME\" output.json | cut -d'"' -f4 &> profile_names
	
	# Create Checklist with names from each SNMP-Discovery profile name
	cat profile_names | tr "\n" "," &> prepfiles
	sed -i 's/,$//' prepfiles
	prepfiles=$(cat prepfiles)

	MENU_OPTIONS=
	COUNT=0

	IFS="," read -a MYTYPES <<< $prepfiles
	for i in "${MYTYPES[@]}"
	do
		COUNT=$[COUNT+1]
		MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
	done
		cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "Select the profile name(s) you would like to update:" 0 60 0)
		options=(${MENU_OPTIONS})
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		>myselectedpfiles
		echo "$choices" >> myselectedpfiles
		cat myselectedpfiles|tr "," "\n" &> selectedpfiles
		#selectedpfiles=$(cat selectedpfiles)
		while read line
		do

			# Get each profile chosen and save to a json file
			curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list?name="$line" | jq &> $line.json
			
			# Allow user to edit the selected file
			dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Edit SNMP-Discovery Profile" --editbox $line.json 0 0 2> $line.edited.json

			# Update the SNMP-Discovery profile
			curl -s -k --cookie mycookie -X POST -H "Content-Type: application/json" -d @$line.edited.json https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/update
			# Get updated SNMP-Discovery Profile
			curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list?name="$line" | jq &> latest_$line.json

			# Display updated SNMP-Discovery profile to user
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery Updated profile $line" --msgbox "$(cat latest_$line.json)" 0 0
			rm -f latest_$line.json $line.json $line.edited.json
		done < selectedpfiles
		
        rm -f proftask tmpenv selectedpfiles myselectedpfiles prepfiles profile_names 
        unset proftask tmpenv prepfiles
        rm -f menu*
        return
	

		# Check json format of file is correct
	#   	jq . <file name> 1> /dev/null

	#	parse error: Invalid literal at line 2, column 0

elif [[ "$proftask" == 'runtest' ]]
then
	curl -s -k --cookie-jar mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&Login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
	curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list| jq &> output.json
	grep NAME\" output.json | cut -d'"' -f4 &> profile_names

	# Create Checklist with names from each SNMP-Discovery profile name
	cat profile_names | tr "\n" "," &> prepfiles
	sed -i 's/,$//' prepfiles
	prepfiles=$(cat prepfiles)

	MENU_OPTIONS=
	COUNT=0

	IFS="," read -a MYTYPES <<< $prepfiles
	for i in "${MYTYPES[@]}"
	do
		COUNT=$[COUNT+1]
		MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
	done
		cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "Select the profile name(s) you would like to do a test run on:" 0 0 0)
		options=(${MENU_OPTIONS})
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		>myselectedpfiles
		echo "$choices" >> myselectedpfiles
		cat myselectedpfiles|tr "," "\n" &> selectedpfiles
		#selectedpfiles=$(cat selectedpfiles)
		while read line
		do
			# Test run on snmp profile(s)
			curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/discovery?test-profile=$line

			 mystatus=$(curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list?name=$line | jq |grep IS_RUNNING|cut -d'"' -f4)

			# Inform the customer of the status of snmp-discovery profile run
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery profile Test run" --msgbox "$(echo "The snmp-discovery test run status for profile $line is $mystatus")" 10 100

			# Inform the customer that the log will be returned when the discovery is completed (The api call only returns the log file in base64 encoded text)
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery log" --msgbox "$(echo "The log will be returned when the selected profile test run has completed because tail does not work with the API.\nClick "OK" and Please be patient.")" 10 120

			#### This section contains a while loop that waits for the profiles run status ($status) to equal the $desired_status before retreiving the profile log
			#### This is due to the fact that the tncmp api call returning the log in base64 format so a tailbox could not be used

			# Set the API endpoint and desired status
			desired_status="Completed"

			# Set the maximum number of retries
			max_retries=5

			# Set the delay between retries (in seconds)
			retry_delay=20

			# Initialize the retry counter
			retry_count=0

			while true
			do
				# Make the API call
				response=$(curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list?name=$line | jq |grep IS_RUNNING|cut -d'"' -f4)
				# Extract the status from the response
				status=$(echo "$response")

				# Check if the desired status is returned
				if [ "$status" == "$desired_status" ]
				then
					# Get log for selected profile
					curl -s -k --cookie mycookie -H 'Authorization: Basic Base64EncodedKey' "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/discovery?logs=$line" |cut -d'{' -f2 | sed 's/^/{/' | jq |grep msg|cut -d'"' -f4 &> message
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery log for profile $line test run" --msgbox "$(cat message | base64 --decode)" 0 0
					break
				fi

				# Increment the retry counter
				retry_count=$((retry_count + 1))

				# Check if the maximum number of retries has been reached
				if [ "$retry_count" -ge "$max_retries" ]
				then
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery Test Run Error" --msgbox "$(echo 'Error: Maximum number of retries reached, returning to menu.')" 0 0
					return
				fi

				# Wait for the specified delay before retrying
				#echo "Retrying in $retry_delay seconds..."
				sleep $retry_delay
			done

			rm -f message
			unset response
		done < selectedpfiles

	rm -f proftask tmpenv selectedpfiles myselectedpfiles prepfiles profile_names output.json retval_proftask output.json
	unset proftask tmpenv prepfiles
	rm -f menu*
	return

elif [[ "$proftask" == 'run' ]]
then

	cookie="/root/manual_upi/tncmp_cli_admin/mycookie"
        curl -s -k --cookie-jar $cookie -X POST -d "j_username=npiadmin&j_password=npiadmin&Login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
        curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list| jq &> output.json
        grep NAME\" output.json | cut -d'"' -f4 &> profile_names

        # Create Checklist with names from each SNMP-Discovery profile name
        cat profile_names | tr "\n" "," &> prepfiles
        sed -i 's/,$//' prepfiles
        prepfiles=$(cat prepfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< $prepfiles
        for i in "${MYTYPES[@]}"
        do
                COUNT=$[COUNT+1]
                MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
        done
                cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "Select the profile name(s) you would like to run:" 0 0 0)
                options=(${MENU_OPTIONS})
                choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                >myselectedpfiles
                echo "$choices" >> myselectedpfiles
                cat myselectedpfiles|tr "," "\n" &> selectedpfiles
                #selectedpfiles=$(cat selectedpfiles)
		while read line
		do
			# Run profile 
			curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/discovery?run-profile=$line"

			mystatus=$(curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list?name=$line | jq |grep IS_RUNNING|cut -d'"' -f4)

			# Inform the customer of the status of snmp-discovery profile run 
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery profile run" --msgbox "$(echo "The snmp-discovery status for profile $line is $mystatus")" 0 0

			# Inform the customer that the log will be returned when the discovery is completed (The api call only returns the log file in base64 encoded text)
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery log" --msgbox "$(echo "The log will be returned when the selected profile run has completed because tail does not work with the API.\nClick "OK" and Please be patient.")" 10 60

			#### This section contains a while loop that waits for the profiles run status ($status) to equal the $desired_status before retreiving the profile log
			#### This is due to the fact that the tncmp api call returning the log in base64 format so a tailbox could not be used

			# Set the API endpoint and desired status
			desired_status="Completed"

			# Set the maximum number of retries
			max_retries=5

			# Set the delay between retries (in seconds)
			retry_delay=20

			# Initialize the retry counter
			retry_count=0

			while true
			do
				# Make the API call
				response=$(curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list?name=$line | jq |grep IS_RUNNING|cut -d'"' -f4)
				# Extract the status from the response
				status=$(echo "$response") 

				# Check if the desired status is returned
				if [ "$status" == "$desired_status" ]
				then
					# Get log for selected profile
					curl -s -k --cookie mycookie -H 'Authorization: Basic Base64EncodedKey' "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/discovery?logs=$line" |cut -d'{' -f2 | sed 's/^/{/' | jq |grep msg|cut -d'"' -f4 &> message

					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery log for profile $line" --msgbox "$(cat message | base64 --decode)" 0 0
					break
				fi

				# Increment the retry counter
				retry_count=$((retry_count + 1))

				# Check if the maximum number of retries has been reached
				if [ "$retry_count" -ge "$max_retries" ]
				then
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery Error" --msgbox "$(echo 'Error: Maximum number of retries reached, returning to menu.')" 0 0 
					return
				fi

				# Wait for the specified delay before retrying
				#echo "Retrying in $retry_delay seconds..."
				sleep $retry_delay
			done

			rm -f message 
			unset response
		done < selectedpfiles


        rm -f proftask tmpenv selectedpfiles myselectedpfiles prepfiles profile_names output.json retval_proftask output.json
        unset proftask tmpenv prepfiles
        rm -f menu*
        return

elif [[ "$proftask" == 'stop' ]]
then
	cookie="/root/manual_upi/tncmp_cli_admin/mycookie"
        curl -s -k --cookie-jar $cookie -X POST -d "j_username=npiadmin&j_password=npiadmin&Login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
        curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list| jq &> output.json
        grep NAME\" output.json | cut -d'"' -f4 &> profile_names

        # Create Checklist with names from each SNMP-Discovery profile name
        cat profile_names | tr "\n" "," &> prepfiles
        sed -i 's/,$//' prepfiles
        prepfiles=$(cat prepfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< $prepfiles
        for i in "${MYTYPES[@]}"
        do
                COUNT=$[COUNT+1]
                MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
        done
                cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "Select the profile name(s) you would like to stop:" 0 0 0)
                options=(${MENU_OPTIONS})
                choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                >myselectedpfiles
                echo "$choices" >> myselectedpfiles
                cat myselectedpfiles|tr "," "\n" &> selectedpfiles
                selectedpfilescount=$(cat selectedpfiles|wc -l)
                while read line
                do
                        mystatus=$(curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list?name=$line | jq |grep IS_RUNNING|cut -d'"' -f4)
			 # Check if the profile is not running and if not check the selectedpfilescount to go back to menu or continue 
			if [ "$mystatus" == "Completed" ]
			then
				 # Inform the customer of the status of snmp-discovery profile run
				dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery profile is not running" --msgbox "$(echo "The snmp-discovery profile $line is not running so no need to stop it.")" 5 90	
				if [ "$selectedpfilescount" -lt 2 ]
				then
					rm -f proftask tmpenv selectedpfiles myselectedpfiles prepfiles profile_names output.json retval_proftask output.json
					unset proftask tmpenv prepfiles
					return
				else
					continue	
				fi
			fi

                        # Stop profile
                        curl -s -k --cookie mycookie "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/discovery?stop-profile=$line"

                        # Inform the customer that the log will be returned when the discovery is stopped
                        dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery Stopping profile $line" --msgbox "$(echo "The profile $line is being stopped and the log will be returned after the selected profile has been stopped.\nClick "OK" and Please be patient.")" 5 90

			# Set the API endpoint and desired status
                        desired_status="Completed"

                        # Set the maximum number of retries
                        max_retries=5

                        # Set the delay between retries (in seconds)
                        retry_delay=20

                        # Initialize the retry counter
                        retry_count=0

                        while true
                        do
                                # Make the API call
                                response=$(curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list?name=$line | jq |grep IS_RUNNING|cut -d'"' -f4)
                                # Extract the status from the response
                                status=$(echo "$response")

                                # Check if the desired status is returned
                                if [ "$status" == "$desired_status" ]
                                then
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery stopped profile run" --msgbox "$(echo "The snmp-discovery for profile $line has been stopped\nand the log will be returned so you can validate")" 5 90

                                        # Get log for selected profile
                                        curl -s -k --cookie mycookie -H 'Authorization: Basic Base64EncodedKey' "https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/discovery?logs=$line" |cut -d'{' -f2 | sed 's/^/{/' | jq |grep msg|cut -d'"' -f4 &> message

                                        dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery log for profile $line" --msgbox "$(cat message | base64 --decode)" 0 0
                                        break
                                fi

                                # Increment the retry counter
                                retry_count=$((retry_count + 1))

                                # Check if the maximum number of retries has been reached
                                if [ "$retry_count" -ge "$max_retries" ]
                                then
                                        dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery Error" --msgbox "$(echo 'Error: Maximum number of retries reached, returning to menu.')" 0 0
                                        return
                                fi

                                # Wait for the specified delay before retrying
                                #echo "Retrying in $retry_delay seconds..."
                                sleep $retry_delay
                        done

                        rm -f message
                        unset response
		done < selectedpfiles


        rm -f proftask tmpenv selectedpfiles myselectedpfiles prepfiles profile_names output.json retval_proftask output.json
        unset proftask tmpenv prepfiles
        rm -f menu*
        return

	curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/discovery?stop-profile="profile_name"	
elif [[ "$proftask" == 'import' ]]
then
	let i=0 # define counting variable
	W=() # define working array
	while read -r line; do # process file by file
		let i=$i+1
		W+=($i "$line")
	#done < <( ls -1 . )
	done < <( find . -maxdepth 1 -type f -name '*.json' )
	FILE=$(dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Select json formatted file to create profile" --menu "Chose one" 24 80 17 "${W[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
	RESULT=$?
	#       echo "$FILE" &> result
	clear
	if [ $RESULT -eq 0 ]; then # Exit with OK
		echo "${W[$((FILE * 2 -1))]}" &> createfile
		sed -i 's/.\///g' createfile
	fi
	createfile=$(cat createfile)
	profilename=$(cat $createfile|grep NAME\"|cut -d'"' -f4)
	echo "$profilename" > tester

	###  Define and Create cookie ###
	mycookie="/root/manual_upi/tncmp_cli_admin/mycookie"
	curl -s -k --cookie-jar $mycookie -X POST -d "j_username=npiadmin&j_password=npiadmin&Login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

	rm -f proftask tmpenv createfile tester
        unset proftask tmpenv createfile profilename
        rm -f menu*
        return

elif [[ "$proftask" == 'log' ]]
then
	cookie="/root/manual_upi/tncmp_cli_admin/mycookie"
        curl -s -k --cookie-jar $cookie -X POST -d "j_username=npiadmin&j_password=npiadmin&Login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check
        curl -s -k --cookie mycookie https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/snmp-discovery/rest/profile/list| jq &> output.json
        grep NAME\" output.json | cut -d'"' -f4 &> profile_names

        # Create Checklist with names from each SNMP-Discovery profile name
        cat profile_names | tr "\n" "," &> prepfiles
        sed -i 's/,$//' prepfiles
        prepfiles=$(cat prepfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< $prepfiles
        for i in "${MYTYPES[@]}"
        do
                COUNT=$[COUNT+1]
                MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
        done
                cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "Select the profile name(s) you would like to see logs for:" 0 80 0)
                options=(${MENU_OPTIONS})
                choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                >myselectedpfiles
                echo "$choices" >> myselectedpfiles
                cat myselectedpfiles|tr "," "\n" &> selectedpfiles
                #selectedpfiles=$(cat selectedpfiles)
                while read line
                do

                        # Get log for selected profile
			curl -s -k --cookie mycookie -H 'Authorization: Basic Base64EncodedKey' "https://dashboard-tncmp.apps.openshift.dfw.accuoss.com/snmp-discovery/rest/discovery?logs=$line" |cut -d'{' -f2 | sed 's/^/{/' | jq |grep msg|cut -d'"' -f4 &> message 
			dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP SNMP-Discovery log for profile $line" --msgbox "$(cat message | base64 --decode)" 0 0

                        rm -f $line.json
                done < selectedpfiles

        rm -f proftask tmpenv selectedpfiles myselectedpfiles prepfiles profile_names
        unset proftask tmpenv prepfiles
        rm -f menu*
        return


else
	echo -n "unknown"
fi
}
modelfiles()
{
if [[ -z "$tmpenv" ]]
then
        tmpenv=$(mktemp -t checklist.XXXXXXXXX)
        trap 'rm -f "$tmpenv"' EXIT
        trap 'exit 127' HUP STOP TERM
        dialog --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Environment/Lab/Cluster Selection" --radiolist "Select which openshift environment you want to view model files for." 0 80 0 "openshift" "Lab1 Environment" off "openshift2" "Lab2 Environment" off 2> "$tmpenv"
        retval=$?
        echo "$retval" > retval_tmpenv
        retval_tmpenv=$(cat retval_tmpenv)
        input=$(cat "$tmpenv")
        case $retval_tmpenv in
                1)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Cancel was pressed." --msgbox "$(echo 'Cancel was pressed so script will exit.')" 5 50
                        rm -f retval_tmpenv menu* tmpenv
                        unset retval retval_tmpenv input tmpenv
                        return
                        ;;
                255)    dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Esc was pressed." --msgbox "$(echo 'Esc Key was pressed so will return to menu.')" 5 50
                        rm -f retval_tmpenv menu* tmpenv
                        unset retval retval_tmpenv input tmpenv
                        return
                        ;;
                0)      tmpenv=$(echo "$input")
                        echo "$tmpenv" > tmpenv
                        tmpenv=${tmpenv,,}    # tolower
                        ;;
                *)      dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Unauthorized Key was pressed." --msgbox "$(echo 'Unauthorized key was pressed so you will be returned to menu.')" 5 60
                        rm -f retval_proftask proftask retval_tmpenv tmpenv menu*
                        unset retval retval_proftask input proftask retval_tmpenv input tmpenv
                        return
                        ;;
        esac

        tmpenv=${tmpenv,,}    # tolower
else
        dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "TNCMP Model file view for $tmpenv" --msgbox "$(echo 'tempenv variable is already defined')" 0 0
fi

################# Get tech packs by name and process into check list for the user 

	cookie="/root/manual_upi/tncmp_cli_admin/mycookie"
        curl -s -k --cookie-jar $cookie -X POST -d "j_username=npiadmin&j_password=npiadmin&Login=" https://dashboard-tncmp.apps.$tmpenv.dfw.accuoss.com/dashboards/j_security_check

	# Get all tech packs by name
	curl -s -k --cookie mycookie --request GET --url http://pack-service-tncmp.apps.$tmpenv.dfw.accuoss.com/v1/Default/storage/pack-jars | jq -r '.[].packId' &> packnames

        # Create Checklist with names from each SNMP-Discovery profile name
        cat packnames | tr "\n" "," &> prepfiles
        sed -i 's/,$//' prepfiles
        prepfiles=$(cat prepfiles)

        MENU_OPTIONS=
        COUNT=0

        IFS="," read -a MYTYPES <<< "$prepfiles"
        for i in "${MYTYPES[@]}"
        do
                COUNT=$[COUNT+1]
                MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
        done
		cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "Select the tech pack(s) that you want to view model files for:" 0 90 0)
		options=(${MENU_OPTIONS})
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		>myselectedpfiles
		echo "$choices" >> myselectedpfiles
		cat myselectedpfiles|tr "," "\n" &> selectedpfiles
		cat selectedpfiles | wc -l &> mypackcount
		packcount=$(cat mypackcount)
		while read line
		do
			packname=$line
			# Get all model files from tech pack(s) and save to a json file
			curl -s -k --cookie mycookie --request GET --url http://pack-service-tncmp.apps.$tmpenv.dfw.accuoss.com/v1/Default/storage/pack-contents/$packname | jq 'map( select(.fileType | contains("model") ) )' &> packmodels
			# Check if only brackets are returned and delete them 
			sed -i 's/\[\]//g' packmodels
			checkpack=$(cat packmodels)
			packcount=$[packcount-1]

			if [[ ! -z "$checkpack" ]]
			then
				# Get the model file names and create a checklist for the user
				grep filePath packmodels | cut -d'"' -f4 |cut -d'/' -f5 &> modelfiles

				cat modelfiles | tr "\n" "," &> premodelfiles
				sed -i 's/,$//' premodelfiles
				premodelfiles=$(cat premodelfiles)

				MENU_OPTIONS=
				COUNT=0

				IFS="," read -a MYTYPES <<< $premodelfiles
				for i in "${MYTYPES[@]}"
				do
					COUNT=$[COUNT+1]
					MENU_OPTIONS="${MENU_OPTIONS} $i ${COUNT} off "
				done
					cmd=(dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --separate-output --checklist "Select the Model file(s) that you want to view:" 0 90 0)
					options=(${MENU_OPTIONS})
					choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
					>myselectedmodelfiles
					echo "$choices" >> myselectedmodelfiles
					cat myselectedmodelfiles|tr "," "\n" &> selectedmodelfiles
					while read line
					do
						modelfiletype=$(grep filePath packmodels | grep "$line" | cut -d'"' -f4 |cut -d'/' -f3)
						getfileid=$(grep -B2 "$line" packmodels | grep fileId | cut -d'"' -f4)	

						# Show contents of the model file and define the modeltype					
						curl -s -k --cookie mycookie --request GET --url http://pack-service-tncmp.apps.$tmpenv.dfw.accuoss.com/v1/Default/storage/pack-contents/$packname/$getfileid | jq -r '.content.textFileContent' &> output.json
						dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Viewing $line which is model type: $modelfiletype" --msgbox "$(cat output.json)" 0 0

					done < selectedmodelfiles
				#rm -f proftask tmpenv selectedpfiles myselectedpfiles prepfiles profile_names
                                #unset proftask tmpenv prepfiles
			else
				if [[ "$packcount" -gt 0 ]]
				then
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Tech Pack has no model files" --msgbox "$(echo 'Tech Pack $line does not contain any model files.\nSkipping to next Pack')" 10 60
					continue
				else
					dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Tech Pack has no model files" --msgbox "$(echo 'Tech Pack $line does not contain any model files.\nSince this is the last Pack, you will be returned to the menu')" 10 60
					return
				fi
			fi



		done < selectedpfiles

		rm -f tmpenv selectedpfiles myselectedpfiles prepfiles packmodels modelfiles premodelfiles myselectedmodelfiles selectedmodelfiles output.json   
		unset tmpenv prepfiles premodelfiles modelfiletype getfileid packname
		rm -f menu*
		return
}
deletetempfiles()
{
    rm -f *.$$
    rm -f menuchoices*
    #rm -f tmpenv selectedpfiles myselectedpfiles prepfiles packmodels modelfiles premodelfiles myselectedmodelfiles selectedmodelfiles output.json
    #unset tmpenv prepfiles premodelfiles modelfiletype getfileid packname
}
##############################################################################
#                           MAIN STRATS HERE                                 #
##############################################################################
trap 'deletetempfiles'  EXIT|exit     # calls deletetempfiles function on #exit
while :
do

	dialog --clear --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "MAIN MENU" --menu "Use [UP/DOWN] key to select playbook to deploy" 0 0 0 \
	"TNCMP-Resource-Management" "Manage Resources in TNCMP" \
	"TNCMP-Group-Management" "Manage Groups in TNCMP" \
	"TNCMP-Metric-Management" "Manage Metrics in TNCMP" \
	"TNCMP-Alarm-Management" "Manage Alarm Rules, targets and target groups in TNCMP" \
	"TNCMP-Threshold-Management" "Manage Thresholds in TNCMP" \
	"TNCMP-Polling-Management" "Manage Polling in TNCMP" \
	"TNCMP-SNMP-Discovery" "Create, Delete, View SNMP-Discovery Profiles" \
	"TNCMP-Model-Files" "View Tech Pack Model Files" \
	"View-Dir-Trees" "Tree view of selected TNCMP Directories" \
	"View-TNCMP-Status" "View Status of TNCMP components in OpenShift" \
	"Troubleshoot-Pod-Logs" "Troubleshoot TNCMP by using specific pod logs" \
	"Exit" "Exit Menu" 2> menuchoices.$$

	retopt=$?
	choice=$(cat menuchoices.$$)

	case $retopt in

		0) case $choice in
			"TNCMP-Resource-Management")       resourcemanagement ;;
			"TNCMP-Group-Management")          groupmanagement ;;
			"TNCMP-Metric-Management")         metricmanagement ;;
			"TNCMP-Alarm-Management")          alarmmanagement ;;
			"TNCMP-Threshold-Management")      threshmanagement ;;
			"TNCMP-Polling-Management")        pollingmanagement ;;
			"TNCMP-SNMP-Discovery")            discoveryprofiles;;
			"TNCMP-Model-Files")               modelfiles;;
			"View-Dir-Trees")                  getnfsdirtrees;;
			"View-TNCMP-Status")               viewstatus;;
			"Troubleshoot-Pod-Logs")           tspodlogs;;
			"Exit")                            clear; exit 0;;
		   esac 
		   ;;

		*)clear ; deletetempfiles ; exit ;;
	esac
done
