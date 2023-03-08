#!/bin/bash

swayScriptsTmpDir="/tmp/swayScriptsTmpDir"
[ -d "${swayScriptsTmpDir}" ] || { mkdir ${swayScriptsTmpDir}; chmod 770 ${swayScriptsTmpDir}; }

workroomSwitchedFile="${swayScriptsTmpDir}/swayWorkroomSwitched.txt"
[ -f "${workroomSwitchedFile}" ] || { touch ${workroomSwitchedFile}; chmod 660 ${workroomSwitchedFile}; }
# Initiate to workrrom 1 if no previous one is stored in file.
[ -s "${workroomSwitchedFile}" ] || echo "1" > ${workroomSwitchedFile}

workroomWorkspaceSwitchedFile="${swayScriptsTmpDir}/swayWorkroomWorkspaceSwitched.txt"
[ -f "${workroomWorkspaceSwitchedFile}" ] || { touch ${workroomWorkspaceSwitchedFile}; chmod 660 ${workroomWorkspaceSwitchedFile}; }

workspaceToSwitch="$(cat ${workroomWorkspaceSwitchedFile})"

case ${1} in
  x) workroomToSwitch="$(cat ${workroomSwitchedFile})";;
  *) echo "${1}" > ${workroomSwitchedFile}
      workroomToSwitch="$(cat ${workroomSwitchedFile})"
      swaymsg "workspace ${workroomToSwitch}${workspaceToSwitch}";;
esac

if [[ -v 2 && ! "${2}" = 0 ]]; then
  case ${2} in
    1) swaymsg "workspace ${workroomToSwitch}1";
       echo "1" > ${workroomWorkspaceSwitchedFile};;
    2) swaymsg "workspace ${workroomToSwitch}2";
       echo "2" > ${workroomWorkspaceSwitchedFile};;
    3) swaymsg "workspace ${workroomToSwitch}3";
       echo "3" > ${workroomWorkspaceSwitchedFile};;
    4) swaymsg "workspace ${workroomToSwitch}4";
       echo "4" > ${workroomWorkspaceSwitchedFile};;
    5) swaymsg "workspace ${workroomToSwitch}5";
       echo "5" > ${workroomWorkspaceSwitchedFile};;
    6) swaymsg "workspace ${workroomToSwitch}6";
       echo "6" > ${workroomWorkspaceSwitchedFile};;
    7) swaymsg "workspace ${workroomToSwitch}7";
       echo "7" > ${workroomWorkspaceSwitchedFile};;
    8) swaymsg "workspace ${workroomToSwitch}8";
       echo "8" > ${workroomWorkspaceSwitchedFile};;
    9) swaymsg "workspace ${workroomToSwitch}9";
       echo "9" > ${workroomWorkspaceSwitchedFile};;
    --to1) swaymsg "move container to workspace ${workroomToSwitch}1";;
    --to2) swaymsg "move container to workspace ${workroomToSwitch}2";;
    --to3) swaymsg "move container to workspace ${workroomToSwitch}3";;
    --to4) swaymsg "move container to workspace ${workroomToSwitch}4";;
    --to5) swaymsg "move container to workspace ${workroomToSwitch}5";;
    --to6) swaymsg "move container to workspace ${workroomToSwitch}6";;
    --to7) swaymsg "move container to workspace ${workroomToSwitch}7";;
    --to8) swaymsg "move container to workspace ${workroomToSwitch}8";;
    --to9) swaymsg "move container to workspace ${workroomToSwitch}9";;
    --to0) [[ "${workroomToSwitch}" =~ ^[0-9]+$ ]] \
             && swaymsg "move container to workspace $((${workroomToSwitch} + 1))0" \
             || swaymsg "move container to workspace ${workroomToSwitch}0";;
  esac
else
  #workspaceToSwitch="$(cat ${workroomWorkspaceSwitchedFile})"
  if [ "${2}" = 0 ]; then
    if [[ "${workroomToSwitch}" =~ ^[0-9]+$ ]]; then
      swaymsg "workspace $((${workroomToSwitch} + 1))0"; echo "0" > ${workroomWorkspaceSwitchedFile}
    else
      swaymsg "workspace ${workroomToSwitch}0"; echo "0" > ${workroomWorkspaceSwitchedFile}
    fi
  else
    if [ "${workspaceToSwitch}" = 0 ]; then
      if [[ "${workroomToSwitch}" =~ ^[0-9]+$ ]]; then
        swaymsg "workspace $((${workroomToSwitch} + 1))0"; echo "0" > ${workroomWorkspaceSwitchedFile}
      else
        swaymsg "workspace ${workroomToSwitch}0"; echo "0" > ${workroomWorkspaceSwitchedFile}
      fi
    else
      swaymsg "workspace ${workroomToSwitch}${workspaceToSwitch}"
    fi
  fi
fi
    
