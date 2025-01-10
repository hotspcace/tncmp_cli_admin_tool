#!/bin/bash

#set -x

# Get log files
#oc logs snmp-collector-0 &> collectorlog0
#oc logs snmp-collector-1 &> collectorlog1
#oc logs snmp-collector-2 &> collectorlog2

#_active=true, agent=32.222.236.17:161, deviceModel=7450, displayName=WPNGCT0000W (lsw01.wpng.ct)-3/2/6, id=WPNGCT0000W_interface:<105054208>, ifAdminStatus=1, ifAlias=_VAC_, SWNDCT43, 1GE, 101LS/GE1N  /WPNGCT0000W/SWNDCT43, 32.222.140.20, ifDescr=3/2/6, 10/100/Gig Ethernet SFP, "_VAC_, SWNDCT43, 1GE, 101LS/GE1N  /WPNGCT0000W/SWNDCT43, 32.222.140.20, ifIndex=105054208, ifName=3/2/6, ifOperStatus=1, ifSpeed=1000000000, ifType=6, index=105054208, lastUpdate=1736198655592, network=BNG, pollingInterval=900, region=East, remoteContext=, service=U-verse, shortDisplayName=3/2/6, state=CT, tenant=base, tid=UNKNOWN, type=interface, vendor=Nokia

#cat collectorlog0 | grep "Value of parameters ArrayBuffer" | grep interface | cut -d'{' -f2 | cut -d'}' -f1 | sort | uniq &> pcollectorlog0 
#cat collectorlog1 | grep "Value of parameters ArrayBuffer" | grep interface | cut -d'{' -f2 | cut -d'}' -f1 | sort | uniq &> pcollectorlog1
#cat collectorlog2 | grep "Value of parameters ArrayBuffer" | grep interface | cut -d'{' -f2 | cut -d'}' -f1 | sort | uniq &> pcollectorlog2

#cat pcollectorlog0 | sort -u > pcollectorlog0.tmp && mv pcollectorlog0.tmp pcollectorlog0
#cat pcollectorlog1 | sort -u > pcollectorlog1.tmp && mv pcollectorlog1.tmp pcollectorlog1
#cat pcollectorlog2 | sort -u > pcollectorlog2.tmp && mv pcollectorlog2.tmp pcollectorlog2

>fcollector0
>fcollector0_2
>fcollector1
>fcollector1_2
>fcollector2
>fcollector2_2

while read line
do
	#astatus=$(echo "$line" | cut -d',' -f1 | cut -d'=' -f2)
	#agent=$(echo "$line" | cut -d',' -f2 | cut -d'=' -f2)
	#deviceModel=$(echo "$line" | cut -d',' -f3 | cut -d'=' -f2)
	#displayName=$(echo "$line" | cut -d',' -f4 | cut -d'=' -f2)
	id=$(echo "$line" | cut -d',' -f5 | cut -d'=' -f2)
	deviceId=$(echo "$line" | cut -d',' -f5 | cut -d'=' -f2 | cut -d'_' -f1)
	#ifAdminStatus=$(echo "$line" | cut -d',' -f6 | cut -d'=' -f2)
	#ifAlias=$(echo "$line" | cut -d',' -f7 | cut -d'=' -f2)
	#ifDescr=$(echo "$line" | cut -d',' -f12 | cut -d'=' -f2)
	#ifIndex=$(echo "$line" | cut -d',' -f20 | cut -d'=' -f2)
	#ifName=$(echo "$line" | cut -d',' -f21| cut -d'=' -f2)
	#ifOperStatus=$(echo "$line" | cut -d',' -f22| cut -d'=' -f2)
	#ifSpeed=$(echo "$line" | cut -d',' -f23 | cut -d'=' -f2)
	#ifType=$(echo "$line" | cut -d',' -f24 | cut -d'=' -f2)
	#index=$(echo "$line" | cut -d',' -f25 | cut -d'=' -f2)
	#lastUpdate=$(echo "$line" | cut -d',' -f26 | cut -d'=' -f2)
	#network=$(echo "$line" | cut -d',' -f27 | cut -d'=' -f2)
	#pollingInterval=$(echo "$line" | cut -d',' -f28 | cut -d'=' -f2)
	#region=$(echo "$line" | cut -d',' -f29 | cut -d'=' -f2)
	#remoteContext=$(echo "$line" | cut -d',' -f30 | cut -d'=' -f2)
	#service=$(echo "$line" | cut -d',' -f31 | cut -d'=' -f2)
	#shortDisplayName=$(echo "$line" | cut -d',' -f32 | cut -d'=' -f2)
	#state=$(echo "$line" | cut -d',' -f33 | cut -d'=' -f2)
	#tenant=$(echo "$line" | cut -d',' -f34 | cut -d'=' -f2)
	#tid=$(echo "$line" | cut -d',' -f35 | cut -d'=' -f2)
	#rtype=$(echo "$line" | cut -d',' -f36 | cut -d'=' -f2)
	#vendor=$(echo "$line" | cut -d',' -f37 | cut -d'=' -f2)
	#collector1_count=$(grep $id pcollectorlog1 | wc -l)
	#collector2_count=$(grep $id pcollectorlog2 | wc -l)

	echo "Resource: $id DeviceName: $deviceId" >> fcollector0 

