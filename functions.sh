#!/bin/bash

#############################################################
#Author:    Chiva Song
#Team:      Service Enablement
#Position:  Prepaid Administrator
#Year:      2020
##############################################################

############### Start Global Function ########################
function  load_audit_configuration {
    #clear exist autidt rules
    auditctl -D
    #converting file /etc/audit/audit.rules to UNIX format ...
    dos2unix /etc/audit/audit.rules
    #load configuration from /etc/audit/audit.rules
    auditctl -R /etc/audit/audit.rules
    rcauditd restart
}
############### End Global Function ########################

############### Start Feedback from HW to disabled ###########
function control_001ab {
    TAGA="001a - 1.1.1.1 (L1) Ensure mounting of cramfs filesystems is disabled - /etc/modprobe.d/* (Secondary)"
    TAGB="001b - 1.1.1.1 (L1) Ensure mounting of cramfs filesystems is disabled - modprobe (Secondary)"
    if [ ! -f "/etc/modprobe.d/CIS.conf-bk" ]; then 
        cp /etc/modprobe.d/CIS.conf /etc/modprobe.d/CIS.conf-bk 
    fi
    ### add install cramfs /bin/true to /etc/modprobe.d/CIS.conf
    if [ -f "/etc/modprobe.d/CIS.conf-bk" ]; then
        if output=$(grep "^install\s\cramfs\s\/bin/true$" /etc/modprobe.d/CIS.conf); then
                echo "Applied - $TAGA"
                echo "Applied - $TAGB"
        else
            echo "install cramfs /bin/true" >> /etc/modprobe.d/CIS.conf;
            ### unload the cramfs module
            if output=$(rmmod cramfs); then
                    echo "Applied - $TAGA"
                    echo "Applied - $TAGB"
            else
                    echo "Failed - $TAGA"
                    echo "Failed - $TAGB"
                    sleep 1
            fi
        fi
    fi
}

function control_002ab {
    TAGA="002a - 1.1.1.2 (L1) Ensure mounting of freevxfs filesystems is disabled - /etc/modprobe.d/* (Secondary)"
    TAGB="002b - 1.1.1.2 (L1) Ensure mounting of freevxfs filesystems is disabled - modprobe (Secondary)"
    if [ ! -f "/etc/modprobe.d/CIS.conf-bk" ]; then 
        cp /etc/modprobe.d/CIS.conf /etc/modprobe.d/CIS.conf-bk 
    fi
    if [ -f "/etc/modprobe.d/CIS.conf-bk" ]; then
            ### add install freevxfs /bin/true to /etc/modprobe.d/CIS.conf
            if output=$(grep "^install\s\freevxfs\s\/bin/true$" /etc/modprobe.d/CIS.conf); then
                    echo "Applied - $TAGA";
                    echo "Applied - $TAGB";
            else
                echo "install freevxfs /bin/true" >> /etc/modprobe.d/CIS.conf;
                ### unload the cramfs module
                if output=$(rmmod freevxfs); then
                        echo "Applied - $TAGA";
                        echo "Applied - $TAGB"
                else
                        echo "Failed - $TAGA";
                        echo "Failed - $TAGB"
                fi                    
            fi
    fi
}

function control_003ab {
    TAGA="003a - 1.1.1.3 (L1) Ensure mounting of jffs2 filesystems is disabled - /etc/modprobe.d/* (Secondary)"
    TAGB="003b - 1.1.1.3 (L1) Ensure mounting of jffs2 filesystems is disabled - modprobe (Secondary)"
    if [ ! -f "/etc/modprobe.d/CIS.conf-bk" ]; then 
        cp /etc/modprobe.d/CIS.conf /etc/modprobe.d/CIS.conf-bk 
    fi
    if [ -f "/etc/modprobe.d/CIS.conf-bk" ]; then
        if output=$(grep "^install\s\jffs2\s\/bin/true$" /etc/modprobe.d/CIS.conf); then
                echo "Applied - $TAGA";
                echo "Applied - $TAGB";            
        else
            echo "install jffs2 /bin/true" >> /etc/modprobe.d/CIS.conf;
            ### unload the cramfs module
            if output=$(rmmod jffs2); then
                    echo "Applied - $TAGA";
                    echo "Applied - $TAGB";    
            else
                    echo "Failed - $TAGA";
                    echo "Failed - $TAGB";
            fi
        fi
    fi
}

function control_004ab {
    TAGA="004a - 1.1.1.4 (L1) Ensure mounting of hfs filesystems is disabled - /etc/modprobe.d/* (Secondary)"
    TAGB="004b - 1.1.1.4 (L1) Ensure mounting of hfs filesystems is disabled - modprobe (Secondary)"
    if [ ! -f "/etc/modprobe.d/CIS.conf-bk" ]; then 
        cp /etc/modprobe.d/CIS.conf /etc/modprobe.d/CIS.conf-bk 
    fi
    if [ -f "/etc/modprobe.d/CIS.conf-bk" ]; then
        ### add install hfs /bin/true to /etc/modprobe.d/CIS.conf
        if output=$(grep "^install\s\hfs\s\/bin/true$" /etc/modprobe.d/CIS.conf); then
                echo "Applied - $TAGA"; 
                echo "Applied - $TAGB";
        else
            echo "install hfs /bin/true" >> /etc/modprobe.d/CIS.conf;
            ### unload the cramfs module
            if output=$(rmmod hfs); then
                    echo "Applied - $TAGA"; 
                    echo "Applied - $TAGB";
            else
                    echo "Failed - $TAGA"; 
                    echo "Failed - $TAGB"; 
            fi  
        fi
    fi
}

function control_005ab {
    TAGA="005a - 1.1.1.5 (L1) Ensure mounting of hfsplus filesystems is disabled - /etc/modprobe.d/* (Secondary)"
    TAGB="005b - 1.1.1.5 (L1) Ensure mounting of hfsplus filesystems is disabled - modprobe (Secondary)"
    if [ ! -f "/etc/modprobe.d/CIS.conf-bk" ]; then 
        cp /etc/modprobe.d/CIS.conf /etc/modprobe.d/CIS.conf-bk 
    fi
    if [ -f "/etc/modprobe.d/CIS.conf-bk" ]; then
        ### add install hfsplus /bin/true to /etc/modprobe.d/CIS.conf
        if output=$(grep "^install\s\hfsplus\s\/bin/true$" /etc/modprobe.d/CIS.conf); then
                echo "Applied - $TAGA"; 
                echo "Applied - $TAGB"
        else
            echo "install hfsplus /bin/true" >> /etc/modprobe.d/CIS.conf;
            ### unload the cramfs module
            if output=$(rmmod hfsplus); then
                echo "Applied - $TAGA"; 
                echo "Applied - $TAGB"
            else
                echo "Failed - $TAGA"; 
                echo "Failed - $TAGB"
            fi  
        fi
    fi
}

function control_006ab {
    TAGA="006a - 1.1.1.6 (L1) Ensure mounting of squashfs filesystems is disabled - /etc/modprobe.d/* (Secondary)"
    TAGB="006b - 1.1.1.6 (L1) Ensure mounting of squashfs filesystems is disabled - modprobe (Secondary)"
    if [ ! -f "/etc/modprobe.d/CIS.conf-bk" ]; then 
        cp /etc/modprobe.d/CIS.conf /etc/modprobe.d/CIS.conf-bk 
    fi
    if [ -f "/etc/modprobe.d/CIS.conf-bk" ]; then
        if output=$(grep "^install\s\squashfs\s\/bin/true$" /etc/modprobe.d/CIS.conf); then
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";
        else
            echo "install squashfs /bin/true" >> /etc/modprobe.d/CIS.conf;
            ### unload the cramfs module
            if output=$(rmmod squashfs); then
                echo "Applied - $TAGA"; 
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGA"; 
                echo "Failed - $TAGB";
            fi
        fi
    fi
}

function control_007ab {
    TAGA="007a - 1.1.1.7 (L1) Ensure mounting of udf filesystems is disabled - /etc/modprobe.d/* (Secondary)"
    TAGB="007b - 1.1.1.7 (L1) Ensure mounting of udf filesystems is disabled - modprobe (Secondary)"
    if [ ! -f "/etc/modprobe.d/CIS.conf-bk" ]; then 
        cp /etc/modprobe.d/CIS.conf /etc/modprobe.d/CIS.conf-bk 
    fi
    if [ -f "/etc/modprobe.d/CIS.conf-bk" ]; then
        ### add install udf /bin/true to /etc/modprobe.d/CIS.conf
        if output=$(grep "^install\s\udf\s\/bin/true$" /etc/modprobe.d/CIS.conf); then
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";
        else
            echo "install udf /bin/true" >> /etc/modprobe.d/CIS.conf;
            ### unload the cramfs module
            if output=$(rmmod udf); then
                echo "Applied - $TAGA"; 
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGA"; 
                echo "Failed - $TAGB";  
            fi  
        fi
    fi
}

function control_008ab {
    TAGA="008a - 1.1.1.8 (L1) Ensure mounting of FAT filesystems is disabled - /etc/modprobe.d/* (Secondary)"
    TAGB="008b - 1.1.1.8 (L1) Ensure mounting of FAT filesystems is disabled - modprobe (Secondary)"
    if [ ! -f "/etc/modprobe.d/CIS.conf-bk" ]; then 
        cp /etc/modprobe.d/CIS.conf /etc/modprobe.d/CIS.conf-bk 
    fi
    if [ -f "/etc/modprobe.d/CIS.conf-bk" ]; then
        if output=$(grep "^install\s\vfat\s\/bin/true$" /etc/modprobe.d/CIS.conf); then
                echo "Applied - $TAGA"; 
                echo "Applied - $TAGB";
        else
            echo "install vfat /bin/true" >> /etc/modprobe.d/CIS.conf;
            ### unload the cramfs module
            if output=$(rmmod vfat); then
                echo "Applied - $TAGA"; 
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGA"; 
                echo "Failed - $TAGB";
            fi
        fi
    fi
}
############### End Feedback from HW to disabled ###########

function control_010 {
    TAG="010 - 1.1.3 (L1) Ensure nodev option set on /tmp partition (Mandatory)";
    if output=$(mount | grep "/tmp[[:blank:]]"); then
        if [ -s /etc/fstab ]; then
            MATCHRAW=$(grep "/tmp[[:blank:]]" /etc/fstab)
            if output=$(mount | grep "/tmp[[:blank:]]" | grep "nodev"); then
                echo "Applied - $TAG : nodev option exists";
            else
                OPTIONS=$(echo $MATCHRAW | cut -d " " -f 4)
                NEW_OPTIONS="${OPTIONS},nodev"
                NEW_MATCHRAW=$(echo "$MATCHRAW" | sed "s/$OPTIONS/$NEW_OPTIONS/")
                MATCH=$(echo "$MATCHRAW" | sed 's/\//\\\//g')
                NEW_MATCH=$(echo "$NEW_MATCHRAW" | sed 's/\//\\\//g')
                sed -i "s/$MATCH/$NEW_MATCH/" /etc/fstab
                if output=$(mount -o remount,nodev /tmp); then
                        echo "Applied - $TAG";
                else
                        echo "Failed - $TAG";
                fi
            fi
        else
                echo "Failed - $TAG : /etc/fstab does not exist";
        fi
    else
            echo "Failed - $TAG : No separate partition for /tmp";
    fi
}

function control_011 {
    TAG="011 - 1.1.4 (L1) Ensure nosuid option set on /tmp partition (Mandatory)";
    PARTITION=0

    if output=$(mount | grep "/tmp[[:blank:]]"); then
        if [ -s /etc/fstab ]; then
            MATCHRAW=$(grep "/tmp[[:blank:]]" /etc/fstab)
            if output=$(mount | grep "/tmp[[:blank:]]" | grep "nosuid"); then
                echo "Applied - $TAG : nosuid option exists";        
            else
                OPTIONS=$(echo $MATCHRAW | cut -d " " -f 4)
                NEW_OPTIONS="${OPTIONS},nosuid"
                NEW_MATCHRAW=$(echo "$MATCHRAW" | sed "s/$OPTIONS/$NEW_OPTIONS/")
                MATCH=$(echo "$MATCHRAW" | sed 's/\//\\\//g')
                NEW_MATCH=$(echo "$NEW_MATCHRAW" | sed 's/\//\\\//g')
                sed -i "s/$MATCH/$NEW_MATCH/" /etc/fstab

                if output=$(mount -o remount,nosuid /tmp); then
                        echo "Applied - $TAG";
                else
                        echo "Failed - $TAG";
                fi
            fi
        else
            echo "Failed - $TAG : /etc/fstab does not exist";
        fi
    else
        echo "Failed - $TAG : No separate partition for /tmp";
    fi
}

function control_012 {
    TAG="012 - 1.1.5 (L1) Ensure noexec option set on /tmp partition (Mandatory)";
    if output=$(mount | grep "[[:blank:]]/tmp[[:blank:]]"); then
        mount | grep "[[:blank:]]/tmp[[:blank:]].*" | grep "noexec"
        if [ $? -ne 0 ]; then
            if output=$(grep "[[:blank:]]/tmp[[:blank:]]" /etc/fstab | grep "noexec"); then
                if output=$(mount -o remount,noexec /tmp); then
                        echo "Applied - $TAG";
                else
                        echo "Failed - $TAG";
                fi
            else
                if output=$(sed -i 's/\/tmp.*ext4[[:blank:]].*,/&noexec,/' /etc/fstab); then
                    if output=$(grep "[[:blank:]]/tmp[[:blank:]]" /etc/fstab | grep "noexec"); then
                        if output=$(mount -o remount,noexec /tmp); then
                                echo "Applied - $TAG";
                        else
                                echo "Failed - $TAG";
                        fi
                    fi
                fi
            fi
        else
            if output=$(grep "[[:blank:]]/tmp[[:blank:]]" /etc/fstab | grep "noexec"); then
                if output=$(mount -o remount,noexec /tmp); then
                        echo "Applied - $TAG";
                else
                        echo "Failed - $TAG";
                fi
            else
                if output=$(sed -i 's/\/tmp.*ext4[[:blank:]].*,/&noexec,/' /etc/fstab); then
                    if output=$(grep "[[:blank:]]/tmp[[:blank:]]" /etc/fstab | grep "noexec"); then
                        if output=$(mount -o remount,noexec /tmp); then
                                echo "Applied - $TAG";
                        else
                                echo "Failed - $TAG";
                        fi
                    fi
                fi
            fi
            # echo "Applied - $TAG : noexec option exists";
        fi
    else
        echo "Failed - $TAG : No separate partition for /tmp";
    fi
}

function control_014 {
    TAG="014 - 1.1.7 (L1) Ensure separate partition exists for /var/tmp (Mandatory)";
    PARTITION=0
    GETPARTITION=$(mount | grep /tmp | cut -d " " -f 1 | uniq)
    if output=$(mount | grep "var/tmp"); then
        sleep 1
    else
        mount -t auto -v $GETPARTITIOsN /var/tmp
    fi

    if output=$(cat /etc/fstab | grep /tmp[[:blank:]]/var/tmp); then
        mount | grep "/var/tmp[[:blank:]]"
        if [ $? -ne 0 ]; then
                PARTITION=0
                echo "Failed - $TAG : not exist mount filesystem /var/tmp";
        else
                echo "Applied - $TAG : /var/tmp partition exists";
                PARTITION=1
        fi
    else
        echo "/tmp    /var/tmp        none    bind,nosuid,noexec,nodev        0       0" >> /etc/fstab
    fi
}

function control_015 {
    TAG="015 - 1.1.8 (L1) Ensure nodev option set on /var/tmp partition (Mandatory)";
    PARTITION=0          

    #GETPARTITION=$(mount | grep /tmp | cut -d " " -f 1 | uniq)

    if output=$(cat /etc/fstab | grep /var/tmp); then
        # if output=$(mount | grep "$GETPARTITION"); then
        #     mount -o remount,nodev /var/tmp
        # else
        #     mount -t auto -v $GETPARTITION /var/tmp
        # fi

        mount | grep "/var/tmp[[:blank:]]"
        if [ $? -ne 0 ]; then 
            PARTITION=0 
        else 
            PARTITION=1 
        fi

        if [ $PARTITION -eq 1 ]; then
            if [ -s /etc/fstab ]; then
                mount | grep "/var/tmp[[:blank:]]" | grep "nodev"
                if [ $? -ne 0 ]; then
                    if output=$(grep "/var/tmp[[:blank:]]" /etc/fstab | grep "nodev"); then
                        if output=$(mount -o remount,nodev /var/tmp); then
                                echo "Applied - $TAG";
                        else
                                echo "Failed - $TAG";
                        fi
                    else
                        if output=$(sed -i 's/\/var\/tmp.*bind/&,nodev/' /etc/fstab); then
                            if output=$(grep "/var/tmp[[:blank:]]" /etc/fstab | grep "nodev"); then
                                if output=$(mount -o remount,nodev /var/tmp); then
                                        echo "Applied - $TAG";
                                else
                                        echo "Failed - $TAG";
                                fi
                            fi
                        fi
                    fi
                else
                    mount -o remount,nodev /var/tmp
                    echo "Applied - $TAG : nodev option exists";
                fi
            else
                echo "Failed - $TAG : /etc/fstab does not exist";
            fi
        else
            echo "Failed - $TAG : No separate partition for /var/tmp";
        fi
    fi
}

function control_016 {
    TAG="016 - 1.1.9 (L1) Ensure nosuid option set on /var/tmp partition (Mandatory)";
	PARTITION=0;
	mount | grep -q "/var/tmp[[:blank:]]"
	if [ $? -ne 0 ]; then 
        PARTITION=0 
    else 
        PARTITION=1 
    fi
    if [ $PARTITION -eq 1 ]; then
        if [ -s /etc/fstab ]; then
            mount | grep "/var/tmp[[:blank:]]" | grep "nosuid"
            if [ $? -ne 0 ]; then
                if output=$(grep "/var/tmp[[:blank:]]" /etc/fstab | grep "nosuid"); then
                    if output=$(mount -o remount,nosuid /var/tmp); then
                            echo "Applied - $TAG";
                    else
                            echo "Failed - $TAG";
                    fi
                else
                    if output=$(sed -i 's/\/var\/tmp.*bind/&,nosuid/' /etc/fstab); then
                        if output=$(grep "/var/tmp[[:blank:]]" /etc/fstab | grep "nosuid"); then
                            if output=$(mount -o remount,nosuid /var/tmp); then
                                    echo "Applied - $TAG";
                            else
                                    echo "Failed - $TAG";
                            fi
                        fi
                    fi
                fi
            else
                    mount -o remount,nosuid /var/tmp
                    echo "Applied - $TAG : nosuid option exists";
            fi
        else
                echo "Failed - $TAG : etc/fstab does not exist";
        fi
    else
        echo "Failed - $TAG : no separate partition for /var/tmp";
    fi
}

function control_017 {
    TAG="017 - 1.1.10 (L1) Ensure noexec option set on /var/tmp partition (Mandatory)";
	PARTITION=0
	mount | grep -q "/var/tmp[[:blank:]]"
	if [ $? -ne 0 ]; then 
        PARTITION=0 
    else 
        PARTITION=1 
    fi
    if [ ! -d "/dev/tmp" ]; then
        mkdir   /dev/tmp
    fi
    if [ -d "/dev/tmp" ]; then
        if [ $PARTITION -eq 1 ]; then
            if [ -s /etc/fstab ]; then
                mount | grep "/var/tmp[[:blank:]]" | grep "noexec"
                if [ $? -ne 0 ]; then
                   if output=$(grep "/var/tmp[[:blank:]]" /etc/fstab | grep "noexec"); then
                        if output=$(mount -o remount,noexec /var/tmp); then
                                echo "Applied - $TAG";
                        else
                                echo "Failed - $TAG";
                        fi
                    else
                        if output=$(sed -i 's/\/var\/tmp.*bind/&,noexec/' /etc/fstab); then
                            if output=$(grep "/var/tmp[[:blank:]]" /etc/fstab | grep "noexec"); then
                                if output=$(mount -o remount,noexec /var/tmp); then
                                        echo "Applied - $TAG";
                                else
                                        echo "Failed - $TAG";
                                fi
                            fi
                        fi
                    fi
                else
                    echo "Applied - $TAG : noexec option exists";
                fi
            else
                echo "Failed - $TAG : /etc/fstab does not exist";
            fi
        else
            mount -o remount,noexec /var/tmp
            echo "Applied - $TAG : noexec option exists";
        fi
    else
        echo "Failed - $TAG: directory not found /dev/tmp";
    fi
}

function control_018 {
    # need to add script
    TAG="018 - 1.1.11 (L1) Ensure separate partition exists for /var/log (Mandatory)";
    PARTITION=0
    mount | grep "/var/log[[:blank:]]"
    if [ $? -ne 0 ]; then
        PARTITION=0
        echo "Failed - $TAG: not exist mount filesystem /var/log";
    else
        echo "Applied - $TAG : /var/log partition exists";
        PARTITION=1
    fi
}

function control_019 {
    TAG="019 - 1.1.12 (L1) Ensure separate partition exists for /var/log/audit (Mandatory)";
    PARTITION=0
    mount | grep "/var/log/audit[[:blank:]]"
    if [ $? -ne 0 ]; then
        PARTITION=0
        echo "Failed - $TAG: not exist mount filesystem /var/log/audit";
    else
        echo "Applied - $TAG : /var/log/audit partition exists";
        PARTITION=1
    fi
}

function control_020 {
    TAG="020 - 1.1.13 (L1) Ensure separate partition exists for /home (Mandatory)";
    PARTITION=0
    mount | grep "/home[[:blank:]]"
    if [ $? -ne 0 ]; then
        PARTITION=0
        echo "Failed - $TAG: not exist mount filesystem /home";
    else
        echo "Applied - $TAG : /home partition exists";
        PARTITION=1
    fi
}

function control_021 {
    TAG="021 - 1.1.14 (L1) Ensure nodev option set on /home partition (Mandatory)";
    if output=$(mount | grep "/home[[:blank:]]"); then
        if [ -s /etc/fstab ]; then
            MATCHRAW=$(grep "/home[[:blank:]]" /etc/fstab)
            if output=$(mount | grep "/home[[:blank:]]" | grep "nodev"); then
                echo "Applied - $TAG : nodev option exists";
            else
                OPTIONS=$(echo $MATCHRAW | cut -d " " -f 4)
                NEW_OPTIONS="${OPTIONS},nodev"
                NEW_MATCHRAW=$(echo "$MATCHRAW" | sed "s/$OPTIONS/$NEW_OPTIONS/")
                MATCH=$(echo "$MATCHRAW" | sed 's/\//\\\//g')
                NEW_MATCH=$(echo "$NEW_MATCHRAW" | sed 's/\//\\\//g')
                sed -i "s/$MATCH/$NEW_MATCH/" /etc/fstab
                if output=$(mount -o remount,nodev /home); then
                    echo "Applied - $TAG";
                else
                    echo "Failed - $TAG";
                fi
            fi
        else
            echo "Failed - $TAG : /etc/fstab does not exist";
        fi
    else
        echo "Failed - $TAG : no separate partition for /home";
    fi
}

