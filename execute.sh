#!/bin/bash

#############################################################
#Author:    Chiva Song
#Team:      Service Enablement
#Position:  Prepaid Administrator
#Year:      2020
##############################################################

source ./functions.sh

TEMP_DATA=""
FILE_TEMP="temp"

COMMAND=$(grep -e ":1" data | cut -d ":" -f 1 > temp 2>/dev/null);
COUNTER=0;
if $COMMAND; then
	while IFS= read -r line
	do
		TEMP_DATA+="${line} "
	done < "$FILE_TEMP"
	echo "$TEMP_DATA" > "$FILE_TEMP"

	for CONTROL in `cat "$FILE_TEMP"`
	do 
		case $CONTROL in
			"control_001ab") 		COUNTER=$(($COUNTER+2));	control_001ab;;
			"control_002ab")		COUNTER=$(($COUNTER+2));	control_002ab;;
			"control_003ab")		COUNTER=$(($COUNTER+2));	control_003ab;;
			"control_004ab")		COUNTER=$(($COUNTER+2));	control_004ab;;
			"control_005ab")		COUNTER=$(($COUNTER+2));	control_005ab;;
			"control_006ab")		COUNTER=$(($COUNTER+2));	control_006ab;;
			"control_007ab")		COUNTER=$(($COUNTER+2));	control_007ab;;
			"control_008ab")		COUNTER=$(($COUNTER+2));	control_008ab;;
			"control_010")			COUNTER=$(($COUNTER+1));	control_010;;
			"control_011")			COUNTER=$(($COUNTER+1));	control_011;;
			"control_012")			COUNTER=$(($COUNTER+1));	control_012;;
			"control_014")			COUNTER=$(($COUNTER+1));	control_014;;
			"control_015")			COUNTER=$(($COUNTER+1));	control_015;;
			"control_016")			COUNTER=$(($COUNTER+1));	control_016;;
			"control_017")			COUNTER=$(($COUNTER+1));	control_017;;
			"control_018")			COUNTER=$(($COUNTER+1));	control_018;;
			"control_019")			COUNTER=$(($COUNTER+1));	control_019;;
			"control_020")			COUNTER=$(($COUNTER+1));	control_020;;
			"control_021")			COUNTER=$(($COUNTER+1));	control_021;;
			"control_022")			COUNTER=$(($COUNTER+1));	control_022;;
			"control_023")			COUNTER=$(($COUNTER+1));	control_023;;
			"control_024")			COUNTER=$(($COUNTER+1));	control_024;;
			"control_028")			COUNTER=$(($COUNTER+1));	control_028;;
			"control_032")			COUNTER=$(($COUNTER+1));	control_032;;
			"control_033")			COUNTER=$(($COUNTER+1));	control_033;;
			"control_035ab")		COUNTER=$(($COUNTER+2));	control_035ab;;
			"control_036ab")		COUNTER=$(($COUNTER+2));	control_036ab;;
			"control_037abc")		COUNTER=$(($COUNTER+3));	control_037abc;;
			"control_039ab")		COUNTER=$(($COUNTER+2));	control_039ab;;
			"control_042")			COUNTER=$(($COUNTER+1));	control_042;;
			"control_043")			COUNTER=$(($COUNTER+1));	control_043;;
			"control_048c")			COUNTER=$(($COUNTER+1));	control_048c;;
			"control_050ab")		COUNTER=$(($COUNTER+2));	control_050ab;;
			"control_050cd")		COUNTER=$(($COUNTER+2));	control_050cd;;
			"control_050ef")		COUNTER=$(($COUNTER+2));	control_050ef;;
			"control_050g")			COUNTER=$(($COUNTER+1));	control_050g;;
			"control_050h")			COUNTER=$(($COUNTER+1));	control_050h;;
			"control_050i")			COUNTER=$(($COUNTER+1));	control_050i;;
			"control_050j")			COUNTER=$(($COUNTER+1));	control_050j;;
			"control_050k")			COUNTER=$(($COUNTER+1));	control_050k;;
			"control_056b")			COUNTER=$(($COUNTER+1));	control_056b;;
			"control_056c")			COUNTER=$(($COUNTER+1));	control_056c;;
			"control_056d")			COUNTER=$(($COUNTER+1));	control_056d;;
			"control_062b")			COUNTER=$(($COUNTER+1));	control_062b;;
			"control_064")			COUNTER=$(($COUNTER+1));	control_064;;
			"control_069")			COUNTER=$(($COUNTER+1));	control_069;;
			"control_072")			COUNTER=$(($COUNTER+1));	control_072;;
			"control_073")			COUNTER=$(($COUNTER+1));	control_073;;
			"control_074")			COUNTER=$(($COUNTER+1));	control_074;;
			"control_075")			COUNTER=$(($COUNTER+1));	control_075;;
			"control_076")			COUNTER=$(($COUNTER+1));	control_076;;
			"control_077ab")		COUNTER=$(($COUNTER+2));	control_077ab;;
			"control_078abcd")		COUNTER=$(($COUNTER+4));	control_078abcd;;
			"control_079abcd")		COUNTER=$(($COUNTER+4));	control_079abcd;;
			"control_080abcd")		COUNTER=$(($COUNTER+4));	control_080abcd;;
			"control_081abcd")		COUNTER=$(($COUNTER+4));	control_081abcd;;
			"control_082abcd")		COUNTER=$(($COUNTER+4));	control_082abcd;;
			"control_083ab")		COUNTER=$(($COUNTER+2));	control_083ab;;
			"control_084ab")		COUNTER=$(($COUNTER+2));	control_084ab;;
			"control_085abcd")		COUNTER=$(($COUNTER+4));	control_085abcd;;
			"control_086ab")		COUNTER=$(($COUNTER+2));	control_086ab;;
			"control_087abcd")		COUNTER=$(($COUNTER+4));	control_087abcd;;
			"control_088abcd")		COUNTER=$(($COUNTER+4));	control_088abcd;;
			"control_089")			COUNTER=$(($COUNTER+1));	control_089;;
			"control_090")			COUNTER=$(($COUNTER+1));	control_090;;
			"control_093abcd")		COUNTER=$(($COUNTER+4));	control_093abcd;;
			"control_094")			COUNTER=$(($COUNTER+1));	control_094;;
			"control_095abc")		COUNTER=$(($COUNTER+3));	control_095abc;;
			"control_100")			COUNTER=$(($COUNTER+1));	control_100;;
			"control_101abc")		COUNTER=$(($COUNTER+3));	control_101abc;;
			"control_102")			COUNTER=$(($COUNTER+1));	control_102;;
			"control_103")			COUNTER=$(($COUNTER+1));	control_103;;
			"control_104")			COUNTER=$(($COUNTER+1));	control_104;;
			"control_105abcdefghij")	COUNTER=$(($COUNTER+10));	control_105abcdefghij;;
			"control_106abcdefghij")	COUNTER=$(($COUNTER+10));	control_106abcdefghij;;
			"control_107abcdefghijkl")	COUNTER=$(($COUNTER+12));	control_107abcdefghijkl;;
			"control_108abcdefgh")		COUNTER=$(($COUNTER+8));	control_108abcdefgh;;
			"control_109abcdef")		COUNTER=$(($COUNTER+6));	control_109abcdef;;
			"control_110abcdef")		COUNTER=$(($COUNTER+6));	control_110abcdef;;
			"control_111abcdefghij")	COUNTER=$(($COUNTER+10));	control_111abcdefghij;;
			"control_112abcdefgh")		COUNTER=$(($COUNTER+8));	control_112abcdefgh;;
			"control_113")				COUNTER=$(($COUNTER+1));	control_113;;
			"control_114abcd")			COUNTER=$(($COUNTER+4));	control_114abcd;;
			"control_115abcd")			COUNTER=$(($COUNTER+4));	control_115abcd;;
			"control_116abcd")			COUNTER=$(($COUNTER+4));	control_116abcd;;
			"control_117ab")			COUNTER=$(($COUNTER+2));	control_117ab;;
			"control_118abcdefgh")		COUNTER=$(($COUNTER+8));	control_118abcdefgh;;
			"control_120abc")			COUNTER=$(($COUNTER+3));	control_120abc;;
			"control_121abcdefghijklmno")	COUNTER=$(($COUNTER+15));	control_121abcdefghijklmno;;
			"control_122a")				COUNTER=$(($COUNTER+1));	control_122a;;
			"control_123a")				COUNTER=$(($COUNTER+1));	control_123a;;
			"control_124ab")			COUNTER=$(($COUNTER+2));	control_124ab;;
			"control_126")				COUNTER=$(($COUNTER+1));	control_126;;
			"control_128")				COUNTER=$(($COUNTER+1));	control_128;;
			"control_129")				COUNTER=$(($COUNTER+1));	control_129;;
			"control_130")				COUNTER=$(($COUNTER+1));	control_130;;
			"control_131")				COUNTER=$(($COUNTER+1));	control_131;;
			"control_132")				COUNTER=$(($COUNTER+1));	control_132;;
			"control_133")				COUNTER=$(($COUNTER+1));	control_133;;
			"control_134")				COUNTER=$(($COUNTER+1));	control_134;;
			"control_135abcd")			COUNTER=$(($COUNTER+4));	control_135abcd;;
			"control_136")				COUNTER=$(($COUNTER+1));	control_136;;
			"control_137")				COUNTER=$(($COUNTER+1));	control_137;;
			"control_138")				COUNTER=$(($COUNTER+1));	control_138;;
			"control_139")				COUNTER=$(($COUNTER+1));	control_139;;
			"control_140")				COUNTER=$(($COUNTER+1));	control_140;;
			"control_141")				COUNTER=$(($COUNTER+1));	control_141;;
			"control_142")				COUNTER=$(($COUNTER+1));	control_142;;
			"control_143")				COUNTER=$(($COUNTER+1));	control_143;;
			"control_144")				COUNTER=$(($COUNTER+1));	control_144;;
			"control_145")				COUNTER=$(($COUNTER+1));	control_145;;
			"control_146")				COUNTER=$(($COUNTER+1));	control_146;;
			"control_147ab")			COUNTER=$(($COUNTER+2));	control_147ab;;
			"control_150")				COUNTER=$(($COUNTER+1));	control_150;;
			"control_151")				COUNTER=$(($COUNTER+1));	control_151;;
			"control_152abcd")			COUNTER=$(($COUNTER+4));	control_152abcd;;
			"control_153")				COUNTER=$(($COUNTER+1));	control_153;;
			"control_154")				COUNTER=$(($COUNTER+1));	control_154;;
			"control_155ab")			COUNTER=$(($COUNTER+2));	control_155ab;;
			"control_156")				COUNTER=$(($COUNTER+1));	control_156;;
			"control_157")				COUNTER=$(($COUNTER+1));	control_157;;
			"control_158")				COUNTER=$(($COUNTER+1));	control_158;;
			"control_159")				COUNTER=$(($COUNTER+1));	control_159;;
			"control_160")				COUNTER=$(($COUNTER+1));	control_160;;
			"control_161")				COUNTER=$(($COUNTER+1));	control_161;;
			"control_163")				COUNTER=$(($COUNTER+1));	control_163;;
			"control_165ab")			COUNTER=$(($COUNTER+2));	control_165ab;;
			"control_166ab")			COUNTER=$(($COUNTER+2));	control_166ab;;
			"control_167")				COUNTER=$(($COUNTER+1));	control_167;;
			"control_168ab")			COUNTER=$(($COUNTER+2));	control_168ab;;
			"control_170a")				COUNTER=$(($COUNTER+1));	control_170a;;
			"control_171ab")			COUNTER=$(($COUNTER+2));	control_171ab;;
			"control_172a")				COUNTER=$(($COUNTER+1));	control_172a;;
			"control_173a")				COUNTER=$(($COUNTER+1));	control_173a;;
			"control_174")				COUNTER=$(($COUNTER+1));	control_174;;
			"control_175a")				COUNTER=$(($COUNTER+1));	control_175a;;
			"control_175b")				COUNTER=$(($COUNTER+1));	control_175b;;
			"control_119")				COUNTER=$(($COUNTER+1));	control_119;;
			*);;
		esac
	done
	
	gawk -i inplace '!a[$0]++'  /etc/audit/audit.rules
	gawk -i inplace '!a[$0]++'  /etc/ntp.conf
	gawk -i inplace '!a[$0]++'  /etc/fstab
	load_audit_configuration

	echo "Total Applied=$COUNTER";
fi