done < pcollectorlog0 
cat fcollector0 | sort -n > fcollector0.tmp && mv fcollector0.tmp fcollector0

while read line
do
        #astatus=$(echo "$line" | cut -d',' -f1 | cut -d'=' -f2)
        #agent=$(echo "$line" | cut -d',' -f2 | cut -d'=' -f2)
        #deviceModel=$(echo "$line" | cut -d',' -f3 | cut -d'=' -f2)
        #displayName=$(echo "$line" | cut -d',' -f4 | cut -d'=' -f2)
        id=$(echo "$line" | cut -d',' -f5 | cut -d'=' -f2)
        deviceId=$(echo "$line" | cut -d',' -f5 | cut -d'=' -f2 | cut -d'_' -f1)
        #ifAdminStatus=$(echo "$line" | cut -d',' -f6 | cut -d'=' -f2)
        #ifAlias=$(echo "$line" | cut -d',' -f7 | cut -d'=' -f2)
        #ifDescr=$(echo "$line" | cut -d',' -f12 | cut -d'=' -f2)
        #ifIndex=$(echo "$line" | cut -d',' -f20 | cut -d'=' -f2)
        #ifName=$(echo "$line" | cut -d',' -f21| cut -d'=' -f2)
        #ifOperStatus=$(echo "$line" | cut -d',' -f22| cut -d'=' -f2)
        #ifSpeed=$(echo "$line" | cut -d',' -f23 | cut -d'=' -f2)
        #ifType=$(echo "$line" | cut -d',' -f24 | cut -d'=' -f2)
        #index=$(echo "$line" | cut -d',' -f25 | cut -d'=' -f2)
        #lastUpdate=$(echo "$line" | cut -d',' -f26 | cut -d'=' -f2)
        #network=$(echo "$line" | cut -d',' -f27 | cut -d'=' -f2)
        #pollingInterval=$(echo "$line" | cut -d',' -f28 | cut -d'=' -f2)
        #region=$(echo "$line" | cut -d',' -f29 | cut -d'=' -f2)
        #remoteContext=$(echo "$line" | cut -d',' -f30 | cut -d'=' -f2)
        #service=$(echo "$line" | cut -d',' -f31 | cut -d'=' -f2)
        #shortDisplayName=$(echo "$line" | cut -d',' -f32 | cut -d'=' -f2)
        #state=$(echo "$line" | cut -d',' -f33 | cut -d'=' -f2)
        #tenant=$(echo "$line" | cut -d',' -f34 | cut -d'=' -f2)
        #tid=$(echo "$line" | cut -d',' -f35 | cut -d'=' -f2)
        #rtype=$(echo "$line" | cut -d',' -f36 | cut -d'=' -f2)
        #vendor=$(echo "$line" | cut -d',' -f37 | cut -d'=' -f2)
        #collector0_count=$(grep $id pcollectorlog0 | wc -l)
        #collector2_count=$(grep $id pcollectorlog2)

	echo "Resource: $id DeviceName: $deviceId" >> fcollector1

done < pcollectorlog1
cat fcollector1 | sort -n > fcollector1.tmp && mv fcollector1.tmp fcollector1