function control_022 {
    TAG="022 - 1.1.15 (L1) Ensure nodev option set on /dev/shm partition (Mandatory)";
    PARTITION=0
    mount | grep "/dev/shm[[:blank:]]"
    if [ $? -ne 0 ]; then  
        PARTITION=0 
    else 
        PARTITION=1 
    fi
    if [ $PARTITION -eq 1 ]; then
        if [ -s /etc/fstab ]; then
        MATCHRAW=$(grep "/dev/shm[[:blank:]]" /etc/fstab)
            mount | grep "/dev/shm[[:blank:]]" | grep "nodev"
            if [ $? -ne 0 ]; then
                OPTIONS=$(echo $MATCHRAW | cut -d " " -f 4)
                NEW_OPTIONS="${OPTIONS},nodev"
                NEW_MATCHRAW=$(echo "$MATCHRAW" | sed "s/$OPTIONS/$NEW_OPTIONS/")
                MATCH=$(echo "$MATCHRAW" | sed 's/\//\\\//g')
                NEW_MATCH=$(echo "$NEW_MATCHRAW" | sed 's/\//\\\//g')
                sed -i "s/$MATCH/$NEW_MATCH/" /etc/fstab
                if output=$(mount -o remount,nodev /dev/shm); then
                    echo "Applied - $TAG";
                else
                    echo "Failed - $TAG";
                fi
            else
                echo "Applied - $TAG : nodev option exists";
            fi
        else
            echo "Failed - $TAG : /etc/fstab does not exist";
        fi
    else
        echo "Failed - $TAG : no separate partition for /dev/shm";
    fi
}

function control_023 {
    TAG="023 - 1.1.16 (L1) Ensure nosuid option set on /dev/shm partition (Mandatory)";
    PARTITION=0      
    mount | grep "/dev/shm[[:blank:]]"
    if [ $? -ne 0 ]; then 
        PARTITION=0 
    else 
        PARTITION=1 
    fi      
    if [ $PARTITION -eq 1 ]; then
        if [ -s /etc/fstab ]; then
            MATCHRAW=$(grep "/dev/shm[[:blank:]]" /etc/fstab)
            mount | grep "/dev/shm[[:blank:]]" | grep "nosuid"
            if [ $? -ne 0 ]; then
                OPTIONS=$(echo $MATCHRAW | cut -d " " -f 4)
                NEW_OPTIONS="${OPTIONS},nosuid"
                NEW_MATCHRAW=$(echo "$MATCHRAW" | sed "s/$OPTIONS/$NEW_OPTIONS/")
                MATCH=$(echo "$MATCHRAW" | sed 's/\//\\\//g')
                NEW_MATCH=$(echo "$NEW_MATCHRAW" | sed 's/\//\\\//g')
                sed -i "s/$MATCH/$NEW_MATCH/" /etc/fstab
                if output=$(mount -o remount,nosuid /dev/shm); then
                    echo "Applied - $TAG";
                else
                    echo "Failed - $TAG";
                fi
            else
                echo "Applied - $TAG : - nosuid option exists";
            fi
        else
            echo "Failed - $TAG : /etc/fstab does not exist";
        fi
    else
        echo "Failed - $TAG : no separate partition for /dev/shm";
    fi
}

function control_024 {
    TAG="024 - 1.1.17 (L1) Ensure noexec option set on /dev/shm partition (Mandatory)";
    PARTITION=0   
    mount | grep "/dev/shm[[:blank:]]"
    if [ $? -ne 0 ]; then 
        PARTITION=0 
    else 
        PARTITION=1 
    fi   
    if [ $PARTITION -eq 1 ]; then
        if [ -s /etc/fstab ]; then
            MATCHRAW=$(grep "/dev/shm[[:blank:]]" /etc/fstab)
            mount | grep "/dev/shm[[:blank:]]" | grep "noexec"
            if [ $? -ne 0 ]; then
                OPTIONS=$(echo $MATCHRAW | cut -d " " -f 4)
                NEW_OPTIONS="${OPTIONS},noexec"
                NEW_MATCHRAW=$(echo "$MATCHRAW" | sed "s/$OPTIONS/$NEW_OPTIONS/")
                MATCH=$(echo "$MATCHRAW" | sed 's/\//\\\//g')
                NEW_MATCH=$(echo "$NEW_MATCHRAW" | sed 's/\//\\\//g')
                sed -i "s/$MATCH/$NEW_MATCH/" /etc/fstab
                if output=$(mount -o remount,noexec /dev/shm); then
                    echo "Applied - $TAG";
                else
                    echo "Failed - $TAG";
                fi
            else
                echo "Applied - $TAG : noexec option exists";
            fi
        else
            echo "Failed - $TAG : /etc/fstab does not exist";
        fi
    else
        echo "Failed - $TAG : no separate partition for /dev/shm";
    fi
}

function control_028 {
    TAG="028 - 1.1.21 (L1) Ensure sticky bit is set on all world-writable directories (Mandatory)";
    if output=$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d -perm -0002 2>/dev/null | xargs chmod a+t); then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";
    fi
}

function control_032 {
    TAG="032 - 1.3.1 (L1) Ensure AIDE is installed (Secondary)"
    if [ ! -f "partials/aide-0.15.1-19.1.x86_64.rpm" ]; then
        echo "Error, cannot find file 'partials/aide-0.15.1-19.1.x86_64.rpm'";
    else
        if output=$(cp -rf partials/aide-0.15.1-19.1.x86_64.rpm  /tmp/); then
            echo "Successfully copy partials/aide-0.15.1-19.1.x86_64.rpm to  /tmp/";
        else
            echo "Error, cannot copy partials/aide-0.15.1-19.1.x86_64.rpm to  /tmp/";
        fi
    fi
    ### 62 - name: Install AIDE from RPM
    if [ ! -f  "/tmp/aide-0.15.1-19.1.x86_64.rpm" ]; then
        echo "Error, Cannot find package /tmp/aide-0.15.1-19.1.x86_64.rpm";
    else
        if output=$(rpm -i /tmp/aide-0.15.1-19.1.x86_64.rpm); then
            echo "Applied - $TAG";
        else
            echo "Failed - $TAG";
        fi
    fi
}

function control_033 {
    TAG="033 - 1.3.2 (L1) Ensure filesystem integrity is regularly checked (Secondary)"
    if [ -f  "/usr/bin/aide" ]; then
        if output=$(crontab -u root -l 2>/dev/null); then
            if output=$(crontab -u root -l | grep ".*./usr/bin/aide --check$" 2>/dev/null); then
                echo "Applied - $TAG";
            else
                if output=$(touch temp.sh && echo "0 5 * * * /usr/bin/aide --check" > temp.sh && crontab -u root -l >> temp.sh && crontab -u root -r && cat temp.sh| crontab -u root - && rm temp.sh); then
                    echo "Applied - $TAG";      
                fi
            fi
        else
            if output=$(touch temp.sh && echo "0 5 * * * /usr/bin/aide --check" >> temp.sh &&  cat temp.sh | crontab -u clcargo - && rm temp.sh); then
                echo "Applied - $TAG";
            fi
        fi
    else
        echo "Failed - $TAG";      
    fi
}

function control_035ab {
    sleep 1
}

function control_036ab {
    TAGA="036a - 1.4.3 (L1) Ensure authentication required for single user mode - emergency (Mandatory)"
    TAGB="036b - 1.4.3 (L1) Ensure authentication required for single user mode - rescue (Mandatory)"
    if [ -f "/usr/lib/systemd/system/rescue.service" ]; then
        if output=$( cat /usr/lib/systemd/system/rescue.service | grep -e 'ExecStart=-/bin/sh -c "/usr/sbin/sulogin; /usr/bin/systemctl --job-mode=fail --no-block default"'); then
            echo "Applied - $TAGA";
        else
            echo 'ExecStart=-/bin/sh -c "/usr/sbin/sulogin; /usr/bin/systemctl --job-mode=fail --no-block default"' >> /usr/lib/systemd/system/rescue.service
            echo "Applied - $TAGA";
        fi
    fi

    if [ -f "/usr/lib/systemd/system/emergency.service" ]; then
        if output=$( cat /usr/lib/systemd/system/emergency.service | grep -e 'ExecStart=-/bin/sh -c "/usr/sbin/sulogin; /usr/bin/systemctl --job-mode=fail --no-block default"'); then
            echo "Applied - $TAGB";
        else
            echo 'ExecStart=-/bin/sh -c "/usr/sbin/sulogin; /usr/bin/systemctl --job-mode=fail --no-block default"' >> /usr/lib/systemd/system/emergency.service
            echo "Applied - $TAGB";
        fi
    fi

}

function control_037abc {
    TAGA="037a - 1.5.1 (L1) Ensure core dumps are restricted - hard core 0 (Mandatory)"
    TAGB="037b - 1.5.1 (L1) Ensure core dumps are restricted - /sbin/sysctl fs.suid_dumpable (Mandatory)"
    TAGC="037c - 1.5.1 (L1) Ensure core dumps are restricted - sysctl.conf fs.suid_dumpable (Mandatory)"
    if [ ! -f "/etc/security/limits.conf-bk" ]; then
        if output=$(cp -rf /etc/security/limits.conf /etc/security/limits.conf-bk); then
            sleep 1
        else
            echo "Error, cannot crate backup config '/etc/security/limits.conf-bk'";
            sleep 1
        fi
    fi
    
    if [ -f "/etc/security/limits.conf" ]; then
        # if backup already, then restricted on /etc/security/limits.conf
        if output=$(grep "hard[[:blank:]]core" /etc/security/limits.conf); then
            if output=$(sed -i 's/hard[[:blank:]]core[[:blank:]].*/hard core 0/' /etc/security/limits.conf); then
                ###remove duplicate item
                gawk -i inplace '!a[$0]++' /etc/security/limits.conf

                if output=$(grep "hard[[:blank:]]core[[:blank:]]0" /etc/security/limits.conf); then
                    echo "Applied - $TAGA";
                else
                    echo "Failed - $TAGA";
                fi
            fi
        else
            echo "* hard core 0" >> /etc/security/limits.conf;
            echo "Applied - $TAGA";
        fi

        if output=$(grep "fs.suid_dumpable.*" /etc/sysctl.conf); then
            if output=$(sed -i 's/fs.suid_dumpable.*=.*/fs.suid_dumpable = 0/' /etc/sysctl.conf); then
                if output=$(grep "fs.suid_dumpable.*=.*0" /etc/sysctl.conf); then
                    sysctl -w fs.suid_dumpable=0
                    echo "Applied - $TAGB";
                    echo "Applied - $TAGC";
                else
                    echo "fs.suid_dumpable = 0" >>  /etc/sysctl.conf;
                    sysctl -w fs.suid_dumpable=0
                    echo "Applied - $TAGB";
                    echo "Applied - $TAGC";
                fi
            fi
        fi
    fi
}

function control_039ab {
    TAGA="039a - 1.5.3 (L1) Ensure address space layout randomization (ASLR) is enabled - sysctl (Mandatory)";
    TAGB="039b - 1.5.3 (L1) Ensure address space layout randomization (ASLR) is enabled - /etc/sysctl (Mandatory)"
    if [ -f "/etc/sysctl.conf" ]; then
        if [ ! -f  "/etc/sysctl.conf-bk" ]; then
            if output=$(cp /etc/sysctl.conf /etc/sysctl.conf-bk 2>/dev/null); then
                    sleep 1
            else
                    echo "Cannot backup file /etc/sysctl.conf"; sleep 1
            fi
        fi
        if [ -f  "/etc/sysctl.conf-bk" ]; then
            if output=$(grep "kernel.randomize_va_space" /etc/sysctl.conf); then
                if output=$(sed -i 's/^[^#]*kernel.randomize_va_space=.*./kernel.randomize_va_space=2/' /etc/sysctl.conf | sed -i 's/^[^#]*#kernel.randomize_va_space=.*./kernel.randomize_va_space=2/' /etc/sysctl.conf); then
                    echo "Applied - $TAGA"; echo "Applied - $TAGB";
                else
                    echo "Failed - $TAGA"; sleep 1; echo "Failed - $TAGB"; sleep 1
                fi
            else
                if output=$(sysctl -w kernel.randomize_va_space=2 2>/dev/null); then
                    echo "Applied - $TAGA"; echo "Applied - $TAGB";
                else
                    echo "Failed - $TAGA"; sleep 1; echo "Failed - $TAGB"; sleep 1
                fi
            fi  
        fi
    else
        echo "Failed - $TAGA: /etc/sysctl.conf not exist"; sleep 1
        echo "Failed - $TAGB: /etc/sysctl.conf not exist"; sleep 1
    fi
}

function control_042 {
    TAG="042 - 1.6.1.2 (L1) Ensure the SELinux state is enforcing (Mandatory)";
    if [ -f "/etc/selinux/config" ]; then
        if [ ! -f  "/etc/selinux/config-bk" ]; then
            if output=$(cp /etc/selinux/config /etc/selinux/config-bk 2>/dev/null); then
                sleep 1
            else
                echo "Cannot backup file /etc/selinux/config"; sleep 1
            fi
        fi
        if [ -f  "/etc/selinux/config-bk" ]; then
            if output=$(grep -e "SELINUX=" /etc/selinux/config); then
                if output=$(sed -i 's/^[^#]*SELINUX=.*./SELINUX=enforcing/' /etc/selinux/config | sed -i 's/^[^#]*#SELINUX=.*./SELINUX=enforcing/' /etc/selinux/config); then
                    echo "Applied - $TAG";
                else
                    echo "Failed - $TAG"; sleep 1
                fi
            else
                if output=$(echo "SELINUX=enforcing" >> /etc/selinux/config); then
                    echo "Applied - $TAG";
                else
                    echo "Failed - $TAG"; sleep 1
                fi
            fi
        fi
    else
        echo "Failed - $TAG: /etc/selinux/config not exist"; sleep 1
    fi
}

function control_043 {
    TAG="043 - 1.6.1.3 (L1) Ensure SELinux policy is configured (Mandatory)";
    if [ -f "/etc/selinux/config" ]; then
        if [ ! -f  "/etc/selinux/config-bk" ]; then
            if output=$(cp /etc/selinux/config /etc/selinux/config-bk 2>/dev/null); then
                    sleep 1
            else
                    echo "Cannot backup file /etc/selinux/config";
            fi
        fi
        if [ -f  "/etc/selinux/config-bk" ]; then
            if output=$(grep -e "SELINUXTYPE=" /etc/selinux/config); then
                if output=$(sed -i 's/^[^#]*SELINUXTYPE=.*./SELINUXTYPE=targeted/' /etc/selinux/config | sed -i 's/^[^#]*#SELINUXTYPE=.*./SELINUXTYPE=targeted/' /etc/selinux/config); then
                    echo "Applied - $TAG";
                else
                    echo "Failed - $TAG";
                fi
            else
                if output=$(echo "SELINUXTYPE=targeted" >> /etc/selinux/config); then
                    echo "Applied - $TAG";
                else
                    echo "Failed - $TAG";
                fi
            fi 
        fi
    else
        echo "Failed - $TAG: /etc/selinux/config not exist";
    fi
}