while read line
do
        #astatus=$(echo "$line" | cut -d',' -f1 | cut -d'=' -f2)
        #agent=$(echo "$line" | cut -d',' -f2 | cut -d'=' -f2)
        #deviceModel=$(echo "$line" | cut -d',' -f3 | cut -d'=' -f2)
        #displayName=$(echo "$line" | cut -d',' -f4 | cut -d'=' -f2)
        id=$(echo "$line" | cut -d',' -f5 | cut -d'=' -f2)
        deviceId=$(echo "$line" | cut -d',' -f5 | cut -d'=' -f2 | cut -d'_' -f1)
        #ifAdminStatus=$(echo "$line" | cut -d',' -f6 | cut -d'=' -f2)
        #ifAlias=$(echo "$line" | cut -d',' -f7 | cut -d'=' -f2)
        #ifDescr=$(echo "$line" | cut -d',' -f12 | cut -d'=' -f2)
        #ifIndex=$(echo "$line" | cut -d',' -f20 | cut -d'=' -f2)
        #ifName=$(echo "$line" | cut -d',' -f21| cut -d'=' -f2)
        #ifOperStatus=$(echo "$line" | cut -d',' -f22| cut -d'=' -f2)
        #ifSpeed=$(echo "$line" | cut -d',' -f23 | cut -d'=' -f2)
        #ifType=$(echo "$line" | cut -d',' -f24 | cut -d'=' -f2)
        #index=$(echo "$line" | cut -d',' -f25 | cut -d'=' -f2)
        #lastUpdate=$(echo "$line" | cut -d',' -f26 | cut -d'=' -f2)
        #network=$(echo "$line" | cut -d',' -f27 | cut -d'=' -f2)
        #pollingInterval=$(echo "$line" | cut -d',' -f28 | cut -d'=' -f2)
        #region=$(echo "$line" | cut -d',' -f29 | cut -d'=' -f2)
        #remoteContext=$(echo "$line" | cut -d',' -f30 | cut -d'=' -f2)
        #service=$(echo "$line" | cut -d',' -f31 | cut -d'=' -f2)
        #shortDisplayName=$(echo "$line" | cut -d',' -f32 | cut -d'=' -f2)
        #state=$(echo "$line" | cut -d',' -f33 | cut -d'=' -f2)
        #tenant=$(echo "$line" | cut -d',' -f34 | cut -d'=' -f2)
        #tid=$(echo "$line" | cut -d',' -f35 | cut -d'=' -f2)
        #rtype=$(echo "$line" | cut -d',' -f36 | cut -d'=' -f2)
        #vendor=$(echo "$line" | cut -d',' -f37 | cut -d'=' -f2)
        #collector0_count=$(grep $id pcollectorlog0 | wc -l)
        #collector1_count=$(grep $id pcollectorlog1)

	echo "Resource: $id DeviceName: $deviceId" >> fcollector2
	#echo "Resource: $id DeviceName: $deviceId : Collector0 Count: $collector0_count Collector1 Count: $collector1_count" >> fcollector2_2


done < pcollectorlog2
cat fcollector2 | sort -n > fcollector2.tmp && mv fcollector2.tmp fcollector2

while read nline
do
	id0=$(echo "$nline"  | cut -d' ' -f2)
	id00=$(echo "$nline"  | cut -d' ' -f4)
	collector1_dup_count=$(grep $id0 fcollector1 | wc -l)
	collector1_split_count=$(grep $id00 fcollector1 | wc -l)
	collector2_dup_count=$(grep $id0 fcollector2 | wc -l)
	collector2_split_count=$(grep $id00 fcollector2 | wc -l)

        echo "$nline Collector1 Dupe Count: $collector1_dup_count Collector1 Split Count: $collector1_split_count Collector2 Dupe Count: $collector2_dup_count Collector2 Split Count: $collector2_split_count" >> fcollector0_2

done < fcollector0
cat fcollector0_2 | sort -n > fcollector0_2.tmp && mv fcollector0_2.tmp fcollector0_2
unset collector1_count collector2_count

while read nline
do
	id1=$(echo "$nline"  | cut -d' ' -f2)
	id11=$(echo "$nline"  | cut -d' ' -f4)
	collector0_dup_count=$(grep $id1 fcollector0 | wc -l)
	collector0_split_count=$(grep $id11 fcollector0 | wc -l)
	collector2_dup_count=$(grep $id1 fcollector2 | wc -l)
	collector2_split_count=$(grep $id11 fcollector2 | wc -l)

        echo "$nline Collector0 Dupe Count: $collector0_dup_count Collector0 Split Count: $collector0_split_count Collector2 Dupe Count: $collector2_dup_count Collector2 Split Count: $collector2_split_count" >> fcollector1_2

done < fcollector1
cat fcollector1_2 | sort -n > fcollector1_2.tmp && mv fcollector1_2.tmp fcollector1_2
unset collector0_count collector2_count 


while read nline
do
	id2=$(echo "$nline"  | cut -d' ' -f2)
	id22=$(echo "$nline"  | cut -d' ' -f4)
	collector0_dup_count=$(grep $id2 fcollector0 | wc -l)
	collector0_split_count=$(grep $id22 fcollector0 | wc -l)
	collector1_dup_count=$(grep $id2 fcollector1 | wc -l)
	collector1_split_count=$(grep $id22 fcollector1 | wc -l)
        echo "$nline Collector0 Dupe Count: $collector0_dup_count Collector0 Split Count: $collector0_split_count Collector1 Dupe Count: $collector1_dup_count Collector1 Split Count: $collector1_split_count" >> fcollector2_2

done < fcollector2
cat fcollector2_2 | sort -n > fcollector2_2.tmp && mv fcollector2_2.tmp fcollector2_2

##### Create dialog report and show to the user #####
cat fcollector0_2 | cut -d' ' -f4 | sort | uniq &> collector0_devices
cat fcollector1_2 | cut -d' ' -f4 | sort | uniq &> collector1_devices
cat fcollector2_2 | cut -d' ' -f4 | sort | uniq &> collector2_devices

>dialog_report

col0_device_count=$(cat collector0_devices | wc -l)
col1_device_count=$(cat collector1_devices | wc -l)
col2_device_count=$(cat collector2_devices | wc -l)
col0_resource_count=$(cat fcollector0_2 | wc -l)
col1_resource_count=$(cat fcollector1_2 | wc -l)
col2_resource_count=$(cat fcollector2_2 | wc -l)

echo "###########################" >> dialog_report
echo "Resources By SNMP Collector" >> dialog_report
echo "###########################" >> dialog_report

echo " " >> dialog_report >> dialog_report

echo "Resource Summary:" >> dialog_report 
echo " " >> dialog_report >> dialog_report 
echo "Collector 0 Device Count: $col0_device_count" >> dialog_report
echo "Collector 0 Resource Count: $col0_resource_count" >> dialog_report
echo " " >> dialog_report
echo "Collector 1 Device Count: $col1_device_count" >> dialog_report
echo "Collector 1 Resource Count: $col1_resource_count" >> dialog_report
echo " " >> dialog_report
echo "Collector 2 Device Count: $col2_device_count" >> dialog_report
echo "Collector 2 Resource Count: $col2_resource_count" >> dialog_report
echo " " >> dialog_report
echo " " >> dialog_report

echo "Collector 0 Resources:" >> dialog_report
echo "======================" >> dialog_report 
echo " " >> dialog_report 

while read line
do
	echo "Device Name: $line:" >> dialog_report		
	cat fcollector0_2 | grep $line | cut -d' ' -f1,2 | sort --version-sort >> dialog_report
	echo " " >> dialog_report
done < collector0_devices
echo " " >> dialog_report
echo " " >> dialog_report

echo "Collector 1 Resources:" >> dialog_report
echo "======================" >> dialog_report
echo " " >> dialog_report

while read line
do
        echo "$line:" >> dialog_report
        cat fcollector1_2 | grep $line | cut -d' ' -f1,2 | sort --version-sort >> dialog_report
	echo " " >> dialog_report
done < collector1_devices
echo " " >> dialog_report
echo " " >> dialog_report


echo "Collector 2 Resources:" >> dialog_report
echo "======================" >> dialog_report
echo " " >> dialog_report

while read line
do
        echo "$line:" >> dialog_report
        cat fcollector2_2 | grep $line | cut -d' ' -f1,2 | sort --version-sort >> dialog_report
	echo " " >> dialog_report
done < collector2_devices
echo " " >> dialog_report
echo " " >> dialog_report

dialog --no-collapse --backtitle "TNCMP-CLI-ADMIN-TOOL" --title "Resources Per Collector Report" --textbox dialog_report 60 90