function control_048c {
    TAG="048c - 1.6.2.2 (L2) Ensure all AppArmor Profiles are enforcing - profiles loaded (Secondary)"
    if output=$(enforce /etc/apparmor.d/*); then
        ## check make sure command run when startup
        ## command: enforce /etc/apparmor.d/*
        if output=$(grep -e "enforce /etc/apparmor.d/*" /etc/rc.d/boot.local); then
            echo "Applied - $TAG";
        else
            ## add command to boot.local
            ## command: enforce /etc/apparmor.d/*
            echo -e "# run custom command when startup/restart" >> /etc/rc.d/boot.local;
            echo -e "# 048c - 1.6.2.2 (L2) Ensure all AppArmor Profiles are enforcing - profiles loaded (Secondary)" >> /etc/rc.d/boot.local;
            echo -e "enforce /etc/apparmor.d/*" >> /etc/rc.d/boot.local;
        fi
    else   
        echo "Failed - $TAG";
    fi
}

function control_050ab {
    TAGA="050a - 1.7.1.1 (L1) Ensure message of the day is configured properly - banner text (Mandatory) (Changed)"
    TAGB="050b - 1.7.1.1 (L1) Ensure message of the day is configured properly - mrsv (Mandatory)"
    if [ -f "partials/motd" ]; then
        if output=$(cp -rf partials/motd /tmp/); then
            sleep 1
        fi
    else
        echo "Could not find banner file in directory partials/"; sleep 1
    fi
    ### 57 - name: Configure banner mode on /etc/motd
    if [ -f "/tmp/motd" ]; then
        if [ -f "/etc/motd" ]; then
            if output=$(cat /tmp/motd > /etc/motd); then
                echo "Applied - $TAGA"; echo "Applied - $TAGB";
            fi
        else
            echo "Failed - $TAGA : /etc/motd not exist"; sleep 1; echo "Failed - $TAGB : /etc/motd not exist"; sleep 1
        fi
    else
        echo "Failed - $TAGA : /tmp/motd not exist"; sleep 1; echo "Failed - $TAGB : /tmp/motd not exist"; sleep 1    
    fi
}

function control_050cd {
    TAGA="050c - 1.7.1.2 (L1) Ensure local login warning banner is configured properly - banner text (Mandatory) (Changed)"
    TAGB="050d - 1.7.1.2 (L1) Ensure local login warning banner is configured properly - mrsv (Mandatory)"
    if output=$(grep "^Authorized\s\uses\s\only.\s\All\s\activity\s\may.*.be\s\monitored\s\and\s\reported.$"  /etc/issue); then
        echo "Applied - $TAGA"; 
        echo "Applied - $TAGB";
    else
        echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue;
        echo "Applied - $TAGA"; 
        echo "Applied - $TAGB";
    fi
}

function control_050ef {
    TAGA="050e - 1.7.1.3 (L1) Ensure remote login warning banner is configured properly - banner text (Mandatory) (Changed)"
    TAGB="050f - 1.7.1.3 (L1) Ensure remote login warning banner is configured properly - mrsv (Mandatory)"
    if output=$(grep "^Authorized\s\uses\s\only.\s\All\s\activity\s\may.*.be\s\monitored\s\and\s\reported.$"  /etc/issue.net); then
        echo "Applied - $TAGA"; echo "Applied - $TAGB";
    else
        echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue.net;
        echo "Applied - $TAGA"; echo "Applied - $TAGB";
    fi
}

function control_050g {
    TAGG="050g - 1.7.2 (L1) Ensure GDM login banner is configured - user-db (Mandatory)";
    TAGH="050h - 1.7.2 (L1) Ensure GDM login banner is configured - system-db (Mandatory)";
    TAGI="050i - 1.7.2 (L1) Ensure GDM login banner is configured - file-db (Mandatory)";
    if [ ! -f "/etc/dconf/profile/gdm" ]; then
        if output=$(mkdir -p /etc/dconf/profile && touch "/etc/dconf/profile/gdm"); then
                echo "user-db:user" >> /etc/dconf/profile/gdm
                echo "system-db:gdm" >> /etc/dconf/profile/gdm
                echo "file-db:/usr/share/gdm/greeter-dconf-defaults" >> /etc/dconf/profile/gdm
                echo "Applied - $TAGG"; echo "Applied - $TAGH"; echo "Applied - $TAGI";
        fi
    else
        if output=$(grep -e "user-db:user" /etc/dconf/profile/gdm); then echo "Applied - $TAGG"; else echo "user-db:user" >> /etc/dconf/profile/gdm; echo "Applied - $TAGG"; fi
    fi
}

function control_050h {
    TAGG="050g - 1.7.2 (L1) Ensure GDM login banner is configured - user-db (Mandatory)";
    TAGH="050h - 1.7.2 (L1) Ensure GDM login banner is configured - system-db (Mandatory)";
    TAGI="050i - 1.7.2 (L1) Ensure GDM login banner is configured - file-db (Mandatory)";
    if [ ! -f "/etc/dconf/profile/gdm" ]; then
        if output=$(mkdir -p /etc/dconf/profile && touch "/etc/dconf/profile/gdm"); then
            echo "user-db:user" >> /etc/dconf/profile/gdm
            echo "system-db:gdm" >> /etc/dconf/profile/gdm
            echo "file-db:/usr/share/gdm/greeter-dconf-defaults" >> /etc/dconf/profile/gdm
            echo "Applied - $TAGG"; echo "Applied - $TAGH"; echo "Applied - $TAGI";
        fi
    else
        if output=$(grep -e "system-db:gdm" /etc/dconf/profile/gdm); then echo "Applied - $TAGH"; else echo "system-db:gdm" >> /etc/dconf/profile/gdm; echo "Applied - $TAGH"; fi
    fi
}

function control_050i {
    TAGG="050g - 1.7.2 (L1) Ensure GDM login banner is configured - user-db (Mandatory)";
    TAGH="050h - 1.7.2 (L1) Ensure GDM login banner is configured - system-db (Mandatory)";
    TAGI="050i - 1.7.2 (L1) Ensure GDM login banner is configured - file-db (Mandatory)";
    if [ ! -f "/etc/dconf/profile/gdm" ]; then
        if output=$(mkdir -p /etc/dconf/profile && touch "/etc/dconf/profile/gdm"); then
            echo "file-db:/usr/share/gdm/greeter-dconf-defaults" >> /etc/dconf/profile/gdm
            echo "Applied - $TAGG"; echo "Applied - $TAGH"; echo "Applied - $TAGI";
        fi
    else
        if output=$(grep -e "file-db:/usr/share/gdm/greeter-dconf-defaults" /etc/dconf/profile/gdm); then echo "Applied - $TAGI"; else echo "file-db:/usr/share/gdm/greeter-dconf-defaults" >> /etc/dconf/profile/gdm; echo "Applied - $TAGI"; fi
    fi
}

function control_050j {
    TAGJ="050j - 1.7.2 (L1) Ensure GDM login banner is configured - banner-message-enable (Mandatory)";
    TAGK="050k - 1.7.2 (L1) Ensure GDM login banner is configured - banner-message-text (Mandatory) (Changed)";
    if [ ! -f "/etc/dconf/db/gdm.d/01-banner-message" ]; then
        if output=$(mkdir -p /etc/dconf/db/gdm.d && touch "/etc/dconf/db/gdm.d/01-banner-message"); then
            echo "[org/gnome/login-screen]" >> /etc/dconf/db/gdm.d/01-banner-message
            echo "banner-message-enable=true" >> /etc/dconf/db/gdm.d/01-banner-message
            echo "banner-message-text='Authorized uses only. All activity may be monitored and reported.'" >> /etc/dconf/db/gdm.d/01-banner-message
            echo "Applied - $TAGJ"; 
            echo "Applied - $TAGK";
        fi
    else
        if output=$(grep -e "[org/gnome/login-screen]" /etc/dconf/db/gdm.d/01-banner-message && grep -e "banner-message-enable=true" /etc/dconf/db/gdm.d/01-banner-message); then
            echo "Applied - $TAGJ";
        else
            echo "[org/gnome/login-screen]" >> /etc/dconf/db/gdm.d/01-banner-message
            echo "banner-message-enable=true" >> /etc/dconf/db/gdm.d/01-banner-message
            echo "Applied - $TAGJ";
        fi  
    fi
}

function control_050k {
    TAGJ="050j - 1.7.2 (L1) Ensure GDM login banner is configured - banner-message-enable (Mandatory)";
    TAGK="050k - 1.7.2 (L1) Ensure GDM login banner is configured - banner-message-text (Mandatory) (Changed)";
    if [ ! -f "/etc/dconf/db/gdm.d/01-banner-message" ]; then
        if output=$(mkdir -p /etc/dconf/db/gdm.d && touch "/etc/dconf/db/gdm.d/01-banner-message"); then
            echo "[org/gnome/login-screen]" >> /etc/dconf/db/gdm.d/01-banner-message
            echo "banner-message-enable=true" >> /etc/dconf/db/gdm.d/01-banner-message
            echo "banner-message-text='Authorized uses only. All activity may be monitored and reported.'" >> /etc/dconf/db/gdm.d/01-banner-message
            echo "Applied - $TAGJ"; 
            echo "Applied - $TAGK";
        fi
    else
        if output=$(grep -e "banner-message-text=" /etc/dconf/db/gdm.d/01-banner-message); then
            echo "Applied - $TAGK";
        else
            echo "banner-message-text='Authorized uses only. All activity may be monitored and reported.'" >> /etc/dconf/db/gdm.d/01-banner-message
            echo "Applied - $TAGK";
        fi
    fi
}

function control_056b {
    #Add/modify 'restrict -4 default kod nomodify notrap nopeer noquery' /etc/ntp.conf
    TAG="056b - 2.2.1.2 (L1) Ensure ntp is configured - restrict -4 (Mandatory)"
    if output=$(grep "^restrict\s\-4\s\default\s\kod\s\nomodify\s\notrap\s\nopeer\s\noquery" /etc/ntp.conf); then
        echo "Applied - $TAG";
    elif output=$(grep "^restrict\s\-4\s\default\s\kod\s\nomodify\s\notrap" /etc/ntp.conf); then
        if output=$(sed -i 's/^[^#]*restrict.*.-4.*.default.*.kod.*.nomodify.*.notrap/restrict -4 default kod nomodify notrap nopeer noquery/'); then
            echo "Applied - $TAG";
        fi
    else
        echo "restrict -4 default kod nomodify notrap nopeer noquery" >> /etc/ntp.conf;
        echo "Applied - $TAG";
    fi
}

function control_056c {
    # add/modify 'restrict -6 default kod nomodify notrap nopeer noquery' /etc/ntp.conf
    TAG="056c - 2.2.1.2 (L1) Ensure ntp is configured - restrict -6 (Mandatory)"
    if output=$(grep "^restrict\s\-6\s\default\s\kod\s\nomodify\s\notrap\s\nopeer\s\noquery" /etc/ntp.conf); then
        echo "Applied - $TAG";
    elif output=$(grep "^restrict\s\-6\s\default\s\kod\s\nomodify\s\notrap" /etc/ntp.conf); then
        if output=$(sed -i 's/^[^#]*restrict.*.-6.*.default.*.kod.*.nomodify.*.notrap/restrict -6 default kod nomodify notrap nopeer noquery/'); then
            echo "Applied - $TAG";
        fi
    else
        echo "restrict -6 default kod nomodify notrap nopeer noquery" >> /etc/ntp.conf;
        echo "Applied - $TAG";    
    fi
}

function control_056d {
    TAG="056d - 2.2.1.2 (L1) Ensure ntp is configured - server (Mandatory) (Changed)"
    STATUS=0;
    ### backup
    if [ ! -f "/etc/ntp.conf-bk" ]; then
        if output=$(cp -rf /etc/ntp.conf /etc/ntp.conf-bk 2>/dev/null); then
            STATUS=1
        else
            STATUS=0
            echo "Cannot create backup config '/etc/ntp.conf-bk'";
            sleep 1
        fi
    else
        ### already backup, do script
        ### modify to server 10.0.11.15
        if output=$(grep "^server[[:space:]]10.0.11.15" /etc/ntp.conf); then
            sleep 1
            echo "Applied IP 10.0.11.15 - $TAG"
        else
            STATUS=1
            echo "server 10.0.11.15" >> /etc/ntp.conf;    
        fi

        if output=$(grep "^server[[:space:]]10.0.11.17" /etc/ntp.conf); then
           sleep 1
           echo "Applied IP 10.0.11.17 - $TAG"
        else
            STATUS=1
            echo "server 10.0.11.17" >> /etc/ntp.conf;    
        fi
    fi  

    ### configure /etc/sysconfig/ntp
    ### backup
    if [ ! -f "/etc/sysconfig/ntp-bk" ]; then
        if output=$(cp -rf /etc/sysconfig/ntp /etc/sysconfig/ntp-bk); then
            STATUS=1
        else
            echo "Cannot create backup config '/etc/sysconfig/ntp-bk'";
            sleep 1
            STATUS=0  
        fi
    else
        ### already backup, do script
        if [ -f "/etc/sysconfig/ntp" ]; then
            if output=$(grep 'NTPD_OPTIONS="-g -u ntp:ntp"' /etc/sysconfig/ntp); then
                STATUS=1
            elif output=$(grep '^NTPD_OPTIONS=$' /etc/sysconfig/ntp); then
                if output=$(sed -i 's/^[^#]*NTPD_OPTIONS=/NTPD_OPTIONS="-g -u ntp:ntp"/'); then
                    STATUS=1      
                fi
            else
                echo 'NTPD_OPTIONS="-g -u ntp:ntp"' >> /etc/sysconfig/ntp;
                STATUS=1                   
            fi
        fi
    fi

    if output=$(service ntpd restart 2>/dev/null); then
        STATUS=1
        sleep 1
    else
        STAUS=0
        echo "Cannot restart ntpd service";
        sleep 1    
    fi

    if [[ $STATUS -eq 1 ]]; then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";
    fi
}

function control_062b {
    TAG="MBSS-OS-SUSE12-062b - 2.2.7 (L1) Ensure NFS and RPC are not enabled - rpcbind (Mandatory)"
    systemctl disable nfs
    systemctl disable rpcbind
    if output=$(systemctl is-enabled rpcbind | grep disabled); then
        echo "Applied - $TAG";
    fi
}

function control_064 {
    TAG="064 - 2.2.9 (L1) Ensure FTP Server is not enabled (Mandatory)";
    if output=$(chkconfig vsftpd off); then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";
    fi
}

function control_069 {
    TAG="069 - 2.2.14 (L1) Ensure SNMP Server is not enabled (Mandatory)";
    if output=$(chkconfig snmpd off); then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";
    fi
}

function control_072 {
    TAG="072 - 2.3.1 (L1) Ensure NIS Client is not installed (Mandatory)";
    if output=$(rpm -q ypbind | grep "not[[:blank:]]installed"); then
        echo "Applied - $TAG";
    else
        zypper remove ypbind
        if [ $? -ne 1 ]; then
            echo "Applied - $TAG";
        else
            echo "Failed - $TAG";
        fi
    fi
}

function control_073 {
    TAG="073 - 2.3.2 (L1) Ensure rsh client is not installed (Mandatory)";
    if output=$(rpm -q rsh | grep "not[[:blank:]]installed"); then
       echo "Applied - $TAG";
    else
        zypper remove rsh
        if [ $? -ne 1 ]; then
            echo "Applied - $TAG";
        else
            echo "Failed - $TAG";
        fi
    fi
}

function control_074 {
    TAG="074 - 2.3.3 (L1) Ensure talk client is not installed (Mandatory)";
    if output=$(rpm -q talk | grep "not[[:blank:]]installed"); then
        echo "Applied - $TAG";
    else
        zypper remove talk
        if [ $? -ne 1 ]; then
            echo "Applied - $TAG";
        else
            echo "Failed - $TAG";
        fi
    fi
}

function control_075 {
    TAG="075 - 2.3.4 (L1) Ensure telnet client is not installed (Mandatory)";
    if output=$(rpm -q telnet | grep "not[[:blank:]]installed"); then
        echo "Applied - $TAG";
    else
        zypper remove telnet
        if [ $? -ne 1 ]; then
            echo "Applied - $TAG";
        else
            echo "Failed - $TAG";
        fi
    fi 
}

function control_076 {
    TAG="076 - 2.3.5 (L1) Ensure LDAP client is not installed (Mandatory)";
    if output=$(rpm -q openldap2-client | grep "not[[:blank:]]installed"); then
        echo "Applied - $TAG";
    else
        zypper remove openldap2-client
        if [ $? -ne 1 ]; then
            echo "Applied - $TAG";
        else
            echo "Failed - $TAG";
        fi
    fi
}

function control_077ab {
    TAGA="077a - 3.1.1 (L1) Ensure IP forwarding is disabled - sysctl (Mandatory)"
    TAGB="077b - 3.1.1 (L1) Ensure IP forwarding is disabled - /etc/sysctl (Mandatory)"
    if [ ! -f "/etc/sysctl.conf-bk" ]; then
        if output=$(cp -rf  /etc/sysctl.conf  /etc/sysctl.conf-bk); then
            slee 1 
        else
            echo "077ab - cannot backup file  /etc/sysctl.conf-bk";    
        fi
    fi
    if [ -f "/etc/sysctl.conf" ]; then
        ### net.ipv4.ip_forward
        if output=$(grep "net.ipv4.ip_forward[[:blank:]]="  /etc/sysctl.conf); then
            if output=$(sysctl -w net.ipv4.ip_forward=0 && sysctl -w net.ipv4.route.flush=1); then
                if output=$(grep "net.ipv4.ip_forward[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                    echo "Applied - $TAGA"; 
                else
                    echo "net.ipv4.ip_forward = 0" >> /etc/sysctl.conf
                    if output=$(grep "net.ipv4.ip_forward[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                        echo "Applied - $TAGA"; 
                    else
                        echo "Failed - $TAGA";
                    fi
                fi
                if output=$(/sbin/sysctl net.ipv4.ip_forward); then
                    echo "Applied - $TAGB";
                else
                    echo "Failed - $TAGB";
                fi
            else
                echo "Failed - $TAGA"; 
                echo "Failed - $TAGB";
            fi
        else
            echo "net.ipv4.ip_forward = 0" >> /etc/sysctl.conf
            if output=$(grep "net.ipv4.ip_forward[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                echo "Applied - $TAGA"; 
            fi
            if output=$(sysctl -w net.ipv4.ip_forward=0 && sysctl -w net.ipv4.route.flush=1); then
                if output=$(/sbin/sysctl net.ipv4.ip_forward); then
                    echo "Applied - $TAGB";
                fi
            fi
        fi
    fi
}

function control_078abcd {
    TAGA="078a - 3.1.2 (L1) Ensure packet redirect sending is disabled - sysctl ipv4 all send (Mandatory)"
    TAGB="078b - 3.1.2 (L1) Ensure packet redirect sending is disabled - /etc/sysctl ipv4 all send (Mandatory)"
    TAGC="078c - 3.1.2 (L1) Ensure packet redirect sending is disabled - sysctl ipv4 default send (Mandatory)"
    TAGD="078d - 3.1.2 (L1) Ensure packet redirect sending is disabled - /etc/sysctl ipv4 default send (Mandatory)"

    if [ ! -f "/etc/sysctl.conf-bk" ]; then
        if output=$(cp -rf  /etc/sysctl.conf  /etc/sysctl.conf-bk); then
            slee 1 
        else
            echo "078abcd - cannot backup file  /etc/sysctl.conf-bk"; sleep 1
        fi
    fi
    if [ -f "/etc/sysctl.conf-bk" ]; then
        ### net.ipv4.conf.all.send_redirects
        if output=$(sysctl -w net.ipv4.conf.all.send_redirects=0 && sysctl -w net.ipv4.route.flush=1); then
            if output=$(grep "net.ipv4.conf.all.send_redirects.*.=.*.0" /etc/sysctl.conf); then
                echo "Applied - $TAGA"; 
            else
                echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.conf.all.send_redirects.*.=.*.0" /etc/sysctl.conf); then
                    echo "Applied - $TAGA"; 
                else
                    echo "Failed - $TAGA";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.conf.all.send_redirects); then
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGB";
            fi
        else
            echo "Failed - $TAGA"; 
            echo "Failed - $TAGB";
        fi
        ### net.ipv4.conf.default.send_redirects
        if output=$(sysctl -w net.ipv4.conf.default.send_redirects=0 && sysctl -w net.ipv4.route.flush=1); then
            if output=$(grep "net.ipv4.conf.default.send_redirects[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                echo "Applied - $TAGC";  
            else
                echo "net.ipv4.conf.default.send_redirects = 0" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.conf.default.send_redirects[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                    echo "Applied - $TAGC"; 
                else
                    echo "Failed - $TAGC";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.conf.default.send_redirects); then
                echo "Applied - $TAGD";
            else
                echo "Failed - $TAGD";
            fi
        else
            echo "Failed - $TAGC";  
            echo "Failed - $TAGD";
        fi
    fi
}

function control_079abcd {
    TAGA="079a - 3.2.1 (L1) Ensure source routed packets are not accepted - sysctl ipv4 all acccept (Mandatory)"
    TAGB="079b - 3.2.1 (L1) Ensure source routed packets are not accepted - /etc/sysctl ipv4 all acccept (Mandatory)"
    TAGC="079c - 3.2.1 (L1) Ensure source routed packets are not accepted - sysctl ipv4 default accept (Mandatory)"
    TAGD="079d - 3.2.1 (L1) Ensure source routed packets are not accepted - /etc/sysctl ipv4 default accept (Mandatory)"

    if [ ! -f "/etc/sysctl.conf-bk" ]; then
        if output=$(cp -rf /etc/sysctl.conf  /etc/sysctl.conf-bk); then
            slee 1 
        else
            echo "079abcd - cannot backup file  /etc/sysctl.conf-bk"; sleep 1
        fi
    fi
    if [ -f "/etc/sysctl.conf-bk" ]; then
        ### net.ipv4.conf.all.accept_source_route
        if output=$(sysctl -w net.ipv4.conf.all.accept_source_route=0 && sysctl -w net.ipv4.route.flush=1); then
            if output=$(grep "net.ipv4.conf.all.accept_source_route[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                echo "Applied - $TAGA"; 
            else
                echo "net.ipv4.conf.all.accept_source_route = 0" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.conf.all.accept_source_route[[:blank:]]=[[:blank:]]0"  /etc/sysctl.conf); then
                    echo "Applied - $TAGA"; 
                else
                    echo "Failed - $TAGA";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.conf.all.accept_source_route); then
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGB";
            fi
        else
            echo "Failed - $TAGA"; 
            echo "Failed - $TAGB";
        fi
        ### net.ipv4.conf.default.accept_source_route
        if output=$(sysctl -w net.ipv4.conf.default.accept_source_route=0 && sysctl -w net.ipv4.route.flush=1); then
            if output=$(grep "net.ipv4.conf.default.accept_source_route[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                echo "Applied - $TAGC";  
            else
                echo "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.conf.default.accept_source_route[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                    echo "Applied - $TAGC"; 
                else
                    echo "Failed - $TAGC";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.conf.default.accept_source_route); then
                echo "Applied - $TAGD";
            else
                echo "Failed - $TAGD";
            fi
        else
            echo "Failed - $TAGC";  
            echo "Failed - $TAGD";
        fi
    fi
}

function control_080abcd {
    TAGA="080a - 3.2.2 (L1) Ensure ICMP redirects are not accepted - sysctl ipv4 default accept (Mandatory)"
    TAGB="080b - 3.2.2 (L1) Ensure ICMP redirects are not accepted - /etc/sysctl ipv4 default accept (Mandatory)"
    TAGC="080c - 3.2.2 (L1) Ensure ICMP redirects are not accepted - sysctl ipv4 all accept (Mandatory)"
    TAGD="080d - 3.2.2 (L1) Ensure ICMP redirects are not accepted - /etc/sysctl ipv4 all accept (Mandatory)"

    if [ ! -f "/etc/sysctl.conf-bk" ]; then
        if output=$(cp -rf /etc/sysctl.conf  /etc/sysctl.conf-bk); then
            slee 1 
        else
            echo "080abcd - cannot backup file  /etc/sysctl.conf-bk"; sleep 1
        fi
    fi
    if [ -f "/etc/sysctl.conf-bk" ]; then
        ### net.ipv4.conf.default.accept_redirects
        if output=$(sysctl -w net.ipv4.conf.default.accept_redirects=0 && sysctl -w net.ipv4.route.flush=1); then
           if output=$(grep "net.ipv4.conf.default.accept_redirects[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                echo "Applied - $TAGA"; 
            else
                echo "net.ipv4.conf.default.accept_redirects = 0" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.conf.default.accept_redirects[[:blank:]]=[[:blank:]]0"  /etc/sysctl.conf); then
                    echo "Applied - $TAGA"; 
                else
                    echo "Failed - $TAGA";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.conf.default.accept_redirects); then
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGB";
            fi
        else
            echo "Failed - $TAGA"; 
            echo "Failed - $TAGB";
        fi
        ### net.ipv4.conf.all.accept_redirects
        if output=$(sysctl -w net.ipv4.conf.all.accept_redirects=0 && sysctl -w net.ipv4.route.flush=1); then
           if output=$(grep "net.ipv4.conf.all.accept_redirects[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                echo "Applied - $TAGC";  
            else
                echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.conf.all.accept_redirects[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                    echo "Applied - $TAGC"; 
                else
                    echo "Failed - $TAGC";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.conf.all.accept_redirects); then
                echo "Applied - $TAGD";
            else
                echo "Failed - $TAGD";
            fi 
        else
            echo "Failed - $TAGC";  
            echo "Failed - $TAGD";
        fi
    fi
}

function control_081abcd {
    TAGA="081a - 3.2.3 (L1) Ensure secure ICMP redirects are not accepted - sysctl ipv4 all secure (Mandatory)"
    TAGB="081b - 3.2.3 (L1) Ensure secure ICMP redirects are not accepted - /etc/sysctl ipv4 all secure (Mandatory)"
    TAGC="081c - 3.2.3 (L1) Ensure secure ICMP redirects are not accepted - sysctl ipv4 default secure (Mandatory)"
    TAGD="081d - 3.2.3 (L1) Ensure secure ICMP redirects are not accepted - /etc/sysctl ipv4 default secure (Mandatory)"

    if [ ! -f "/etc/sysctl.conf-bk" ]; then
        if output=$(cp -rf /etc/sysctl.conf  /etc/sysctl.conf-bk); then
            slee 1 
        else
            echo "081abcd - cannot backup file  /etc/sysctl.conf-bk"; sleep 1
        fi
    fi
    if [ -f "/etc/sysctl.conf-bk" ]; then
        ### net.ipv4.conf.all.secure_redirects
        if output=$(sysctl -w net.ipv4.conf.all.secure_redirects=0 && sysctl -w net.ipv4.route.flush=1); then
            if output=$(grep "net.ipv4.conf.all.secure_redirects[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                echo "Applied - $TAGA"; 
            else
                echo "net.ipv4.conf.all.secure_redirects = 0" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.conf.all.secure_redirects[[:blank:]]=[[:blank:]]0"  /etc/sysctl.conf); then
                    echo "Applied - $TAGA"; 
                else
                    echo "Failed - $TAGA";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.conf.all.secure_redirects); then
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGB";
            fi
        else
            echo "Failed - $TAGA"; 
            echo "Failed - $TAGB";
        fi
        ### net.ipv4.conf.default.secure_redirects
        if output=$(sysctl -w net.ipv4.conf.default.secure_redirects=0 && sysctl -w net.ipv4.route.flush=1); then
            if output=$(grep "net.ipv4.conf.default.secure_redirects[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                echo "Applied - $TAGC";  
            else
                echo "net.ipv4.conf.default.secure_redirects = 0" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.conf.default.secure_redirects[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                    echo "Applied - $TAGC"; 
                else
                    echo "Failed - $TAGC";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.conf.default.secure_redirects); then
                echo "Applied - $TAGD";
            else
                echo "Failed - $TAGD";
            fi 
        else
            echo "Failed - $TAGC";  
            echo "Failed - $TAGD";
        fi
    fi
}

function control_082abcd {
    TAGA="082a - 3.2.4 (L1) Ensure suspicious packets are logged - sysctl ipv4 all log_martians (Mandatory)"
    TAGB="082b - 3.2.4 (L1) Ensure suspicious packets are logged - /etc/sysctl ipv4 all log_martians (Mandatory)"
    TAGC="082c - 3.2.4 (L1) Ensure suspicious packets are logged - sysctl ipv4 default log_martians (Mandatory)"
    TAGD="082d - 3.2.4 (L1) Ensure suspicious packets are logged - /etc/sysctl ipv4 default log_martians (Mandatory)"

    if [ ! -f "/etc/sysctl.conf-bk" ]; then
        if output=$(cp -rf /etc/sysctl.conf  /etc/sysctl.conf-bk); then
            slee 1 
        else
            echo "082abcd - cannot backup file  /etc/sysctl.conf-bk"; sleep 1
        fi
    fi
    if [ -f "/etc/sysctl.conf-bk" ]; then
        ### net.ipv4.conf.all.log_martians
        if output=$(sysctl -w net.ipv4.conf.all.log_martians=1 && sysctl -w net.ipv4.route.flush=1); then
            if output=$(grep "net.ipv4.conf.all.log_martians[[:blank:]]=[[:blank:]]1" /etc/sysctl.conf); then
                echo "Applied - $TAGA"; 
            else
                echo "net.ipv4.conf.all.log_martians = 1" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.conf.all.log_martianss[[:blank:]]=[[:blank:]]1"  /etc/sysctl.conf); then
                    echo "Applied - $TAGA"; 
                else
                    echo "Failed - $TAGA";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.conf.all.log_martians); then
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGB";
            fi
        else
            echo "Failed - $TAGA"; 
            echo "Failed - $TAGB";
        fi
        ### net.ipv4.conf.default.log_martians
        if output=$(sysctl -w net.ipv4.conf.default.log_martians=1 && sysctl -w net.ipv4.route.flush=1); then
            if output=$(grep "net.ipv4.conf.default.log_martians[[:blank:]]=[[:blank:]]1" /etc/sysctl.conf); then
                echo "Applied - $TAGC";  
            else
                echo "net.ipv4.conf.default.log_martians = 1" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.conf.default.log_martians[[:blank:]]=[[:blank:]]1" /etc/sysctl.conf); then
                    echo "Applied - $TAGC"; 
                else
                    echo "Failed - $TAGC";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.conf.default.log_martians); then
                echo "Applied - $TAGD";
            else
                echo "Failed - $TAGD";
            fi 
        else
            echo "Failed - $TAGC";  
            echo "Failed - $TAGD";
        fi
    fi
}

function control_083ab {
    TAGA="083a - 3.2.5 (L1) Ensure broadcast ICMP requests are ignored - sysctl (Mandatory)"
    TAGB="083b - 3.2.5 (L1) Ensure broadcast ICMP requests are ignored - /etc/sysctl (Mandatory)"

    if [ ! -f "/etc/sysctl.conf-bk" ]; then
        if output=$(cp -rf /etc/sysctl.conf  /etc/sysctl.conf-bk); then
            slee 1 
        else
            echo "083ab - cannot backup file  /etc/sysctl.conf-bk"; sleep 1
        fi
    fi
    if [ -f "/etc/sysctl.conf-bk" ]; then
        ### net.ipv4.icmp_echo_ignore_broadcasts
        if output=$(sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1 && sysctl -w net.ipv4.route.flush=1); then
            if output=$(grep "net.ipv4.icmp_echo_ignore_broadcasts[[:blank:]]=[[:blank:]]1" /etc/sysctl.conf); then
                echo "Applied - $TAGA"; 
            else
                echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.icmp_echo_ignore_broadcasts[[:blank:]]=[[:blank:]]1"  /etc/sysctl.conf); then
                    echo "Applied - $TAGA"; 
                else
                    echo "Failed - $TAGA";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.icmp_echo_ignore_broadcasts); then
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGB";
            fi
        else
            echo "Failed - $TAGA"; 
            echo "Failed - $TAGB";
        fi
    fi
}

function control_084ab {
    TAGA="084a - 3.2.6 (L1) Ensure bogus ICMP responses are ignored - sysctl (Mandatory)"
    TAGB="084b - 3.2.6 (L1) Ensure bogus ICMP responses are ignored - /etc/sysctl (Mandatory)"

    if [ ! -f "/etc/sysctl.conf-bk" ]; then
        if output=$(cp -rf /etc/sysctl.conf  /etc/sysctl.conf-bk); then
            slee 1 
        else
            echo "084ab - cannot backup file  /etc/sysctl.conf-bk"; sleep 1
        fi
    fi
    if [ -f "/etc/sysctl.conf-bk" ]; then
        ### net.ipv4.icmp_ignore_bogus_error_responses
        if output=$(sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1 && sysctl -w net.ipv4.route.flush=1); then
            if output=$(grep "net.ipv4.icmp_ignore_bogus_error_responses[[:blank:]]=[[:blank:]]1" /etc/sysctl.conf); then
                echo "Applied - $TAGA"; 
            else
                echo "net.ipv4.icmp_ignore_bogus_error_responses = 1" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.icmp_ignore_bogus_error_responses[[:blank:]]=[[:blank:]]1"  /etc/sysctl.conf); then
                    echo "Applied - $TAGA"; 
                else
                    echo "Failed - $TAGA";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.icmp_ignore_bogus_error_responses); then
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGB";
            fi
        else
            echo "Failed - $TAGA"; 
            echo "Failed - $TAGB";
        fi
    fi
}

function control_085abcd {
    TAGA="085a - 3.2.7 (L1) Ensure Reverse Path Filtering is enabled - sysctl ipv4 all rp_filter (Mandatory)"
    TAGB="085b - 3.2.7 (L1) Ensure Reverse Path Filtering is enabled - /etc/sysctl ipv4 all rp_filter (Mandatory)"
    TAGC="085c - 3.2.7 (L1) Ensure Reverse Path Filtering is enabled - sysctl ipv4 default rp_filter (Mandatory)"
    TAGD="085d - 3.2.7 (L1) Ensure Reverse Path Filtering is enabled - /etc/sysctl ipv4 default rp_filter (Mandatory)"

    if [ ! -f "/etc/sysctl.conf-bk" ]; then
        if output=$(cp -rf /etc/sysctl.conf  /etc/sysctl.conf-bk); then
            slee 1 
        else
            echo "085abcd - cannot backup file  /etc/sysctl.conf-bk"; sleep 1
        fi
    fi
    if [ -f "/etc/sysctl.conf-bk" ]; then
        ### net.ipv4.conf.all.rp_filter
        if output=$(sysctl -w net.ipv4.conf.all.rp_filter=1 && sysctl -w net.ipv4.route.flush=1); then
            if output=$(grep "net.ipv4.conf.all.rp_filter[[:blank:]]=[[:blank:]]1" /etc/sysctl.conf); then
                echo "Applied - $TAGA"; 
            else
                echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.conf.all.rp_filter[[:blank:]]=[[:blank:]]1"  /etc/sysctl.conf); then
                    echo "Applied - $TAGA"; 
                else
                    echo "Failed - $TAGA";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.conf.all.rp_filter); then
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGB";
            fi
        else
            echo "Failed - $TAGA"; 
            echo "Failed - $TAGB";
        fi
        ### net.ipv4.conf.default.rp_filter
        if output=$(sysctl -w net.ipv4.conf.default.rp_filter=1 && sysctl -w net.ipv4.route.flush=1); then
            if output=$(grep "net.ipv4.conf.default.rp_filter[[:blank:]]=[[:blank:]]1" /etc/sysctl.conf); then
                echo "Applied - $TAGC";  
            else
                echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.conf.default.rp_filter[[:blank:]]=[[:blank:]]1" /etc/sysctl.conf); then
                    echo "Applied - $TAGC"; 
                else
                    echo "Failed - $TAGC";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.conf.default.rp_filter); then
                echo "Applied - $TAGD";
            else
                echo "Failed - $TAGD";
            fi 
        else
            echo "Failed - $TAGC";  
            echo "Failed - $TAGD";
        fi
    fi
}

function control_086ab {
    TAGA="086a - 3.2.8 (L1) Ensure TCP SYN Cookies is enabled - sysctl (Mandatory)"
    TAGB="086b - 3.2.8 (L1) Ensure TCP SYN Cookies is enabled - /etc/sysctl (Mandatory)"

    if [ ! -f "/etc/sysctl.conf-bk" ]; then
        if output=$(cp -rf /etc/sysctl.conf  /etc/sysctl.conf-bk); then
            slee 1 
        else
            echo "086ab - cannot backup file  /etc/sysctl.conf-bk"; sleep 1
        fi
    fi
    if [ -f "/etc/sysctl.conf-bk" ]; then
        ### net.ipv4.tcp_syncookies
        if output=$(sysctl -w net.ipv4.tcp_syncookies=1 && sysctl -w net.ipv4.route.flush=1); then
           if output=$(grep "net.ipv4.tcp_syncookies[[:blank:]]=[[:blank:]]1" /etc/sysctl.conf); then
                echo "Applied - $TAGA"; 
            else
                echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf
                if output=$(grep "net.ipv4.tcp_syncookies[[:blank:]]=[[:blank:]]1"  /etc/sysctl.conf); then
                    echo "Applied - $TAGA"; 
                else
                    echo "Failed - $TAGA";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv4.tcp_syncookies); then
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGB";
            fi
        else
            echo "Failed - $TAGA"; 
            echo "Failed - $TAGB";
        fi
    fi
}

function control_087abcd {
    TAGA="087a - 3.3.1 (L1) Ensure IPv6 router advertisements are not accepted - sysctl ipv6 default accept (Secondary)"
    TAGB="087b - 3.3.1 (L1) Ensure IPv6 router advertisements are not accepted - /etc/sysctl ipv6 default accept (Secondary)"
    TAGC="087c - 3.3.1 (L1) Ensure IPv6 router advertisements are not accepted - sysctl ipv6 all accept (Secondary)"
    TAGD="087d - 3.3.1 (L1) Ensure IPv6 router advertisements are not accepted - /etc/sysctl ipv6 all accept (Secondary)"

    if [ ! -f "/etc/sysctl.conf-bk" ]; then
        if output=$(cp -rf /etc/sysctl.conf  /etc/sysctl.conf-bk); then
            slee 1 
        else
            echo "087abcd - cannot backup file  /etc/sysctl.conf-bk"; sleep 1
        fi
    fi
    if [ -f "/etc/sysctl.conf-bk" ]; then
        ### sysctl -w net.ipv6.conf.default.accept_ra
        if output=$(sysctl -w net.ipv6.conf.default.accept_ra=0 && sysctl -w net.ipv6.route.flush=1); then
            if output=$(grep "net.ipv6.conf.default.accept_ra[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                echo "Applied - $TAGA"; 
            else
                echo "net.ipv6.conf.default.accept_ra = 0" >> /etc/sysctl.conf
                if output=$(grep "net.ipv6.conf.default.accept_ra[[:blank:]]=[[:blank:]]0"  /etc/sysctl.conf); then
                    echo "Applied - $TAGA"; 
                else
                    echo "Failed - $TAGA";
                fi
            fi
            if output=$(/sbin/sysctl  net.ipv6.conf.default.accept_ra); then
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGB";
            fi
        else
            echo "Failed - $TAGA"; 
            echo "Failed - $TAGB";
        fi
        ### sysctl -w net.ipv6.conf.all.accept_ra
        if output=$(sysctl -w net.ipv6.conf.all.accept_ra=0 && sysctl -w net.ipv6.route.flush=1); then
            if output=$(grep "net.ipv6.conf.all.accept_ra[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                echo "Applied - $TAGC";  
            else
                echo "net.ipv6.conf.all.accept_ra = 0" >> /etc/sysctl.conf
                if output=$(grep "net.ipv6.conf.all.accept_ra[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                    echo "Applied - $TAGC"; 
                else
                    echo "Failed - $TAGC";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv6.conf.all.accept_ra); then
                echo "Applied - $TAGD";
            else
                echo "Failed - $TAGD";
            fi     
        else
            echo "Failed - $TAGC";  
            echo "Failed - $TAGD";
        fi
    fi
}

function control_088abcd {
    TAGA="088a - 3.3.2 (L1) Ensure IPv6 redirects are not accepted - sysctl ipv6 default accept (Secondary)"
    TAGB="088b - 3.3.2 (L1) Ensure IPv6 redirects are not accepted - /etc/sysctl ipv6 default accept (Secondary)"
    TAGC="088c - 3.3.2 (L1) Ensure IPv6 redirects are not accepted - sysctl ipv6 all accept (Secondary)"
    TAGD="088d - 3.3.2 (L1) Ensure IPv6 redirects are not accepted - /etc/sysctl ipv6 all accept (Secondary)"

    if [ ! -f "/etc/sysctl.conf-bk" ]; then
        if output=$(cp -rf /etc/sysctl.conf  /etc/sysctl.conf-bk); then
            slee 1 
        else
            echo "088abcd - cannot backup file  /etc/sysctl.conf-bk"; sleep 1
        fi
    fi
    if [ -f "/etc/sysctl.conf-bk" ]; then
        ### sysctl -w net.ipv6.conf.default.accept_redirects
        if output=$(sysctl -w net.ipv6.conf.default.accept_redirects=0 && sysctl -w net.ipv6.route.flush=1); then
            if output=$(grep "net.ipv6.conf.default.accept_redirects[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                echo "Applied - $TAGA"; 
            else
                echo "net.ipv6.conf.default.accept_redirects = 0" >> /etc/sysctl.conf
                if output=$(grep "net.ipv6.conf.default.accept_redirects[[:blank:]]=[[:blank:]]0"  /etc/sysctl.conf); then
                    echo "Applied - $TAGA"; 
                else
                    echo "Failed - $TAGA";
                fi
            fi
            if output=$(/sbin/sysctl  net.ipv6.conf.default.accept_redirects); then
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGB";
            fi
        else
            echo "Failed - $TAGA"; 
            echo "Failed - $TAGB";
        fi
        ### sysctl -w net.ipv6.conf.all.accept_redirects=0
        if output=$(sysctl -w net.ipv6.conf.all.accept_redirects=0 && sysctl -w net.ipv6.route.flush=1); then
            if output=$(grep "net.ipv6.conf.all.accept_redirects[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                echo "Applied - $TAGC";  
            else
                echo "net.ipv6.conf.all.accept_redirects = 0" >> /etc/sysctl.conf
                if output=$(grep "net.ipv6.conf.all.accept_redirects[[:blank:]]=[[:blank:]]0" /etc/sysctl.conf); then
                    echo "Applied - $TAGC"; 
                else
                    echo "Failed - $TAGC";
                fi
            fi
            if output=$(/sbin/sysctl net.ipv6.conf.all.accept_redirects); then
                echo "Applied - $TAGD";
            else
                echo "Failed - $TAGD";
            fi       
        else
            echo "Failed - $TAGC";  
            echo "Failed - $TAGD";
        fi
    fi
}

function control_089 {
    TAG="089 - 3.3.3 (L1) Ensure IPv6 is disabled (Secondary)"
    if [ ! -f "/etc/default/grub-bk" ]; then
        cp -rf /etc/default/grub /etc/default/grub-bk
        sleep 1
    fi

    if [ -f "/etc/default/grub" ]; then
        if output=$(cat /etc/default/grub | grep "^[\s]*GRUB_CMDLINE_LINUX[\s]*=[\s]*".*ipv6.disable=1.*"[\s]*$"); then
            if output=$(grep "^\s*linux" /boot/grub2/grub.cfg | grep -e "ipv6.disable=1"); then
                grub2-mkconfig > /boot/grub2/grub.cfg
                echo "Applied - $TAG";
            else
                grub2-mkconfig > /boot/grub2/grub.cfg
                echo "Applied - $TAG";
            fi
        else
            if output=$(cat /etc/default/grub | grep  "GRUB_CMDLINE_LINUX[\s]*="); then
                sed -i 's/GRUB_CMDLINE_LINUX=\"/&ipv6.disable=1 /' /etc/default/grub
                grub2-mkconfig > /boot/grub2/grub.cfg
                if output=$(cat /etc/default/grub | grep "^[\s]*GRUB_CMDLINE_LINUX[\s]*=[\s]*".*ipv6.disable=1.*"[\s]*$"); then
                    echo "Applied - $TAG";
                fi
            else
                echo 'GRUB_CMDLINE_LINUX="ipv6.disable=1"' >> /etc/default/grub
                if output=$(grep "^\s*linux" /boot/grub2/grub.cfg | grep -e "ipv6.disable=1"); then
                    grub2-mkconfig > /boot/grub2/grub.cfg
                    echo "Applied - $TAG";
                else
                    grub2-mkconfig > /boot/grub2/grub.cfg
                    echo "Applied - $TAG";
                fi
            fi
        fi
    fi
}

function control_090 {
    TAG="090 - 3.4.1 (L1) Ensure TCP Wrappers is installed (Mandatory)"
    ## TCP Wrappers should be installed
    if output=$(rpm -q tcpd); then
        echo "Applied - $TAG";  
    else
        if output=$(zypper install tcpd); then
            echo "Applied - $TAG";
        else
            echo "Failed - $TAG"; 
        fi
    fi
}

function control_093abcd {
    TAGA="093a - 3.5.1 (L1) Ensure DCCP is disabled (Mandatory)"
    TAGB="093b - 3.5.2 (L1) Ensure SCTP is disabled (Mandatory)"
    TAGC="093c - 3.5.3 (L1) Ensure RDS is disabled (Mandatory)"
    TAGD="093d - 3.5.4 (L1) Ensure TIPC is disabled (Mandatory)"

    if [ ! -f "/etc/modprobe.d/CIS.conf-bk" ]; then
        if output=$(cp -rf /etc/modprobe.d/CIS.conf /etc/modprobe.d/CIS.conf-bk); then
            slee 1 
        else
            echo "093abcd - cannot backup file  /etc/modprobe.d/CIS.conf-bk"; sleep 1
        fi
    fi

    if [ -f "/etc/modprobe.d/CIS.conf-bk" ]; then
        if output=$(grep "^install\s\dccp\s\/bin/true$" /etc/modprobe.d/CIS.conf); then
            echo "Applied - $TAGA";
        else
            echo "install dccp /bin/true" >> /etc/modprobe.d/CIS.conf;
            echo "Applied - $TAGA";
        fi
        if output=$(grep "^install\s\sctp\s\/bin/true$" /etc/modprobe.d/CIS.conf); then
            echo "Applied - $TAGB";
        else
            echo "install sctp /bin/true" >> /etc/modprobe.d/CIS.conf;
            echo "Applied - $TAGB";
        fi
        if output=$(grep "^install\s\rds\s\/bin/true$" /etc/modprobe.d/CIS.conf); then
            echo "Applied - $TAGC";   
        else
            echo "install rds /bin/true" >> /etc/modprobe.d/CIS.conf;
            echo "Applied - $TAGC";
        fi
        if output=$(grep "^install\s\tipc\s\/bin/true$" /etc/modprobe.d/CIS.conf); then
            echo "Applied - $TAGD";
        else
            echo "install tipc /bin/true" >> /etc/modprobe.d/CIS.conf;
            echo "Applied - $TAGD";
        fi
    fi
}

function control_094 {
    sleep 1
    zypper remove iptables
    #Exception
}

function control_095abc {
    sleep 1
    #Exception
}

function control_100 {
    TAG="100 - 4.1.1.1 (L1) Ensure audit log storage size is configured (Mandatory)"
    if [ ! -f "/etc/audit/auditd.conf-bk" ]; then
        if output=$(cp -rf /etc/audit/auditd.conf /etc/audit/auditd.conf-bk); then
           sleep 1
        else
            echo "100 - cannot backup file /etc/audit/auditd.conf-bk";
        fi
    fi
    if [ -f "/etc/audit/auditd.conf-bk" ]; then
        if output=$(grep "max_log_file\s*=" /etc/audit/auditd.conf); then
            if output=$(sed -i "s/^\(max\_log\_file\s*=\s*\).*\$/\15/" /etc/audit/auditd.conf); then
                echo "Applied - $TAG";
            else 
                echo "Failed - $TAG";
            fi
        else
            echo "max_log_file = 5" >> /etc/audit/auditd.conf;
            echo "Applied - $TAG";
        fi
    fi
}

function control_101abc {
    TAGA="101a - 4.1.1.2 (L1) Ensure system is disabled when audit logs are full - space_left_action (Mandatory)"
    TAGB="101b - 4.1.1.2 (L1) Ensure system is disabled when audit logs are full - action_mail_acct (Mandatory)"
    TAGC="101c - 4.1.1.2 (L1) Ensure system is disabled when audit logs are full - admin_space_left_action (Mandatory)"
    if [ ! -f "/etc/audit/auditd.conf-bk" ]; then
        if output=$(cp -rf /etc/audit/auditd.conf /etc/audit/auditd.conf-bk); then
           sleep 1;
        else
            echo "101abc - cannot backup file /etc/audit/auditd.conf-bk";
        fi
    fi
    if [ -f "/etc/audit/auditd.conf-bk" ]; then
        if output=$(grep "space_left_action\s*=" /etc/audit/auditd.conf); then
            if output=$(sed -i "s/^\(space\_left\_action\s*=\s*\).*\$/\1EMAIL/" /etc/audit/auditd.conf); then
                echo "Applied - $TAGA";
            else 
                echo "Failed - $TAGA";
            fi
        else
            echo "space_left_action = EMAIL" >> /etc/audit/auditd.conf;
            echo "Applied - $TAGA";
        fi
        if output=$(grep "action_mail_acct\s*=" /etc/audit/auditd.conf); then
            if output=$(sed -i "s/^\(actio\_mail\_acct\s*=\s*\).*\$/\1root/" /etc/audit/auditd.conf); then
                echo "Applied - $TAGB";
            else 
                echo "Failed - $TAGB";
            fi
        else
            echo "action_mail_acct = root" >> /etc/audit/auditd.conf;
            echo "Applied - $TAGB";
        fi
        if output=$(grep "admin_space_left_action\s*=" /etc/audit/auditd.conf); then
            if output=$(sed -i "s/^\(admin\_space\_left\_action\s*=\s*\).*\$/\1halt/" /etc/audit/auditd.conf); then
                echo "Applied - $TAGC";
            else 
                echo "Failed - $TAGC";
            fi
        else
            echo "admin_space_left_action = halt" >> /etc/audit/auditd.conf;
            echo "Applied - $TAGC";
        fi
    fi
}

function control_102 {
    TAG="102 - 4.1.1.3 (L1) Ensure audit logs are not automatically deleted (Mandatory)"
    if [ ! -f "/etc/audit/auditd.conf-bk" ]; then
        if output=$(cp -rf /etc/audit/auditd.conf /etc/audit/auditd.conf-bk); then
           sleep 1;
        else
            echo "102 - cannot backup file /etc/audit/auditd.conf-bk";
        fi
    fi
    if [ -f "/etc/audit/auditd.conf-bk" ]; then
        if output=$(grep "max_log_file_action\s*=" /etc/audit/auditd.conf); then
            if output=$(sed -i "s/^\(max\_log\_file\_action\s*=\s*\).*\$/\1keep_logs/" /etc/audit/auditd.conf); then
                echo "Applied - $TAG";
            else 
                echo "Failed - $TAG";
            fi
        else
            echo "max_log_file_action = keep_logs" >> /etc/audit/auditd.conf;
            echo "Applied - $TAG";
        fi
    fi
}

function control_103 {
    TAG="103 - 4.1.2 (L1) Ensure auditd service is enabled (Mandatory)"
    if output=$(chkconfig auditd on); then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";
    fi
}

# Start to execute the script based on Suse11 or Suse12 ############################
function control_104 {
    TAG="104 - 4.1.3 (L1) Ensure auditing for processes that start prior to auditd is enabled (Mandatory)";
    if output=$(lsb_release -a | grep "SUSE.*11"); then
        if [ ! -f "/boot/grub/menu.lst-bk" ]; then
            if [ -f "/boot/grub/menu.lst" ]; then
                if output=$(cp -rf /boot/grub/menu.lst /boot/grub/menu.lst-bk 2>/dev/null); then 
                    sleep 1 
                else 
                    echo "104 - cannot backup /boot/grub/menu.lst"; 
                fi
            else
                echo "Failed - $TAG : could not find /boot/grub/menu.lst"
            fi
        fi
        if [ -f "/boot/grub/menu.lst-bk" ]; then
            if [ -f "/boot/grub/menu.lst" ]; then
                grep -q "kernel .*audit=" /boot/grub/menu.lst
                if [ $? -ne 0 ]; then
                    # syntax: sed 's/.*/PREFIX&SUFFIX/' in file
                    sed -i 's/kernel .*/& audit=1/' /boot/grub/menu.lst
                    echo "Applied - $TAG";
                else
                    sed -i 's/audit=.*/audit=1/' /boot/grub/menu.lst
                    echo "Applied - $TAG";
                fi
            fi
        fi
    fi
    if output=$(lsb_release -a | grep ".*SUSE.*12"); then
        if [ ! -f "/boot/grub2/grub.cfg-bk" ]; then
            if output=$(cp -rf /boot/grub2/grub.cfg  /boot/grub2/grub.cfg-bk 2>/dev/null); then
                sleep 1
            else
                echo "104 - cannot backup /boot/grub2/grub.cfg-bk";
            fi
        fi
        if output=$(grep ".*linux*.*audit=1" /boot/grub2/grub.cfg); then
            echo "Applied - $TAG";
        else
            # syntax: sed 's/.*/PREFIX&SUFFIX/' in file
            sed -i 's/linuxefi .*ro/& audit=1/' /boot/grub2/grub.cfg
            echo "Applied - $TAG";
        fi
    fi
}
# End to execute the script based on Suse11 or Suse12 ############################

function control_105abcdefghij {
    TAGA="105a - 4.1.4 (L1) Ensure events that modify date and time information are collected - audit.rules time-change (Mandatory)"
    TAGB="105b - 4.1.4 (L1) Ensure events that modify date and time information are collected - auditctl time-change (Mandatory)"
    TAGC="105c - 4.1.4 (L1) Ensure events that modify date and time information are collected - audit.rules b32 adjtimex (Mandatory)"
    TAGD="105d - 4.1.4 (L1) Ensure events that modify date and time information are collected - auditctl b32 adjtimex (Mandatory)"
    TAGE="105e - 4.1.4 (L1) Ensure events that modify date and time information are collected - audit.rules b32 clock_settime (Mandatory)"
    TAGF="105f - 4.1.4 (L1) Ensure events that modify date and time information are collected - auditctl b32 clock_settime (Mandatory)"
    TAGG="105g - 4.1.4 (L1) Ensure events that modify date and time information are collected - audit.rules b64 adjtimex (Mandatory)"
    TAGH="105h - 4.1.4 (L1) Ensure events that modify date and time information are collected - auditctl b64 adjtimex (Mandatory)"
    TAGI="105i - 4.1.4 (L1) Ensure events that modify date and time information are collected - audit.rules b64 clock_settime (Mandatory)"
    TAGJ="105j - 4.1.4 (L1) Ensure events that modify date and time information are collected - auditctl b64 clock_settime (Mandatory)"

    if [ ! -f "/etc/audit/audit.rules-bk" ]; then
        if output=$(cp -rf /etc/audit/audit.rules /etc/audit/audit.rules-bk); then
            sleep 1
        else
            echo "105 - cannot backup /etc/audit/audit.rules-bk"
        fi
    fi
    if [ -f "/etc/audit/audit.rules" ]; then
        sysarch=$(arch);
        if [[ "$sysarch" == "x86_32" || "$sysarch" == "x86_64" ]]; then
            ### add rule: -w /etc/localtime -p wa -k time-change
            if output=$(grep -e "-w /etc/localtime -p wa -k time-change" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
                #load audit configuration to audit system
                echo "Applied - $TAGA"; 
                echo "Applied - $TAGB";
            else
                echo "-w /etc/localtime -p wa -k time-change" >>  /etc/audit/audit.rules;
                echo "Applied - $TAGA"; 
                echo "Applied - $TAGB";
            fi
            ### add rule: -a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change
            if output=$(grep -e "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
                echo "Applied - $TAGC"; 
                echo "Applied - $TAGD";            
            else
                echo "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change" >>  /etc/audit/audit.rules;
                echo "Applied - $TAGC"; 
                echo "Applied - $TAGD"; 
            fi
            ### add rule: -a always,exit -F arch=b32 -S clock_settime -k time-change
            if output=$(grep -e "-a always,exit -F arch=b32 -S clock_settime -k time-change" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
                echo "Applied - $TAGE"; 
                echo "Applied - $TAGF";
            else
                echo "-a always,exit -F arch=b32 -S clock_settime -k time-change" >>  /etc/audit/audit.rules;
                echo "Applied - $TAGE"; 
                echo "Applied - $TAGF";
            fi
        else
            echo "105 - cannot match 32 bit or 64 bit arch - so it will ignore these control 105a, 105b, 105c, 105d, 105e and 105f"; sleep 1
        fi

        if [[ "$sysarch" == "x86_64" ]]; then
            ### add rule: -a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change
            if output=$(grep -e "-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
                echo "Applied - $TAGG"; 
                echo "Applied - $TAGH";
            else
                echo "-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change" >>  /etc/audit/audit.rules;
                echo "Applied - $TAGG"; 
                echo "Applied - $TAGH";
            fi
            ### add rule: -a always,exit -F arch=b64 -S clock_settime -k time-change
            if output=$(grep -e "-a always,exit -F arch=b64 -S clock_settime -k time-change" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
                echo "Applied - $TAGI"; 
                echo "Applied - $TAGJ";
            else
                echo "-a always,exit -F arch=b64 -S clock_settime -k time-change" >>  /etc/audit/audit.rules;
                echo "Applied - $TAGI"; 
                echo "Applied - $TAGJ";
            fi
        else
            echo "105 - cannot match 64 bit arch - so it will ignore these controls 105g, 105h, 105i and 105j"; sleep 1
        fi
    fi
}

function control_106abcdefghij {
    TAGA="106a - 4.1.5 (L1) Ensure events that modify user/group information are collected - /etc/group (Mandatory)"
    TAGB="106b - 4.1.5 (L1) Ensure events that modify user/group information are collected - auditctl /etc/group (Mandatory)"
    TAGC="106c - 4.1.5 (L1) Ensure events that modify user/group information are collected - /etc/passwd (Mandatory)"
    TAGD="106d - 4.1.5 (L1) Ensure events that modify user/group information are collected - auditctl /etc/passwd (Mandatory)"
    TAGE="106e - 4.1.5 (L1) Ensure events that modify user/group information are collected - /etc/gshadow (Mandatory)"
    TAGF="106f - 4.1.5 (L1) Ensure events that modify user/group information are collected - auditctl /etc/gshadow (Mandatory)"
    TAGG="106g - 4.1.5 (L1) Ensure events that modify user/group information are collected - /etc/shadow (Mandatory)"
    TAGH="106h - 4.1.5 (L1) Ensure events that modify user/group information are collected - auditctl /etc/shadow (Mandatory)"
    TAGI="106i - 4.1.5 (L1) Ensure events that modify user/group information are collected - /etc/security/opasswd (Mandatory)"
    TAGJ="106j - 4.1.5 (L1) Ensure events that modify user/group information are collected - auditctl /etc/security/opasswd (Mandatory)"

    if [ ! -f "/etc/audit/audit.rules-bk" ]; then
        if output=$(cp -rf /etc/audit/audit.rules /etc/audit/audit.rules-bk); then
            sleep 1
        else
            echo "106 - cannot backup /etc/audit/audit.rules-bk"
        fi
    fi
    if [ -f "/etc/audit/audit.rules-bk" ]; then
        ### add rule: -w /etc/group -p wa -k identity
        if output=$(grep -e "-w /etc/group -p wa -k identity" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";
        else
            echo "-w /etc/group -p wa -k identity" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";
        fi
        ### add rule: -w /etc/passwd -p wa -k identity
        if output=$(grep -e "-w /etc/passwd -p wa -k identity" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";
        else
            echo "-w /etc/passwd -p wa -k identity" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";
        fi
        ### add rule: -w /etc/gshadow -p wa -k identity
        if output=$(grep -e "-w /etc/gshadow -p wa -k identity" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF";   
        else
            echo "-w /etc/gshadow -p wa -k identity" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF"; 
        fi
        ### add rule: -w /etc/shadow -p wa -k identity
        if output=$(grep -e "-w /etc/shadow -p wa -k identity" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGG"; 
            echo "Applied - $TAGH";
        else
            echo "-w /etc/shadow -p wa -k identity" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGG"; 
            echo "Applied - $TAGH";
        fi
        ### add rule: -w /etc/security/opasswd -p wa -k identity
        if output=$(grep -e "-w /etc/security/opasswd -p wa -k identity" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGI"; 
            echo "Applied - $TAGJ";   
        else
            echo "-w /etc/security/opasswd -p wa -k identity" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGI"; 
            echo "Applied - $TAGJ"; 
        fi
    fi
}

function control_107abcdefghijkl {
    TAGA="107a - 4.1.6 (L1) Ensure events that modify the system's network environment are collected - b32 sethostname (Mandatory)"
    TAGB="107b - 4.1.6 (L1) Ensure events that modify the system's network environment are collected - auditctl b32 sethostname (Mandatory)"
    TAGC="107c - 4.1.6 (L1) Ensure events that modify the system's network environment are collected - /etc/issue (Mandatory)"
    TAGD="107d - 4.1.6 (L1) Ensure events that modify the system's network environment are collected - auditctl /etc/issue (Mandatory)"
    TAGE="107e - 4.1.6 (L1) Ensure events that modify the system's network environment are collected - /etc/issue.net (Mandatory)"
    TAGF="107f - 4.1.6 (L1) Ensure events that modify the system's network environment are collected - auditctl /etc/issue.net (Mandatory)"
    TAGG="107g - 4.1.6 (L1) Ensure events that modify the system's network environment are collected - /etc/hosts (Mandatory)"
    TAGH="107h - 4.1.6 (L1) Ensure events that modify the system's network environment are collected - auditctl /etc/hosts (Mandatory)"
    TAGI="107i - 4.1.6 (L1) Ensure events that modify the system's network environment are collected - /etc/sysconfig/network (Mandatory)"
    TAGJ="107j - 4.1.6 (L1) Ensure events that modify the system's network environment are collected - auditctl /etc/sysconfig/network (Mandatory)"
    TAGK="107k - 4.1.6 (L1) Ensure events that modify the system's network environment are collected - b64 sethostname (Mandatory)"
    TAGL="107l - 4.1.6 (L1) Ensure events that modify the system's network environment are collected - auditctl b64 sethostname (Mandatory)";

    if [ ! -f "/etc/audit/audit.rules-bk" ]; then
        if output=$(cp -rf /etc/audit/audit.rules /etc/audit/audit.rules-bk); then
            sleep 1
        else
            echo "107 - cannot backup /etc/audit/audit.rules-bk"
        fi
    fi
    if [ -f "/etc/audit/audit.rules-bk" ]; then
        ### add rule: -a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale
        if output=$(grep -e "-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";    
        else
            echo "-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";    
        fi
        ### add rule: -w /etc/issue -p wa -k system-locale
        if output=$(grep -e "-w /etc/issue -p wa -k system-locale" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";    
        else
            echo "-w /etc/issue -p wa -k system-locale" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";
        fi
        ### add rule: -w /etc/issue.net -p wa -k system-locale
        if output=$(grep -e "-w /etc/issue.net -p wa -k system-locale" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF";   
        else
            echo "-w /etc/issue.net -p wa -k system-locale" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF"; 
        fi
        ### add rule: -w /etc/hosts -p wa -k system-locale
        if output=$(grep -e "-w /etc/hosts -p wa -k system-locale" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGG"; 
            echo "Applied - $TAGH";   
        else
            echo "-w /etc/hosts -p wa -k system-locale" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGG"; 
            echo "Applied - $TAGH";
        fi
        ### add rule: -w /etc/sysconfig/network -p wa -k system-locale
        if output=$(grep -e "-w /etc/sysconfig/network -p wa -k system-locale" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGI"; 
            echo "Applied - $TAGJ";   
        else
            echo "-w /etc/sysconfig/network -p wa -k system-locale" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGI"; 
            echo "Applied - $TAGJ";
        fi
        ### add rule: -a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale
        if output=$(grep -e "-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGK"; 
            echo "Applied - $TAGL";  
        else
            echo "-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGK"; 
            echo "Applied - $TAGL"; 
        fi
    fi
}

function control_108abcdefgh {
    TAGA="108a - 4.1.7 (L1) Ensure events that modify the system's Mandatory Access Controls are collected - /etc/apparmor/ (Mandatory)"
    TAGB="108b - 4.1.7 (L1) Ensure events that modify the system's Mandatory Access Controls are collected - auditctl /etc/apparmor/ (Mandatory)"
    TAGC="108c - 4.1.7 (L1) Ensure events that modify the system's Mandatory Access Controls are collected - /etc/apparmor.d/ (Mandatory)"
    TAGD="108d- 4.1.7 (L1) Ensure events that modify the system's Mandatory Access Controls are collected - auditctl /etc/apparmor.d/ (Mandatory)"
    TAGE="108e - 4.1.7 (L1) Ensure events that modify the system's Mandatory Access Controls are collected - /etc/selinux/ (Mandatory)"
    TAGF="108f - 4.1.7 (L1) Ensure events that modify the system's Mandatory Access Controls are collected - auditctl /etc/selinux/ (Mandatory)"
    TAGG="108g - 4.1.7 (L1) Ensure events that modify the system's Mandatory Access Controls are collected - /usr/share/selinux/ (Mandatory)"
    TAGH="108h - 4.1.7 (L1) Ensure events that modify the system's Mandatory Access Controls are collected - auditctl /usr/share/selinux/ (Mandatory)"

    if [ ! -f "/etc/audit/audit.rules-bk" ]; then
        if output=$(cp -rf /etc/audit/audit.rules /etc/audit/audit.rules-bk); then
            sleep 1
        else
            echo "108 - cannot backup /etc/audit/audit.rules-bk"
        fi
    fi
    if [ -f "/etc/audit/audit.rules-bk" ]; then
        ### add rule: -w /etc/apparmor/ -p wa -k MAC-policy
        if output=$(grep -e "-w /etc/apparmor/ -p wa -k MAC-policy" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then  
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";   
        else
            echo "-w /etc/apparmor/ -p wa -k MAC-policy" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";  
        fi
        ### add rule: -w /etc/apparmor.d/ -p wa -k MAC-policy
        if output=$(grep -e "-w /etc/apparmor.d/ -p wa -k MAC-policy" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";   
        else
            echo "-w /etc/apparmor.d/ -p wa -k MAC-policy" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";   
        fi
        ### add rule: -w /etc/selinux/ -p wa -k MAC-policy
        if output=$(grep -e "-w /etc/selinux/ -p wa -k MAC-policy" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF";   
        else
            echo "-w /etc/selinux/ -p wa -k MAC-policy" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF";
        fi
        ### add rule: -w /usr/share/selinux/ -p wa -k MAC-policy
        if output=$(grep -e "-w /usr/share/selinux/ -p wa -k MAC-policy" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAGG"; 
            echo "Applied - $TAGH";  
        else
            echo "-w /usr/share/selinux/ -p wa -k MAC-policy" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGG"; 
            echo "Applied - $TAGH";  
        fi
    fi

}

function control_109abcdef {
    if [ ! -f "/etc/audit/audit.rules-bk" ]; then
        if output=$(cp -rf /etc/audit/audit.rules /etc/audit/audit.rules-bk); then
            sleep 1
        else
            echo "109 - cannot backup /etc/audit/audit.rules-bk"
        fi
    fi
    if output=$(lsb_release -a | grep "SUSE.*11"); then
        TAGA="109a - 4.1.8 (L1) Ensure login and logout events are collected - faillog (Mandatory)"
        TAGB="109b - 4.1.8 (L1) Ensure login and logout events are collected - auditctl faillog (Mandatory)"
        TAGC="109c - 4.1.8 (L1) Ensure login and logout events are collected - lastlog (Mandatory)"
        TAGD="109d - 4.1.8 (L1) Ensure login and logout events are collected - auditctl lastlog (Mandatory)"
        TAGE="109e - 4.1.8 (L1) Ensure login and logout events are collected - tallylog (Mandatory)"
        TAGF="109f - 4.1.8 (L1) Ensure login and logout events are collected - auditctl tallylog (Mandatory)"
        if [ -f "/etc/audit/audit.rules-bk" ]; then

            ### add rule: -w /var/log/faillog -p wa -k logins
            if output=$(grep -e "-w /var/log/faillog -p wa -k logins" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
                
                echo "Applied - $TAGA"; 
                echo "Applied - $TAGB";   
            else
                echo "-w /var/log/faillog -p wa -k logins" >>  /etc/audit/audit.rules;
                
                echo "Applied - $TAGA"; 
                echo "Applied - $TAGB";  
            fi
            ### add rule: -w /var/log/lastlog -p wa -k logins
            if output=$(grep -e "-w /var/log/lastlog -p wa -k logins" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
                
                echo "Applied - $TAGC"; 
                echo "Applied - $TAGD";   
            else
                echo "-w /var/log/lastlog -p wa -k logins" >>  /etc/audit/audit.rules;
                
                echo "Applied - $TAGC"; 
                echo "Applied - $TAGD";  
            fi
            ### add rule: -w /var/log/tallylog -p wa -k logins
            if output=$(grep -e "-w /var/log/tallylog -p wa -k logins" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
                
                echo "Applied - $TAGE"; 
                echo "Applied - $TAGF";  
            else
                echo "-w /var/log/tallylog -p wa -k logins" >>  /etc/audit/audit.rules;
                
                echo "Applied - $TAGE"; 
                echo "Applied - $TAGF";   
            fi
        fi
    elif output=$(lsb_release -a | grep "SUSE.*12"); then
        TAGA="109a - 4.1.8 (L2) Ensure login and logout events are collected - /var/log/lastlog (Mandatory)"
        TAGB="109b - 4.1.8 (L2) Ensure login and logout events are collected - auditctl /var/log/lastlog (Mandatory)"
        TAGC="109c - 4.1.8 (L2) Ensure login and logout events are collected - /var/run/faillock/ (Mandatory)"
        TAGD="109d - 4.1.8 (L2) Ensure login and logout events are collected - auditctl /var/run/faillock/ (Mandatory)"

        if [ -f "/etc/audit/audit.rules-bk" ]; then
            if output=$(grep -e "-w /var/log/lastlog -p wa -k logins" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
                echo "Applied - $TAGA";
                echo "Applied - $TAGB";
            else
                echo "-w /var/log/lastlog -p wa -k logins" >> /etc/audit/audit.rules;
                echo "Applied - $TAGA";
                echo "Applied - $TAGB";
            fi

            if output=$(grep -e "-w /var/run/faillock/ -p wa -k logins" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
                echo "Applied - $TAGC";
                echo "Applied - $TAGD";
            else
                echo "-w /var/run/faillock/ -p wa -k logins" >> /etc/audit/audit.rules;
                echo "Applied - $TAGC";
                echo "Applied - $TAGD";
            fi
        fi
    fi
}

function control_110abcdef {
    TAGA="110a - 4.1.9 (L1) Ensure session initiation information is collected - utmp (Mandatory)"
    TAGB="110b - 4.1.9 (L1) Ensure session initiation information is collected - auditctl utmp (Mandatory)"
    TAGC="110c - 4.1.9 (L1) Ensure session initiation information is collected - wtmp (Mandatory)"
    TAGD="110d - 4.1.9 (L1) Ensure session initiation information is collected - auditctl wtmp (Mandatory)"
    TAGE="110e - 4.1.9 (L1) Ensure session initiation information is collected - btmp (Mandatory)"
    TAGF="110f - 4.1.9 (L1) Ensure session initiation information is collected - auditctl btmp (Mandatory)"

    if [ ! -f "/etc/audit/audit.rules-bk" ]; then
        if output=$(cp -rf /etc/audit/audit.rules /etc/audit/audit.rules-bk); then
            sleep 1
        else
            echo "110 - cannot backup /etc/audit/audit.rules-bk"
        fi
    fi

    if [ -f "/etc/audit/audit.rules-bk" ]; then
        ### add rule: -w /var/run/utmp -p wa -k session
        if output=$(grep -e "-w /var/run/utmp -p wa -k session" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB"; 
        else
            echo "-w /var/run/utmp -p wa -k session" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";
        fi
        ### add rule: -w /var/log/wtmp -p wa -k logins
        if output=$(grep -e "-w /var/log/wtmp -p wa -k logins" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";  
        else
            echo "-w /var/log/wtmp -p wa -k logins" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";
        fi
        ### add rule: -w /var/log/btmp -p wa -k logins
        if output=$(grep -e "-w /var/log/btmp -p wa -k logins" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF";
        else
            echo "-w /var/log/btmp -p wa -k logins" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF";
        fi
    fi
}

function control_111abcdefghij {
    TAGA="111a - 4.1.10 (L2) Ensure discretionary access control permission modification events are collected - b32 chown fchown (Mandatory)"
    TAGB="111b - 4.1.10 (L2) Ensure discretionary access control permission modification events are collected - auditctl b32 chown fchown (Mandatory)"
    TAGC="111c - 4.1.10 (L2) Ensure discretionary access control permission modification events are collected - b32 setxattr (Mandatory)"
    TAGD="111d - 4.1.10 (L2) Ensure discretionary access control permission modification events are collected - auditctl b32 setxattr (Mandatory)"
    TAGE="111e - 4.1.10 (L2) Ensure discretionary access control permission modification events are collected - b32 chmod fchmod (Mandatory)"
    TAGF="111f - 4.1.10 (L2) Ensure discretionary access control permission modification events are collected - auditctl b32 chmod fchmod (Mandatory)"
    TAGG="111g - 4.1.10 (L2) Ensure discretionary access control permission modification events are collected - b64 setxattr (Mandatory)"
    TAGH="111h - 4.1.10 (L2) Ensure discretionary access control permission modification events are collected - auditctl b64 setxattr (Mandatory)"
    TAGI="111i - 4.1.10 (L2) Ensure discretionary access control permission modification events are collected - b64 chmod fchmod (Mandatory)"
    TAGJ="111j - 4.1.10 (L2) Ensure discretionary access control permission modification events are collected - auditctl b64 chmod fchmod (Mandatory)"
    sysarch=$(arch);
    if [[ "$sysarch" == "x86_32" ||  "$sysarch" == "x86_64" ]]; then
        ### add rule: -a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod
        if output=$(grep -e "-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules  /etc/audit/rules.d/*); then
            sleep 1
        else
            echo "-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod" >>  /etc/audit/audit.rules;
            sleep 1
        fi
        ### add rule: -a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod
        if output=$(grep -e "-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules  /etc/audit/rules.d/*); then
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";
        else
            echo "-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGA";
            echo "Applied - $TAGB";
        fi
        ### add rule: -a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod
        if output=$(grep -e "-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules  /etc/audit/rules.d/*); then
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";
        else
            echo "-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";
        fi
        ### add rule: -a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod
        if output=$(grep -e "-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules /etc/audit/rules.d/*); then
            
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF";
        else
            echo "-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF";
        fi
    fi
    if [[ "$sysarch" == "x86_64" ]]; then
        ### -a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod
        if output=$(grep -e "-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules  /etc/audit/rules.d/*); then
            echo "Applied - $TAGG"; 
            echo "Applied - $TAGH";
        else
            echo "-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGG"; 
            echo "Applied - $TAGH";
        fi
        ### -a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod
        
        if output=$(grep -e "-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules  /etc/audit/rules.d/*); then
            
            echo "Applied - $TAGI"; 
            echo "Applied - $TAGJ";    
        else
            echo "-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGI"; 
            echo "Applied - $TAGJ";
        fi
    fi
}

function control_112abcdefgh {
    TAGA="112a - 4.1.11 (L2) Ensure unsuccessful unauthorized file access attempts are collected - b32 EACCES (Mandatory)"
    TAGB="112b - 4.1.11 (L2) Ensure unsuccessful unauthorized file access attempts are collected - auditctl b32 EACCES (Mandatory)"
    TAGC="112c - 4.1.11 (L2) Ensure unsuccessful unauthorized file access attempts are collected - b32 EPERM (Mandatory)"
    TAGD="112d - 4.1.11 (L2) Ensure unsuccessful unauthorized file access attempts are collected - auditctl b32 EPERM (Mandatory)"
    TAGE="112e - 4.1.11 (L2) Ensure unsuccessful unauthorized file access attempts are collected - b64 EACCES (Mandatory)"
    TAGF="112f - 4.1.11 (L2) Ensure unsuccessful unauthorized file access attempts are collected - auditctl b64 EACCES (Mandatory)"
    TAGG="112g - 4.1.11 (L2) Ensure unsuccessful unauthorized file access attempts are collected - b64 EPERM (Mandatory)"
    TAGH="112h - 4.1.11 (L2) Ensure unsuccessful unauthorized file access attempts are collected - auditctl b64 EPERM (Mandatory)"
    sysarch=$(arch);
    if [[ "$sysarch" == "x86_32" ||  "$sysarch" == "x86_64" ]]; then
        ### add rule: -a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access
        if output=$(grep -e "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules  /etc/audit/rules.d/*); then
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";
        else
            echo "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access" >>  /etc/audit/audit.rules;
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";  
        fi
        ### add rule: -a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access
        if output=$(grep -e "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules  /etc/audit/rules.d/*); then
            
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";  
        else
            echo "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";   
        fi
    fi
    if [[ "$sysarch" == "x86_64" ]]; then
        ### add rule: -a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access
        if output=$(grep -e "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules  /etc/audit/rules.d/*); then
            
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF";  
        else
            echo "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF";  
        fi
        ### add rule: -a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access
        if output=$(grep -e "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules  /etc/audit/rules.d/*s); then
            
            echo "Applied - $TAGG"; 
            echo "Applied - $TAGH";  
        else
            echo "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGG"; 
            echo "Applied - $TAGH";
        fi
    fi
}

function control_113 {
    TAG="113 - 4.1.12 (L2) Ensure use of privileged commands is collected (Mandatory)"
    if [ -f "/etc/audit/audit.rules-bk" ]; then
        if output=$(grep -e "-a always,exit -F path=/sbin/unix2_chkpwd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAG";
        else
            echo "-a always,exit -F path=/sbin/unix2_chkpwd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" >> /etc/audit/audit.rules;
            echo "Applied - $TAG";
        fi

        if output=$(grep -e "-a always,exit -F path=/sbin/unix_chkpwd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAG";
        else
            echo "-a always,exit -F path=/sbin/unix_chkpwd -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" >> /etc/audit/audit.rules;
            echo "Applied - $TAG";
        fi

        if output=$(grep -e "-a always,exit -F path=/sbin/mount.nfs -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAG";
        else
            echo "-a always,exit -F path=/sbin/mount.nfs -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" >> /etc/audit/audit.rules;
            echo "Applied - $TAG";
        fi

        if output=$(grep -e "-a always,exit -F path=/lib/dbus-1/dbus-daemon-launch-helper -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            echo "Applied - $TAG";
        else
            echo "-a always,exit -F path=/lib/dbus-1/dbus-daemon-launch-helper -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" >> /etc/audit/audit.rules;
            echo "Applied - $TAG";
        fi
    fi
}

function control_114abcd {
    TAGA="114a - 4.1.13 (L2) Ensure successful file system mounts are collected - b64 (Mandatory)"
    TAGB="114b - 4.1.13 (L2) Ensure successful file system mounts are collected - auditctl b64 (Mandatory)"
    TAGC="114c - 4.1.13 (L2) Ensure successful file system mounts are collected - b32 (Mandatory)"
    TAGD="114d - 4.1.13 (L2) Ensure successful file system mounts are collected - auditctl b32 (Mandatory)"
    sysarch=$(arch);
    if [[ "$sysarch" == "x86_64" ]]; then
        ### add rule: -a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts
        if output=$(grep -e "-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB"; 
        else
            echo "-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";  
        fi
    fi
    if [[ "$sysarch" == "x86_32" ||  "$sysarch" == "x86_64" ]]; then
        ### add rule: -a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts
        if output=$(grep -e "-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD"; 
        else
            echo "-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";  
        fi
    fi
}

function control_115abcd {
    TAGA="115a - 4.1.14 (L2) Ensure file deletion events by users are collected - b64 unlink (Mandatory)"
    TAGB="115b - 4.1.14 (L2) Ensure file deletion events by users are collected - auditctl b64 unlink (Mandatory)"
    TAGC="115c - 4.1.14 (L2) Ensure file deletion events by users are collected - b32 unlink (Mandatory)"
    TAGD="115c - 4.1.14 (L2) Ensure file deletion events by users are collected - b32 unlink (Mandatory)"
    sysarch=$(arch);
    if [[ "$sysarch" == "x86_64" ]]; then
        ### add rule: -a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete
        if output=$(grep -e "-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";   
        else
            echo "-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB"; 
        fi
    fi
    if [[ "$sysarch" == "x86_32" ||  "$sysarch" == "x86_64" ]]; then
        ### add rule: -a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete
        if output=$(grep -e "-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD"; 
        else
            echo "-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";  
        fi
    fi
}

function control_116abcd {
    TAGA="116a - 4.1.15 (L2) Ensure changes to system administration scope (sudoers) is collected - /etc/sudoers.d (Mandatory)"
    TAGB="116b - 4.1.15 (L2) Ensure changes to system administration scope (sudoers) is collected - auditctl /etc/sudoers.d (Mandatory)"
    TAGC="116c - 4.1.15 (L2) Ensure changes to system administration scope (sudoers) is collected - /etc/sudoers (Mandatory)"
    TAGD="116d - 4.1.15 (L2) Ensure changes to system administration scope (sudoers) is collected - auditctl /etc/sudoers (Mandatory)"
    if [ ! -f "/etc/audit/audit.rules-bk" ]; then
        if output=$(cp -rf /etc/audit/audit.rules /etc/audit/audit.rules-bk); then
            sleep 1
        else
            echo "116 - cannot backup /etc/audit/audit.rules-bk"
        fi
    fi
    if [ -f "/etc/audit/audit.rules-bk" ]; then
        ### add rule: -w /etc/sudoers.d/ -p wa -k scope
        if output=$(grep -e "-w /etc/sudoers.d/ -p wa -k scope" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules  /etc/audit/rules.d/*); then
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";
        else
            echo "-w /etc/sudoers.d/ -p wa -k scope" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";
        fi
        ### add rule: -w /etc/sudoers -p wa -k scope
        if output=$(grep -e "-w /etc/sudoers -p wa -k scope" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";
        else
            echo "-w /etc/sudoers -p wa -k scope" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";
        fi
    fi
}

function control_117ab {
    TAGA="117a - 4.1.16 (L2) Ensure system administrator actions (sudolog) are collected (Mandatory)"
    TAGB="117b - 4.1.16 (L2) Ensure system administrator actions (sudolog) are collected - auditctl (Mandatory)"
    if [ ! -f "/etc/audit/audit.rules-bk" ]; then
        if output=$(cp -rf /etc/audit/audit.rules /etc/audit/audit.rules-bk); then
            sleep 1
        else
            echo "117 - cannot backup /etc/audit/audit.rules-bk"
        fi
    fi
    if [ -f "/etc/audit/audit.rules-bk" ]; then
        ### add rule: -w /var/log/sudo.log -p wa -k actions
        if output=$(grep -e "-w /var/log/sudo.log -p wa -k actions" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";
        else
            echo "-w /var/log/sudo.log -p wa -k actions" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGA"; 
            echo "Applied - $TAGB";
        fi
    fi
}

function control_118abcdefgh {
    TAGA="118a - 4.1.17 (L2) Ensure kernel module loading and unloading is collected - init_module (Mandatory)"
    TAGB="118b - 4.1.17 (L2) Ensure kernel module loading and unloading is collected - auditctl init_module (Mandatory)"
    TAGC="118c - 4.1.17 (L2) Ensure kernel module loading and unloading is collected - insmod (Mandatory)"
    TAGD="118d - 4.1.17 (L2) Ensure kernel module loading and unloading is collected - auditctl insmod (Mandatory)"
    TAGE="118e - 4.1.17 (L2) Ensure kernel module loading and unloading is collected - rmmod (Mandatory)"
    TAGF="118f - 4.1.17 (L2) Ensure kernel module loading and unloading is collected - auditctl rmmod (Mandatory)"
    TAGG="118g - 4.1.17 (L2) Ensure kernel module loading and unloading is collected - modprobe (Mandatory)"
    TAGH="118h - 4.1.17 (L2) Ensure kernel module loading and unloading is collected - auditctl modprobe (Mandatory)"

    sysarch=$(arch);
    if [[ "$sysarch" == "x86_32" ||  "$sysarch" == "x86_64" ]]; then
        ### add rule: -a always,exit -F arch=b64 -S init_module -S delete_module -k modules  
        if output=$(grep -e "-a always,exit -F arch=b64 -S init_module -S delete_module -k modules" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGA";
        else
            echo "-a always,exit -F arch=b64 -S init_module -S delete_module -k modules" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGA";
        fi
        ### add rule: -a always,exit -F arch=b32 -S init_module -S delete_module -k modules
        if output=$(grep -e "-a always,exit -F arch=b32 -S init_module -S delete_module -k modules" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGB";
        else
            echo "-a always,exit -F arch=b32 -S init_module -S delete_module -k modules" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGB";
        fi
        ### add rule: -w /sbin/insmod -p x -k modules
        if output=$(grep -e "-w /sbin/insmod -p x -k modules" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";
        else
            echo "-w /sbin/insmod -p x -k modules" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGC"; 
            echo "Applied - $TAGD";
        fi
        ### add rule:-w /sbin/rmmod -p x -k modules
        if output=$(grep -e "-w /sbin/rmmod -p x -k modules" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF";
        else
            echo "-w /sbin/rmmod -p x -k modules" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGE"; 
            echo "Applied - $TAGF"; 
        fi
        ### add rule: -w /sbin/modprobe -p x -k modules
        if output=$(grep -e "-w /sbin/modprobe -p x -k modules" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
            
            echo "Applied - $TAGG"; 
            echo "Applied - $TAGH";  
        else
            echo "-w /sbin/modprobe -p x -k modules" >>  /etc/audit/audit.rules;
            
            echo "Applied - $TAGG"; 
            echo "Applied - $TAGH";
        fi
    fi
}

function control_119 {
    TAG="119 - 4.1.18 (L2) Ensure the audit configuration is immutable (Mandatory)"
    if [ ! -f "/etc/audit/audit.rules-bk" ]; then
        if output=$(cp -rf /etc/audit/audit.rules /etc/audit/audit.rules-bk); then
            sleep 1
        else
            echo "119 - cannot backup /etc/audit/audit.rules-bk"
        fi
    fi
    ### add rule: -e 2
    if output=$(grep -e "-e 2" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
        echo "Applied - $TAG";
    elif output=$(grep -e "#-e" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
        if output=$(sed -i 's/#-e.*./-e 2/'  /etc/audit/audit.rules); then
            
            echo "Applied - $TAG"; 
        fi
    elif output=$(grep -e "-e" /etc/audit/audit.rules  /etc/audit/rules.d/audit.rules); then
        if output=$(sed -i 's/-e.*./-e 2/'  /etc/audit/audit.rules); then
            
            echo "Applied - $TAG"; 
        fi
    else
        echo "-e 2" >> /etc/audit/audit.rules;
        
        echo "Applied - $TAG";  
    fi
}

function control_120abc {
    TAGA="120a - 4.2.1.1 (L1) Ensure rsyslog Service is enabled - chkconfig (Mandatory)"
    TAGB="120b - 4.2.1.1 (L1) Ensure rsyslog Service is enabled - /etc/sysconfig/syslog (Mandatory)"
    TAGC="120c - 4.2.2.1 (L1) Ensure syslog-ng service is enabled (Mandatory)"
    if output=$(systemctl enable rsyslog 2>/dev/null || chkconfig syslog on 2>/dev/null); then
        echo "Applied - $TAGA";
        if output=$(chkconfig syslog on 2>/dev/null); then
            if output=$(sed -i "s/SYSLOG_DAEMON=.*./SYSLOG_DAEMON='rsyslogd'/" /etc/sysconfig/syslog); then
                echo "Applied - $TAGB"; 
                echo "Applied - $TAGC";
            fi
        fi
    else
        echo "Failed - $TAGA"; 
        echo "Failed - $TAGB"; 
        echo "Failed - $TAGC";
    fi
}

function control_121abcdefghijklmno {
    TAGA="121a - 4.2.1.2 (L1) ensure logging is configured - '*.emerg :omusrmsg:*' (Mandatory)"
    TAGB="121b - 4.2.1.2 (L1) ensure logging is configured - 'mail.* -/var/log/mail' (Mandatory)"
    TAGC="121c - 4.2.1.2 (L1) ensure logging is configured - 'mail.info -/var/log/mail.info' (Mandatory)"
    TAGD="121d - 4.2.1.2 (L1) ensure logging is configured - 'mail.warning -/var/log/mail.warn' (Mandatory)"
    TAGE="121e - 4.2.1.2 (L1) ensure logging is configured - 'mail.err /var/log/mail.err' (Mandatory)"
    TAGF="121f - 4.2.1.2 (L1) ensure logging is configured - 'news.crit -/var/log/news/news.crit' (Mandatory)"
    TAGG="121g - 4.2.1.2 (L1) ensure logging is configured - 'news.err -/var/log/news/news.err' (Mandatory)"
    TAGH="121h - 4.2.1.2 (L1) ensure logging is configured - 'news.notice -/var/log/news/news.notice' (Mandatory)"
    TAGI="121i - 4.2.1.2 (L1) ensure logging is configured - '*.=warning;*.=err -/var/log/warn' (Mandatory)"
    TAGJ="121j - 4.2.1.2 (L1) ensure logging is configured - '*.crit /var/log/warn' (Mandatory)"
    TAGK="121k - 4.2.1.2 (L1) ensure logging is configured - '*.*;mail.none;news.none -/var/log/messages' (Mandatory)"
    TAGL="121l - 4.2.1.2 (L1) ensure logging is configured - 'local0,local1.* -/var/log/localmessages' (Mandatory)"
    TAGM="121m - 4.2.1.2 (L1) ensure logging is configured - 'local2,local3.* -/var/log/localmessages' (Mandatory)"
    TAGN="121n - 4.2.1.2 (L1) ensure logging is configured - 'local4,local5.* -/var/log/localmessages' (Mandatory)"
    TAGO="121o - 4.2.1.2 (L1) ensure logging is configured - 'local6,local7.* -/var/log/localmessages' (Mandatory)"

    if [ ! -f "/etc/rsyslog.conf-bk " ]; then
        cp -rf /etc/rsyslog.conf /etc/rsyslog.conf-bk
        sleep 1
    fi

    if [ -f "/etc/rsyslog.conf-bk" ]; then
        if [ -f "/etc/rsyslog.conf" ]; then
            ##TAGA
            if output=$(grep '^s*\*\.emerg' /etc/rsyslog.conf  /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGA";
            else
                echo "*.emerg                                  :omusrmsg:*" >> /etc/rsyslog.conf;
                echo "Applied - $TAGA";
            fi
            ##TAGB
            if output=$(/bin/grep '^s*mail\.\*' /etc/rsyslog.conf  /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGB";
            else
                echo "mail.*                                  -/var/log/mail" >> /etc/rsyslog.conf;
                echo "Applied - $TAGB";
            fi
            ##TAGC
            if output=$(/bin/grep '^s*mail\.info' /etc/rsyslog.conf  /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGC";
            else
                echo "mail.info                               -/var/log/mail.info" >> /etc/rsyslog.conf;
                echo "Applied - $TAGC";
            fi
            ##TAGD
            if output=$(/bin/grep '^s*mail\.warning' /etc/rsyslog.conf  /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGD";
            else
                echo "mail.warning                            -/var/log/mail.warn" >> /etc/rsyslog.conf;
                echo "Applied - $TAGD";
            fi
            ##TAGE
            if output=$(/bin/grep '^s*mail\.err' /etc/rsyslog.conf  /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGE";
            else
                echo "mail.err                                 /var/log/mail.err" >> /etc/rsyslog.conf;
                echo "Applied - $TAGE";
            fi
            ##TAGF
            if output=$(/bin/grep '^s*news\.crit' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGF";
            else
                echo "news.crit                             -/var/log/news/news.crit" >> /etc/rsyslog.conf;
                echo "Applied - $TAGF";
            fi
            ##TAGG
            if output=$(/bin/grep '^s*news\.err' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGG";
            else
                echo "news.err                              -/var/log/news/news.err" >> /etc/rsyslog.conf;
                echo "Applied - $TAGG";
            fi
            ##TAGH
            if output=$(/bin/grep '^s*news\.notice' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGH";
            else
                echo "news.notice                           -/var/log/news/news.notice" >> /etc/rsyslog.conf;
                echo "Applied - $TAGH";
            fi
            ##TAGI
            if output=$(/bin/grep '^s*\*\.=warning;\*\.=err' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGI";
            else
                echo "*.=warning;*.=err                     -/var/log/warn" >> /etc/rsyslog.conf;
                echo "Applied - $TAGI";
            fi
            ##TAGJ
            if output=$(/bin/grep '^s*\*\.crit' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGJ";
            else
                echo "*.crit                                         /var/log/warn" >> /etc/rsyslog.conf;
                echo "Applied - $TAGJ";
            fi
            ##TAGK
            if output=$(/bin/grep '^s*\*\.\*;mail.none;news\.none' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGK";
            else
                echo "*.*;mail.none;news.none                       -/var/log/messages" >> /etc/rsyslog.conf;
                echo "Applied - $TAGK";
            fi
            ##TAGL
            if output=$(/bin/grep '^s*local0,local1' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGL";
            else
                echo "local0,local1.*                               -/var/log/localmessages" >> /etc/rsyslog.conf;
                echo "Applied - $TAGL";
            fi
            ##TAGM
            if output=$(/bin/grep '^s*local2,local3' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGM";
            else
                echo "local2,local3.*                               -/var/log/localmessages" >> /etc/rsyslog.conf;
                echo "Applied - $TAGM";
            fi
            ##TAGN
            if output=$(/bin/grep '^s*local4,local5' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGN";
            else
                echo "local4,local5.*                               -/var/log/localmessages" >> /etc/rsyslog.conf;
                echo "Applied - $TAGN";
            fi
            ##TAGO
            if output=$(/bin/grep '^s*local6,local7' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
                echo "Applied - $TAGO";
            else
                echo "local6,local7.*                               -/var/log/localmessages" >> /etc/rsyslog.conf;
                echo "Applied - $TAGO";
            fi
        fi
    fi
}

function control_122a {
    TAGA="122a - 4.2.1.3 (L1) Ensure rsyslog default file permissions configured - rsyslog.conf/rsyslog.d (Mandatory)"
    if [ ! -f "/etc/rsyslog.conf-bk" ]; then
        if [ -f "/etc/rsyslog.conf" ]; then
            cp -rf /etc/rsyslog.conf    /etc/rsyslog.conf-bk
            sleep 1
        fi
    fi

    if [ -f "/etc/rsyslog.conf-bk" ]; then
        if output=$(grep ^\$FileCreateMode /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
            echo "Applied - $TAGA";
        else
            echo "\$FileCreateMode 0640" >> /etc/rsyslog.conf;
            echo "Applied - $TAGA";
        fi
    fi
}

function control_123a {
    TAG="MBSS-OS-SUSE12-123a - 4.2.1.4 (L1) Ensure rsyslog is configured to send logs to a remote log host - rsyslog.conf/rsyslogd. (Mandatory)"
    if output=$(grep '^*.*[^I][^I]*@@10.0.8.80' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
        echo "Applied - $TAG";
    else
        echo "*.* @@10.0.8.80" >> /etc/rsyslog.conf
        if output=$(grep '^*.*[^I][^I]*@@10.0.8.80' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
            echo "Applied - $TAG";
        fi
    fi
}

function control_124ab {
    TAGA="124a - 4.2.1.5 (L1) Ensure remote rsyslog messages are only accepted on designated log hosts - '$ModLoad imtcp.so' - rsyslog.conf/rsyslog.d (Mandatory)"
    TAGB="124b - 4.2.1.5 (L1) Ensure remote rsyslog messages are only accepted on designated log hosts - '$InputTCPServerRun 514' - rsyslog.conf/rsyslog.d (Mandatory)"

    if [ ! -f "/etc/rsyslog.conf-bk" ]; then
        if [ -f "/etc/rsyslog.conf" ]; then
            cp -rf /etc/rsyslog.conf    /etc/rsyslog.conf-bk
            sleep 1
        fi
    fi

    if [ -f "/etc/rsyslog.conf-bk" ]; then
        ##TAGA
        if output=$(/bin/grep '^s*\$ModLoad imtcp' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
            echo "Applied - $TAGA";
        else
            echo "\$ModLoad imtcp" >> /etc/rsyslog.conf;
            echo "Applied - $TAGA";
        fi
        ##TAGB
        if output=$(/bin/grep '^s*\$InputTCPServerRun' /etc/rsyslog.conf /etc/rsyslog.d/*.conf); then
            echo "Applied - $TAGB";
        else
            echo "\$InputTCPServerRun 514" >> /etc/rsyslog.conf;
            echo "Applied - $TAGB";
        fi
    fi
}

function control_126 {
    TAG="126 - 4.2.4 (L1) Ensure permissions on all logfiles are configured (Mandatory)"
    if output=$(find /var/log -type f -exec chmod g-wx,o-rwx {} +); then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";
    fi
}

function control_128 {
    TAG="128 - 5.1.1 (L1) Ensure cron daemon is enabled (Mandatory)"
    ### cron deamon should be enable
    if output=$(systemctl enable cron 2>/dev/null || chkconfig cron on 2>/dev/null); then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";
    fi
}

function control_129 {
    TAG="129 - 5.1.2 (L1) Ensure permissions on /etc/crontab are configured (Mandatory)"
    ###User/Group Owner and Permission on /etc/crontab should be restricted
    if output=$(chown root:root /etc/crontab && chmod og-rwx /etc/crontab); then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";
    fi
}

function control_130 {
    TAG="130 - 5.1.3 (L1) Ensure permissions on /etc/cron.hourly are configured (Mandatory)"
    ###User/Group Owner and Permission on /etc/cron.hourly should be restricted
    if output=$(chown root:root /etc/cron.hourly  && chmod og-rwx /etc/cron.hourly); then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";
    fi
}

function control_131 {
    TAG="131 - 5.1.4 (L1) Ensure permissions on /etc/cron.daily are configured (Mandatory)"
    ###User/Group Owner and Permission on /etc/cron.daily should be restricted
    if output=$(chown root:root /etc/cron.daily && chmod og-rwx /etc/cron.daily);then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";      
    fi
}

function control_132 {
    TAG="132 - 5.1.5 (L1) Ensure permissions on /etc/cron.weekly are configured (Mandatory)"
    ### User/Group Owner and Permission on /etc/cron.weekly should be restricted
    if output=$(chown root:root /etc/cron.weekly && chmod og-rwx /etc/cron.weekly);then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG"; 
    fi
}

function control_133 {
    TAG="133 - 5.1.6 (L1) Ensure permissions on /etc/cron.monthly are configured (Mandatory)"
    ### User/Group Owner and Permission on /etc/cron.monthly should be restricted
    if output=$(chown root:root /etc/cron.monthly && chmod og-rwx /etc/cron.monthly);then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";
    fi
}

function control_134 {
    TAG="134 - 5.1.7 (L1) Ensure permissions on /etc/cron.d are configured (Mandatory)"
    ### User/Group Owner and Permission on /etc/cron.d should be restricted
    if output=$(chown root:root /etc/cron.d && chmod og-rwx /etc/cron.d);then
        echo "Applied - $TAG";
    else
        echo "Applied - $TAG";
    fi
}

function control_135abcd {
    TAGA="135a - 5.1.8 (L1) Ensure at/cron is restricted to authorized users - at.allow (Mandatory)"
    TAGB="135b - 5.1.8 (L1) Ensure at/cron is restricted to authorized users - cron.allow (Mandatory)"
    TAGC="135c - 5.1.8 (L1) Ensure at/cron is restricted to authorized users - cron.deny (Mandatory)"
    TAGD="135d - 5.1.8 (L1) Ensure at/cron is restricted to authorized users - at.deny (Mandatory)"
    ###Create /etc/at.allow and set permission
    if [ ! -f "/etc/at.allow-bk" ]; then
        if [ -f "/etc/at.allow" ]; then
            cp -rf /etc/at.allow /etc/at.allow-bk
            sleep 1
        fi
    fi
    if [ ! -f "/etc/cron.allow-bk" ]; then
        if [ -f "/etc/at.allow" ]; then
            cp -rf /etc/cron.allow /etc/cron.allow-bk
            sleep 1
        fi
    fi

    if [  ! -f "/etc/at.allow" ]; then
        if output=$(touch /etc/at.allow); then
            ### set permission
            if output=$(chown root:root /etc/at.allow && chmod og-rwx /etc/at.allow); then
                echo "Applied - $TAGA";
            else
                echo "Failed - $TAGA";  
            fi
        else
            echo "135 - cannot create file /etc/at.allow";
                
        fi
    elif [ -f "/etc/at.allow" ]; then
        ### set permission
        if output=$(chown root:root /etc/at.allow && chmod og-rwx /etc/at.allow); then
            echo "Applied - $TAGA";
        else
            echo "Failed - $TAGA";
        fi
    fi

    ### create file /etc/cron.allow
    if [  ! -f "/etc/cron.allow" ]; then
        if output=$(touch /etc/cron.allow); then
            ### set permission
            if output=$(chown root:root /etc/cron.allow && chmod og-rwx /etc/cron.allow); then
                echo "Applied - $TAGB";
            else
                echo "Failed - $TAGB";
            fi
        else
            echo "135b - cannot create file /etc/cron.allow";    
        fi
    elif [ -f "/etc/cron.allow" ]; then
        ### set permission
        if output=$(chown root:root /etc/cron.allow && chmod og-rwx /etc/cron.allow); then
            echo "Applied - $TAGB";
        else
            echo "Failed - $TAGB";  
        fi
    fi

    ### Removing /etc/cron.deny
    if [ ! -f "/etc/cron.deny-bk" ]; then
        if [ -f "/etc/cron.deny" ]; then   
            ### backup /etc/cron.deny
            if output=$(cp -rf /etc/cron.deny /etc/cron.deny-bk); then
                sleep 1
            else
                echo "135c - cannot create backup config '/etc/cron.deny-bk'";
            fi
        else
            echo "Applied - $TAGC";
        fi
    else
        ### remmove /etc/cron.deny
        if [ -f "/etc/cron.deny-bk" ]; then
            if output=$(rm -rf /etc/cron.deny); then
                echo "Applied - $TAGC";
            else
               echo "Failed - $TAGC";
            fi
        else
            echo "135c - cannot find backup config '/etc/cron.deny-bk'";
        fi
    fi

    ### Removing /etc/at.deny
    if [ ! -f "/etc/at.deny-bk" ]; then
        if [ -f "/etc/at.deny" ]; then
            ### backup /etc/at.deny
            if output=$(cp -rf /etc/at.deny /etc/at.deny-bk); then
                sleep 1
            else
                echo "135d - cannot create backup config '/etc/at.deny-bk'";
            fi
        else
            echo "Applied - $TAGD";
        fi
    else
        ### remmove /etc/at.deny
        if [ -f "/etc/at.deny-bk" ]; then
            if output=$(rm -rf /etc/at.deny); then
                echo "Applied - $TAGD";
            else
                echo "Failed - $TAGD"; 
            fi
        else 
            echo "135d - cannot find backup config '/etc/at.deny-bk'";
        fi
    fi
}
###################################### Start Feedback from HW to disabled ########################################
function control_136 {
    TAG="136 - 5.2.1 (L1) Ensure permissions on /etc/ssh/sshd_config are configured (Mandatory)"
    if [ ! -f "/etc/ssh/sshd_config-bk" ]; then
        if output=$(cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config-bk); then
            sleep 1
        else
            echo "136 - cannot create backup config '/etc/ssh/sshd_config-bk'";
        fi
    fi
    ### Set MBSS SSHD Permission /etc/ssh/sshd_config
    if output=$(chown root:root /etc/ssh/sshd_config && chmod og-rwx /etc/ssh/sshd_config); then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";     
    fi
}

function control_137 {
    TAG="137 - 5.2.2 (L1) Ensure SSH Protocol is set to 2 (Mandatory)"
    if [ ! -f "/etc/ssh/sshd_config-bk" ]; then
        if output=$(cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config-bk); then
            sleep 1
        else
            echo "137 - cannot create backup config '/etc/ssh/sshd_config-bk'";
        fi
    fi
    if [ -f "/etc/ssh/sshd_config-bk" ]; then
        ### modify Protocol
        not_exist=$(grep -o "Protocol" /etc/ssh/sshd_config | wc -l);
        if output=$(grep "^Protocol.*.2$" /etc/ssh/sshd_config); then
             echo "Applied - $TAG";
        elif [ $not_exist != 1  ]; then
            echo "Protocol 2" >> /etc/ssh/sshd_config;
            echo "Applied - $TAG";
        else
            if output=$(sed -i 's/^[^#]*Protocol.*./Protocol 2/' /etc/ssh/sshd_config | sed -i 's/^[^#]*#Protocol.*./Protocol 2/' /etc/ssh/sshd_config); then
                echo "Applied - $TAG";
            else
                echo "Failed - $TAG"; 
            fi
        fi
    fi
}

function control_138 {
    TAG="138 - 5.2.3 (L1) Ensure SSH LogLevel is set to INFO (Mandatory)"
    if [ ! -f "/etc/ssh/sshd_config-bk" ]; then
        if output=$(cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config-bk); then
            sleep 1
        else
            echo "138 - cannot create backup config '/etc/ssh/sshd_config-bk'";
        fi
    fi
    if [ -f "/etc/ssh/sshd_config-bk" ]; then
        not_exist=$(grep -o "LogLevel" /etc/ssh/sshd_config | wc -l);
        if output=$(grep "^LogLevel.*.INFO$" /etc/ssh/sshd_config); then
            echo "Applied - $TAG";   
        elif [ $not_exist != 1  ]; then
            echo "LogLevel INFO" >> /etc/ssh/sshd_config;
            echo "Applied - $TAG";
        else
            if output=$(sed -i 's/^[^#]*LogLevel.*./LogLevel INFO/' /etc/ssh/sshd_config | sed -i 's/^[^#]*#LogLevel.*./LogLevel INFO/' /etc/ssh/sshd_config); then
               echo "Applied - $TAG"; 
            else
                echo "Failed - $TAG"; 
            fi
        fi
    fi
}

function control_139 {
    TAG="139 - 5.2.4 (L1) Ensure SSH X11 forwarding is disabled (Mandatory)"
    if [ ! -f "/etc/ssh/sshd_config-bk" ]; then
        if output=$(cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config-bk); then
            sleep 1
        else
            echo "139 - cannot create backup config '/etc/ssh/sshd_config-bk'";
        fi
    fi
    if [ -f "/etc/ssh/sshd_config-bk" ]; then
        not_exist=$(grep -o "X11Forwarding" /etc/ssh/sshd_config | wc -l);
        if output=$(grep "^X11Forwarding.*.no$" /etc/ssh/sshd_config); then
            echo "Applied - $TAG";
        elif [ $not_exist != 1  ]; then
            echo "X11Forwarding no" >> /etc/ssh/sshd_config;
            echo "Applied - $TAG";
        else
            if output=$(sed -i 's/^[^#]*X11Forwarding.*./X11Forwarding no/' /etc/ssh/sshd_config | sed -i 's/^[^#]*#X11Forwarding.*./X11Forwarding no/' /etc/ssh/sshd_config); then
                echo "Applied - $TAG";
            else
                echo "Failed - $TAG";
            fi
        fi
    fi
}

function control_140 {
    TAG="140 - 5.2.5 (L1) Ensure SSH MaxAuthTries is set to 3 or less (Mandatory)"
    if [ ! -f "/etc/ssh/sshd_config-bk" ]; then
        if output=$(cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config-bk); then
            sleep 1
        else
            echo "140 - cannot create backup config '/etc/ssh/sshd_config-bk'";
        fi
    fi
    if [ -f "/etc/ssh/sshd_config-bk" ]; then
        not_exist=$(grep -o "MaxAuthTries" /etc/ssh/sshd_config | wc -l);
        if output=$(grep "^MaxAuthTries.*.3$" /etc/ssh/sshd_config); then
            echo "Applied - $TAG";
        elif [ $not_exist != 1  ]; then
            echo "MaxAuthTries 3" >> /etc/ssh/sshd_config;
            echo "Applied - $TAG";
        else
            if output=$(sed -i 's/^[^#]*MaxAuthTries.*./MaxAuthTries 3/' /etc/ssh/sshd_config | sed -i 's/^[^#]*#MaxAuthTries.*./MaxAuthTries 3/' /etc/ssh/sshd_config); then
                echo "Applied - $TAG"; 
            else
                echo "Failed - $TAG"; 
            fi
        fi
    fi
}

function control_141 {
    TAG="141 - 5.2.6 (L1) Ensure SSH IgnoreRhosts is enabled (Mandatory)"
    if [ ! -f "/etc/ssh/sshd_config-bk" ]; then
        if output=$(cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config-bk); then
            sleep 1
        else
            echo "141 - cannot create backup config '/etc/ssh/sshd_config-bk'";
        fi
    fi
    if [ -f "/etc/ssh/sshd_config-bk" ]; then
        not_exist=$(grep -o "IgnoreRhosts" /etc/ssh/sshd_config | wc -l);
        if output=$(grep "^IgnoreRhosts.*.yes$" /etc/ssh/sshd_config); then
            echo "Applied - $TAG"; 
        elif [ $not_exist != 1  ]; then
            echo "IgnoreRhosts yes" >> /etc/ssh/sshd_config;
            echo "Applied - $TAG"; 
        else
            if output=$(sed -i 's/^[^#]*IgnoreRhosts.*./IgnoreRhosts yes/' /etc/ssh/sshd_config | sed -i 's/^[^#]*#IgnoreRhosts.*./IgnoreRhosts yes/' /etc/ssh/sshd_config); then
                echo "Applied - $TAG";    
            else
                echo "Failed - $TAG";   
            fi
        fi
    fi
}

function control_142 {
    TAG="142 - 5.2.7 (L1) Ensure SSH HostbasedAuthentication is disabled (Mandatory)"
    if [ ! -f "/etc/ssh/sshd_config-bk" ]; then
        if output=$(cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config-bk); then
            sleep 1
        else
            echo "142 - cannot create backup config '/etc/ssh/sshd_config-bk'";
        fi
    fi
    if [ -f "/etc/ssh/sshd_config-bk" ]; then
        not_exist=$(grep -o "HostbasedAuthentication" /etc/ssh/sshd_config | wc -l);
        if output=$(grep "^HostbasedAuthentication.*.no$" /etc/ssh/sshd_config); then
                echo "Applied - $TAG"; 
        elif [ $not_exist != 1  ]; then
            echo "HostbasedAuthentication no" >> /etc/ssh/sshd_config;
            echo "Applied - $TAG"; 
        else
            if output=$(sed -i 's/^[^#]*HostbasedAuthentication.*./HostbasedAuthentication no/' /etc/ssh/sshd_config | sed -i 's/^[^#]*#HostbasedAuthentication.*./HostbasedAuthentication no/' /etc/ssh/sshd_config); then
                echo "Applied - $TAG";  
            else
                echo "Failed - $TAG";  
            fi
        fi
    fi
}

function control_143 {
    TAG="143 - 5.2.8 (L1) Ensure SSH root login is disabled (Mandatory)"
    if [ ! -f "/etc/ssh/sshd_config-bk" ]; then
        if output=$(cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config-bk); then
            sleep 1
        else
            echo "143 - cannot create backup config '/etc/ssh/sshd_config-bk'";
        fi
    fi
    if [ -f "/etc/ssh/sshd_config-bk" ]; then
        not_exist=$(grep -o "PermitRootLogin" /etc/ssh/sshd_config | wc -l);
        if output=$(grep "^PermitRootLogin.*.without-password$" /etc/ssh/sshd_config); then
               echo "Applied - $TAG"; 
        elif [ $not_exist != 1  ]; then
            echo "PermitRootLogin without-password" >> /etc/ssh/sshd_config;
            echo "Applied - $TAG"; 
        else
            if output=$(sed -i 's/^[^#]*PermitRootLogin.*./PermitRootLogin without-password/' /etc/ssh/sshd_config | sed -i 's/^[^#]*#PermitRootLogin.*./PermitRootLogin without-password/' /etc/ssh/sshd_config); then
                echo "Applied - $TAG";   
            else
                echo "Failed - $TAG";  
            fi
        fi
    fi
}

function control_144 {
    TAG="144 - 5.2.9 (L1) Ensure SSH PermitEmptyPasswords is disabled (Mandatory)"
    if [ ! -f "/etc/ssh/sshd_config-bk" ]; then
        if output=$(cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config-bk); then
            sleep 1
        else
            echo "144 - cannot create backup config '/etc/ssh/sshd_config-bk'";
        fi
    fi
    if [ -f "/etc/ssh/sshd_config-bk" ]; then
        not_exist=$(grep -o "PermitEmptyPasswords" /etc/ssh/sshd_config | wc -l);
        if output=$(grep "^PermitEmptyPasswords.*.no$" /etc/ssh/sshd_config); then
            echo "Applied - $TAG"; 
        elif [ $not_exist != 1  ]; then
            echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config;
            echo "Applied - $TAG"; 
        else
            if output=$(sed -i 's/^[^#]*PermitEmptyPasswords.*./PermitEmptyPasswords no/' /etc/ssh/sshd_config | sed -i 's/^[^#]*#PermitEmptyPasswords.*./PermitEmptyPasswords no/' /etc/ssh/sshd_config); then
                echo "Applied - $TAG"; 
            else
                echo "Failed - $TAG";
            fi
        fi
    fi
}

function control_145 {
    TAG="145 - 5.2.10 (L1) Ensure SSH PermitUserEnvironment is disabled (Mandatory)"
    if [ ! -f "/etc/ssh/sshd_config-bk" ]; then
        if output=$(cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config-bk); then
            sleep 1
        else
            echo "145 - cannot create backup config '/etc/ssh/sshd_config-bk'";
        fi
    fi
    if [ -f "/etc/ssh/sshd_config-bk" ]; then    
        not_exist=$(grep -o "PermitUserEnvironment" /etc/ssh/sshd_config | wc -l);
        if output=$(grep "^PermitUserEnvironment.*.no$" /etc/ssh/sshd_config); then
            echo "Applied - $TAG";
        elif [ $not_exist != 1  ]; then
            echo "PermitUserEnvironment no" >> /etc/ssh/sshd_config;
            echo "Applied - $TAG";  
        else
            if output=$(sed -i 's/^[^#]*PermitUserEnvironment.*./PermitUserEnvironment no/' /etc/ssh/sshd_config | sed -i 's/^[^#]*#PermitUserEnvironment.*./PermitUserEnvironment no/' /etc/ssh/sshd_config); then
                echo "Applied - $TAG";
            else
                echo "Failed - $TAG";
            fi
        fi
    fi
}

function control_146 {
    TAG="146 - 5.2.11 (L1) Ensure only approved MAC algorithms are used (Mandatory)"
    if [ ! -f "/etc/ssh/sshd_config-bk" ]; then
        if output=$(cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config-bk); then
            sleep 1
        else
            echo "146 - cannot create backup config '/etc/ssh/sshd_config-bk'";
        fi
    fi
    if [ -f "/etc/ssh/sshd_config-bk" ]; then    
        output_macs=$(grep "MACs.*." /etc/ssh/sshd_config),"hmac-sha1,hmac-ripemd160";
        if output=$(grep "MACs.*.,hmac-sha1,hmac-ripemd160" /etc/ssh/sshd_config); then
            echo "Applied - $TAG";
        ##### if not exist add MACs hmac-sha1,hmac-ripemd160 at last line
        elif [ $not_exist != 1  ]; then
            echo "MACs hmac-sha1,hmac-ripemd160" >> /etc/ssh/sshd_config;
            echo "Applied - $TAG";
        else
            if output=$(sed -i "s/^[^#]*MACs.*./$output_macs/" /etc/ssh/sshd_config |  sed -i "s/^[^#]*#MACs.*./$output_macs/" /etc/ssh/sshd_config); then
                echo "Applied - $TAG";    
            else
                echo "Failed - $TAG";
            fi
        fi
    fi
}

function control_147ab {
    TAGA="147a - 5.2.12 (L1) Ensure SSH Idle Timeout Interval is configured - ClientAliveInterval (Mandatory) (Changed)"
    TAGB="147b - 5.2.12 (L1) Ensure SSH Idle Timeout Interval is configured - ClientAliveCountMax (Mandatory)"

    if [ ! -f "/etc/ssh/sshd_config-bk" ]; then
        cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config-bk
        sleep 1
    fi

    if output=$(grep "ClientAliveInterval[[:blank:]]900" /etc/ssh/sshd_config); then
        echo "Applied - $TAGA";
    else
        if output=$(perl -i -lane '/^ClientAliveInterval/?print("@F[0] 900"):print($_)' /etc/ssh/sshd_config); then
            if output=$(grep "ClientAliveInterval[[:blank:]]900" /etc/ssh/sshd_config); then
                echo "Applied - $TAGA";
            fi
        fi
    fi

    if output=$(grep "ClientAliveCountMax[[:blank:]]0" /etc/ssh/sshd_config); then
        echo "Applied - $TAGB";
    else
        if output=$(perl -i -lane '/^ClientAliveCountMax/?print("@F[0] 0"):print($_)' /etc/ssh/sshd_config); then
            if output=$(grep "ClientAliveCountMax[[:blank:]]0" /etc/ssh/sshd_config); then
                echo "Applied - $TAGB";
            fi
        fi
    fi

}

function control_150 {
    TAG="150 - 5.2.15 (L1) Ensure SSH warning banner is configured (Mandatory)"
    if [ ! -f "/etc/ssh/sshd_config-bk" ]; then
        if output=$(cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config-bk); then
            sleep 1
        else
            echo "150 - cannot create backup config '/etc/ssh/sshd_config-bk'";
        fi
    fi
    if [ -f "/etc/ssh/sshd_config-bk" ]; then    
        not_exist=$(grep -o "Banner" /etc/ssh/sshd_config | wc -l);
        if output=$(grep "^Banner\s\/etc/issue.net$" /etc/ssh/sshd_config); then
            echo "Applied - $TAG";
        ##### if not exist add Banner /etc/issue.net at last line
        elif [ $not_exist != 1  ]; then
            echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config;
            echo "Applied - $TAG";
        #### modify value
        else
            if output=$(sed -i 's/^[^#]*Banner.*./Banner /etc/issue.net/' /etc/ssh/sshd_config | sed -i 's/^[^#]*#Banner.*./Banner /etc/issue.net/' /etc/ssh/sshd_config); then
                echo "Applied - $TAG";
            else
                echo "Failed - $TAG"; 
            fi
        fi
    fi
}
###################################### Start Feedback from HW to disabled ########################################
function control_151 {
    TAG="151 - 5.3.1.1 (L1) Ensure password creation requirements are configured - minlen (Mandatory) (Changed)"
    if [ -f "/etc/pam.d/common-password" ]; then
        if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*minlen=.*" /etc/pam.d/common-password); then
            if output=$(sed -i 's/minlen=[[:digit:]]*/minlen=15/' /etc/pam.d/common-password); then
                if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*minlen=15" /etc/pam.d/common-password); then
                    echo "Applied - $TAG";
                else
                    echo "Failed - $TAG";
                fi
            fi
        else
            if output=$(sed -i 's/password[[:blank:]]*requisite[[:blank:]]*pam_cracklib\.so/password    requisite     pam_cracklib\.so minlen=15/' /etc/pam.d/common-password); then
                if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*minlen=15" /etc/pam.d/common-password); then
                    echo "Applied - $TAG";
                else
                    echo "Failed - $TAG";
                fi
            fi
        fi
    fi
}

function control_152abcd {
    TAGA="152a - 5.3.1.4 (L1) Ensure password creation requirements are configured - dcredit (Mandatory)"
    TAGB="152b - 5.3.1.4 (L1) Ensure password creation requirements are configured - ucredit (Mandatory)"
    TAGC="152c - 5.3.1.4 (L1) Ensure password creation requirements are configured - ocredit (Mandatory)"
    TAGD="152d - 5.3.1.4 (L1) Ensure password creation requirements are configured - lcredit (Mandatory)"
    if [ ! -f "/etc/pam.d/common-password-bk" ]; then 
        cp -rf /etc/pam.d/common-password /etc/pam.d/common-password-bk
        sleep 1
    fi
    if [ -f "/etc/pam.d/common-password-bk" ]; then
        if [ -f "/etc/pam.d/common-password" ]; then
            #dcredits
            if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*dcredit=.*" /etc/pam.d/common-password); then
                if output=$(sed -i 's/dcredit=-[[:digit:]]*/dcredit=-1/' /etc/pam.d/common-password); then
                    if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*dcredit=-1" /etc/pam.d/common-password); then
                        echo "Applied - $TAGA";
                    else
                        echo "Failed - $TAGA";
                    fi
                fi
            else
                if output=$(sed -i 's/password[[:blank:]]*requisite[[:blank:]]*pam_cracklib\.so/password    requisite     pam_cracklib\.so dcredit=-1/' /etc/pam.d/common-password); then
                    if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*dcredit=-1" /etc/pam.d/common-password); then
                        echo "Applied - $TAGA";
                    else
                        echo "Failed - $TAGA";
                    fi
                fi
            fi
            #ucredit
            if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*ucredit=.*" /etc/pam.d/common-password); then
                if output=$(sed -i 's/ucredit=-[[:digit:]]*/ucredit=-1/' /etc/pam.d/common-password); then
                    if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*ucredit=-1" /etc/pam.d/common-password); then
                        echo "Applied - $TAGB";
                    else
                        echo "Failed - $TAGB";
                    fi
                fi
            else
                if output=$(sed -i 's/password[[:blank:]]*requisite[[:blank:]]*pam_cracklib\.so/password    requisite     pam_cracklib\.so ucredit=-1/' /etc/pam.d/common-password); then
                    if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*ucredit=-1" /etc/pam.d/common-password); then
                        echo "Applied - $TAGB";
                    else
                        echo "Failed - $TAGB";
                    fi
                fi
            fi
            #ocredit
            if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*ocredit=.*" /etc/pam.d/common-password); then
                if output=$(sed -i 's/ocredit=-[[:digit:]]*/ocredit=-1/' /etc/pam.d/common-password); then
                    if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*ocredit=-1*" /etc/pam.d/common-password); then
                        echo "Applied - $TAGC";
                    else
                        echo "Failed - $TAGC";
                    fi
                fi
            else
                if output=$(sed -i 's/password[[:blank:]]*requisite[[:blank:]]*pam_cracklib\.so/password    requisite     pam_cracklib\.so ocredit=-1/' /etc/pam.d/common-password); then
                    if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*ocredit=-1" /etc/pam.d/common-password); then
                        echo "Applied - $TAGC";
                    else
                        echo "Failed - $TAGC";
                    fi
                fi
            fi
            #lcredit
            if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*lcredit=.*" /etc/pam.d/common-password); then
                if output=$(sed -i 's/lcredit=-[[:digit:]]*/lcredit=-1/' /etc/pam.d/common-password); then
                    if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*lcredit=-1" /etc/pam.d/common-password); then
                        echo "Applied - $TAGD";
                    else
                        echo "Failed - $TAGD";
                    fi
                fi
            else
                if output=$(sed -i 's/password[[:blank:]]*requisite[[:blank:]]*pam_cracklib\.so/password    requisite     pam_cracklib\.so lcredit=-1/' /etc/pam.d/common-password); then
                    if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*lcredit=-1" /etc/pam.d/common-password); then
                        echo "Applied - $TAGD";
                    else
                        echo "Failed - $TAGD";
                    fi
                fi
            fi
        fi
    fi
}

function control_153 {
    TAG="153 - 5.3.1.2 (L1) Ensure password creation requirements are configured - try_first_pass (Mandatory)"
    #try_first_pass
    if [ ! -f "/etc/pam.d/common-password-bk" ]; then 
        cp -rf /etc/pam.d/common-password /etc/pam.d/common-password-bk
        sleep 1
    fi
    if [ -f "/etc/pam.d/common-password-bk" ]; then   
        if [ -f "/etc/pam.d/common-password" ]; then 
            if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*try_first_pass" /etc/pam.d/common-password); then
                echo "Applied - $TAG";
            else
                if output=$(sed -i 's/password[[:blank:]]*requisite[[:blank:]]*pam_cracklib\.so/password    requisite     pam_cracklib\.so try_first_pass/' /etc/pam.d/common-password); then
                    if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*try_first_pass" /etc/pam.d/common-password); then
                        echo "Applied - $TAG";
                    else
                        echo "Failed - $TAG";
                    fi
                fi
            fi
        fi
    fi
}

function control_154 {
    TAG="154 - 5.3.1.3 (L1) Ensure password creation requirements are configured - retry (Secondary)"
    if [ ! -f "/etc/pam.d/common-password-bk" ]; then 
        cp -rf /etc/pam.d/common-password /etc/pam.d/common-password-bk
        sleep 1 
    fi
    #retry
    if [ -f "/etc/pam.d/common-password-bk" ]; then
        if [ -f "/etc/pam.d/common-password" ]; then        
            if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*retry=.*" /etc/pam.d/common-password); then
                if output=$(sed -i 's/retry=[[:digit:]]*/retry=3/' /etc/pam.d/common-password); then
                    if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*retry=3" /etc/pam.d/common-password); then
                        echo "Applied - $TAGA";
                    else
                        echo "Failed - $TAGA";
                    fi
                fi
            else
                if output=$(sed -i 's/password[[:blank:]]*requisite[[:blank:]]*pam_cracklib\.so/password    requisite     pam_cracklib\.so retry=3/' /etc/pam.d/common-password); then
                    if output=$(grep  "password[[:blank:]]*requisite[[:blank:]]*pam_cracklib.so.*retry=3" /etc/pam.d/common-password); then
                        echo "Applied - $TAGA";
                    else
                        echo "Failed - $TAGA";
                    fi
                fi
            fi
        fi
    fi
}

function control_155ab {
    TAGA="155a - 5.3.2 (L1) Ensure lockout for failed password attempts is configured - auth required (Mandatory) (Changed)"
    TAGB="155b - 5.3.2 (L1) Ensure lockout for failed password attempts is configured - account required (Mandatory)"
    if output=$(cp /etc/pam.d/common-auth /etc/pam.d/common-auth-`date +"%d-%m-%Y-%H:%M:%S"`); then 
        if [ -f "/etc/pam.d/common-auth" ]; then 
            if output=$(grep ".*auth[[:blank:]]*required[[:blank:]]*pam_tally2.so[[:blank:]]*" /etc/pam.d/common-auth); then
                if output=$(sed -i 's/^[[:blank:]]*auth[[:blank:]]*required[[:blank:]]*pam_tally2.so.*/auth required pam_tally2.so onerr=fail audit silent deny=3 unlock_time=900/' /etc/pam.d/common-auth); then
                    echo "Applied - $TAGA";
                fi
            else
                echo "auth    required     pam_tally2.so onerr=fail audit silent deny=3 unlock_time=900" >> /etc/pam.d/common-auth;
                echo "Applied - $TAGA";
            fi
        fi
    fi
    if output=$(cp /etc/pam.d/common-account /etc/pam.d/common-account-`date +"%d-%m-%Y-%H:%M:%S"`); then 
        if [ -f "/etc/pam.d/common-account" ]; then 
            if output=$(grep ".*account[[:blank:]]*required[[:blank:]]*pam_tally2.so$" /etc/pam.d/common-account); then
                echo "Applied - $TAGB";
            else
                echo "account   required    pam_tally2.so" >> /etc/pam.d/common-account;
                echo "Applied - $TAGB";
            fi
        fi
    fi
}

function control_156 {
    #this control error script need fix later - if passed, delete this comment
    TAG="156 - 5.3.3 (L1) Ensure password reuse is limited (Mandatory) (Changed)"
    if [ ! -f "/etc/pam.d/common-password-bk" ]; then 
        cp -rf /etc/pam.d/common-password   /etc/pam.d/common-password-bk
    fi

    if [ -f  "/etc/pam.d/common-password-bk"  ]; then
        if [ -f "/etc/pam.d/common-password"  ]; then
            if output=$(grep "password[[:blank:]]*required[[:blank:]]*pam_pwhistory.so.*.remember=.*" /etc/pam.d/common-password); then
                if output=$(sed -i 's/remember=[[:digit:]]*/remember=5/' /etc/pam.d/common-password); then
                    if output=$(grep "password[[:blank:]]*required[[:blank:]]*pam_pwhistory.so.*.remember=5" /etc/pam.d/common-password); then
                        echo "Applie - $TAG";
                    fi
                fi
            fi
        fi
    fi
}

function control_157 {
    TAG="157 - 5.3.4 (L1) Ensure password hashing algorithm is SHA-512 (Mandatory)"
    if [ ! -f "/etc/pam.d/common-password-bk" ]; then 
        cp -rf /etc/pam.d/common-password /etc/pam.d/common-password-bk
    fi
    if [ -f "/etc/pam.d/common-password-bk" ]; then
        if [ -f "/etc/pam.d/common-password" ]; then
            if output=$(grep "password[[:blank:]]*required[[:blank:]]*pam_unix.so[[:blank:]]" /etc/pam.d/common-password && grep "password[[:blank:]]*required[[:blank:]]*pam_unix.so.*.sha512" /etc/pam.d/common-password); then
                echo "Applied - $TAG";
            elif output=$(grep "password[[:blank:]]*required[[:blank:]]*pam_unix.so[[:blank:]]" /etc/pam.d/common-password); then
                if output=$(sed -i 's/password[[:blank:]]*required[[:blank:]]*pam_unix\.so/password    required     pam_unix\.so sha512/' /etc/pam.d/common-password); then
                    if output=$(grep "password[[:blank:]]*required[[:blank:]]*pam_unix.so.*.sha512" /etc/pam.d/common-password); then
                        echo "Applied - $TAG";
                    else
                        echo "Failed - $TAG";
                    fi
                fi
            else
                echo "password         required     pam_unix.so sha512" >> /etc/pam.d/common-password
                if output=$(grep "password[[:blank:]]*required[[:blank:]]*pam_unix.so.*.sha512" /etc/pam.d/common-password); then
                    echo "Applied - $TAG";
                else
                    echo "Failed - $TAG";
                fi
            fi
        fi
    fi
}

function control_158 {
    TAG="158 - 5.4.1.1 (L1) Ensure password expiration is 60 days or less (Mandatory)"
    if [  ! -f  "/etc/login.defs-bk" ]; then
        if output=$(cp -rf /etc/login.defs /etc/login.defs-bk); then 
            sleep 1
        else 
            echo "158 - cannot backup /etc/login.defs-bk"; 
        fi
    fi
    ### add if not exist or update config /etc/login.defs if exist
    if [  -f "/etc/login.defs-bk" ]; then
        if [ -f "/etc/login.defs" ]; then
            ### add or update value of PASS_MAX_DAYS 60
            if output=$(grep "PASS_MAX_DAYS\s*" /etc/login.defs); then
                if output=$(sed -i "s/^\(PASS\_MAX\_DAYS\s*\).*\$/\160/" /etc/login.defs); then
                    echo "Applied - $TAG";
                else 
                    echo "Failed - $TAG";
                fi
            else
                echo "PASS_MAX_DAYS 60" >> /etc/login.defs;
                echo "Applied - $TAG";
            fi
        fi
    fi
}

function control_159 {
    TAG="159 - 5.4.1.2 (L1) Ensure minimum days between password changes is 7 or more (Mandatory)"
    if [  ! -f  "/etc/login.defs-bk" ]; then
        if output=$(cp -rf /etc/login.defs /etc/login.defs-bk); then 
            sleep 1; 
        else 
            echo "159 - cannot backup /etc/login.defs-bk"; 
        fi
    fi
    ### add or update value of PASS_MIN_DAYS 7
    if output=$(grep "PASS_MIN_DAYS\s*" /etc/login.defs); then
        if output=$(sed -i "s/^\(PASS\_MIN\_DAYS\s*\).*\$/\17/" /etc/login.defs); then
            echo "Applied - $TAG";
        else
            echo "Failed - $TAG";
        fi
    else
        echo "PASS_MIN_DAYS 7" >> /etc/login.defs;
        echo "Applied - $TAG";
    fi
}

function control_160 {
    TAG="160 - 5.4.1.3 (L1) Ensure password expiration warning days is 7 or more (Secondary)"
    if [  ! -f  "/etc/login.defs-bk" ]; then
        if output=$(cp -rf /etc/login.defs /etc/login.defs-bk); then 
            sleep 1; 
        else 
            echo "160 - cannot backup /etc/login.defs-bk"; 
        fi
    fi
    ## add or update value of PASS_WARN_AGE 20
    if output=$(grep "PASS_WARN_AGE\s*" /etc/login.defs); then
        if output=$(sed -i "s/^\(PASS\_WARN\_AGE\s*\).*\$/\120/" /etc/login.defs); then
            echo "Applied - $TAG";
        else
            echo "Failed - $TAG";
        fi
    else
        echo "PASS_MIN_DAYS 7" >> /etc/login.defs;
        echo "Applied - $TAG";
    fi
}

function control_161 {
    sleep 1
    #Exception
}

function control_163 {
    TAG="MBSS-OS-SUSE12-163 - 5.4.2 (L1) Ensure system accounts are non-login (Mandatory)"
    for user in `awk -F: '($3 < 1000) {print $1 }' /etc/passwd` ; do 
        if [ $user != "root" ]; then 
            usermod -L $user 
            if [ $user != "sync" ] && [ $user != "shutdown" ] && [ $user != "halt" ]; then 
                usermod -s /sbin/nologin $user
            fi 
        fi 
    done
}

function control_165ab {
    TAGA="165a - 5.4.4 (L1) Ensure default user umask is 027 or more restrictive - /etc/bash.bashrc.local (Mandatory)"
    TAGB="165b - 5.4.4 (L1) Ensure default user umask is 027 or more restrictive - /etc/profile.local /etc/profile.d/*.sh (Mandatory)"

    #TAGA
    if [ ! -f "/etc/bash.bashrc.local" ]; then
        touch /etc/bash.bashrc.local
        sleep 1
    fi

    if [ ! -f "/etc/bash.bashrc.local-bk" ]; then
        cp -rf /etc/bash.bashrc.local /etc/bash.bashrc.local-bk
        sleep 1
    fi

    if [ -f "/etc/bash.bashrc.local-bk" ]; then
        if [ -f "/etc/bash.bashrc.local" ]; then
            if output=$(grep "^umask" /etc/bash.bashrc.local); then
                if output=$(grep "^umask[[:blank:]]027" /etc/bash.bashrc.local); then
                    echo "Applied - $TAGA";
                else
                    if output=$(perl -i -lane '/^umask/?print("@F[0] 027"):print($_)' /etc/bash.bashrc.local); then
                        if output=$(grep "^umask[[:blank:]]027" /etc/bash.bashrc.local); then
                            echo "Applied - $TAGA";
                        else
                            echo "Failed - $TAGA";
                        fi
                    fi
                fi
            else
                echo "umask 27" >> /etc/bash.bashrc.local;
                echo "Applied - $TAGA";
            fi
        fi
    fi
    ###TAGB
    if [ ! -f "/etc/profile.local" ]; then
        touch /etc/profile.local
        sleep 1
    fi

    if [ ! -f "/etc/profile.local-bk" ]; then
        cp -rf /etc/profile.local /etc/profile.local-bk
        sleep 1
    fi

    if [ -f "/etc/profile.local-bk" ]; then
        if [ -f "/etc/profile.local" ]; then
            if output=$(grep "^umask" /etc/profile.local); then
                if output=$(grep "^umask[[:blank:]]027" /etc/profile.local); then
                    echo "Applied - $TAGB";
                else
                    if output=$(perl -i -lane '/^umask/?print("@F[0] 027"):print($_)' /etc/profile.local); then
                        if output=$(grep "^umask[[:blank:]]027" /etc/profile.local); then
                            echo "Applied - $TAGB";
                        else
                            echo "Failed - $TAGB";
                        fi
                    fi
                fi
            else
                echo "umask 27" >> /etc/profile.local;
                echo "Applied - $TAGB";
            fi
        fi
    fi
}

function control_166ab {
    TAGA="166a - 5.4.5 (L2) Ensure default user shell timeout is 900 seconds or less - /etc/bashrc (Mandatory) (Changed)"
    TAGB="166b - 5.4.5 (L2) Ensure default user shell timeout is 900 seconds or less - /etc/profile (Mandatory) (Changed)"

    if [ ! -f "/etc/bashrc" ]; then
        touch /etc/bashrc
    fi

    if [ -f "/etc/bashrc" ]; then
        if output=$(grep "^TMOUT =900" /etc/bashrc); then
            echo "Applied - $TAGA";
        else
            echo "TMOUT =900" >> /etc/bashrc
            echo "Applied - $TAGA";
        fi
    fi

    if [ ! -f "/etc/profile" ]; then
        touch /etc/profile
    fi

    if [ -f "/etc/profile" ];then
        if output=$(grep "^TMOUT=900" /etc/profile); then
            echo "Applied - $TAGB";
        else
            echo "TMOUT=900" >> /etc/profile
            echo "Applied - $TAGB";
        fi
    fi
}

function control_167 {
    sleep 1
    #Exception
}

function control_168ab {
    TAGA="168a - 5.6 (L1) Ensure access to the su command is restricted - /etc/group (Mandatory)"
    TAGB="168b - 5.6 (L1) Ensure access to the su command is restricted - /etc/pam.d/su (Mandatory)"

    if output=$(grep "wheel.*10:root," /etc/group); then
        echo "Applied - $TAGA";
    else
        sed -i "s/wheel.*10:/&root,/" /etc/group
        echo "Applied - $TAGA";
    fi

    if output=$(grep "^auth[[:blank:]]required[[:blank:]]pam_wheel.so[[:blank:]]use_uid$" /etc/pam.d/su); then
        echo "Applied - $TAGB";
    else
        echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su
        echo "Applied - $TAGB";
    fi
}

function control_170a {
    TAG="170a - 6.1.2 (L1) Ensure permissions on /etc/passwd are configured (Mandatory)"
    if output=$(chmod 644 /etc/passwd); then
        echo "Applied - $TAG";  
    else
        echo "Failed - $TAG";
    fi
}

function control_171ab {
    TAGA="171a - 6.1.3 (L1) Ensure permissions on /etc/shadow are configured (Mandatory)"
    ###TAGA Set owner and permission to /etc/shadow
    if output=$(chown root:root /etc/shadow && chmod o-rwx,g-wx /etc/shadow); then
        echo "Applied - $TAGA";
    else
        echo "Failed - $TAGA";
    fi

    ###TAGB
    if output=$(chown root:root /etc/shadow- && chmod 600 /etc/shadow-); then
        echo "Applied - $TAGB";
    else
        echo "Failed - $TAGB";
    fi
}

function control_172a {
    TAG="172a - 6.1.7 (L1) Ensure permissions on /etc/group.old are configured (Mandatory)"
    #Set owner and persmission to /etc/group
    if output=$(chown root:root /etc/group && chmod 0644 /etc/group); then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";
    fi
}

function control_173a {
    TAG="173a - 6.1.5 (L1) Ensure permissions on /etc/gshadow are configured (Mandatory)"
    if output=$(chown root:root /etc/gshadow && chown root:shadow /etc/gshadow && chmod 0600 /etc/gshadow); then
        echo "Applied - $TAG";
    else
        echo "Failed - $TAG";
    fi
}

function control_174 {
    TAG="MBSS-OS-SUSE12-174 - 6.1.10 (L1) Ensure no world writable files exist (Mandatory)"
    if output=$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002); then
        if [ -z "$output" ]; then
            sleep 1
        else
            chmod o-w $output
            echo "Applied - $TAG";
        fi
    else
        echo "Applied - $TAG"; 
    fi
}

function control_175a {
    TAG="MBSS-OS-SUSE12-175a - 6.1.11 (L1) Ensure no unowned files or directories exist (Mandatory)"
    if output=$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser); then
        rm -rf $output;
        echo "Applied - $TAG";
    fi
}

function control_175b {
    TAG="MBSS-OS-SUSE12-175b - 6.1.12 (L1) Ensure no ungrouped files or directories exist (Mandatory)"
    if output=$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup); then
        rm -rf $output;
        echo "Applied - $TAG";
    fi
}

function control_182 {
    cat /etc/passwd | egrep -v '^(root|halt|sync|shutdown)' | awk -F: '($7 != "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | 
    while read user dir; do 
        if [ ! -d "$dir" ]; then 
            echo "The home directory ($dir) of user $user does not exist." 
        else 
            dirperm=`ls -ld $dir | cut -f1 -d" "` 

            if [ `echo $dirperm | cut -c6` != "-" ]; then 
                #echo "Group Write permission set on the home directory ($dir) of user $user" 
                chmod -R 750 $dir
            fi 
            if [ `echo $dirperm | cut -c8` != "-" ]; then 
                #echo "Other Read permission set on the home directory ($dir) of user $user" 
                chmod -R 750 $dir
            fi 
            if [ `echo $dirperm | cut -c9` != "-" ]; then 
                #echo "Other Write permission set on the home directory ($dir) of user $user" 
                chmod -R 750 $dir
            fi 
            if [ `echo $dirperm | cut -c10` != "-" ]; then 
                #echo "Other Execute permission set on the home directory ($dir) of user $user" 
                chmod -R 750 $dir
            fi 
        fi 
    done
}