#!/bin/bash
FULL_PATH_TO_SCRIPT="$(realpath "$0")"
SCRIPT_DIRECTORY="$(dirname "$FULL_PATH_TO_SCRIPT")"
if [ ! -f "$SCRIPT_DIRECTORY/.ENV" ]; then
    echo "$SCRIPT_DIRECTORY/.ENV does not exist."
    echo "ENV.example is template to use"
    exit 1
fi
source $SCRIPT_DIRECTORY/.ENV
# Internal Variables, use to only update delta'
# Zero them out for starters
XFREQ=""
XMODE=""
FREQ=""
MODE=""
shopt -s extglob

# Method for getting rigs current listening frequency and mode
get_freq () {
# use netcat to speak to rigctld and grab the Frequency
FREQMODE=`echo fm| netcat -w $TIMEOUT $IP $PORT`
# Sneaky move to remove the CR/LF from the netcat output
FREQMODE=`echo $FREQMODE`
# Remove the Bandwidth/Filter as not really needed in most cases
# Bash String manipulation % LEFT # right
FREQ="${FREQMODE%% *}"
MODE="${FREQMODE#* }"
MODE="${MODE%% *}"
# On a IC-7100 if Mode = 0 then you are using DStar
# Other radios may need some tweaks
if [[ $MODE == "0" ]]
then
MODE="DStar"
fi
# If the Frequency was not grabbed move on
# If it was then lets convert to Mhz with bc
if [[ $FREQ != "" ]]
then
FREQ=`echo "scale=6; $FREQ/1000000" |bc -l`
fi
}

# Update the @sign/wavi page with the frequency being listened to if the rig is on..
update_atsign () {
echo "FREQ>${FREQ}<"
echo "MODE>${MODE}<"
echo -n "Commit ID:"
./atcli -v update -k custom_qsy.wavi --value "{\"label\":\"QSY\",\"category\":\"SOCIAL\",\"type\":\"Text\",\"value\":\" I am at home listening on ${FREQ}Mhz $MODE\",\"valueLabel\":\"\"}" -p true -a true
}

# Update the @sign/wavi page with QRT message if the rig is off..
qrt_update_atsign () {
echo "Rig Switched off"
echo -n "Commit ID:"
./atcli -v update -k custom_qsy.wavi --value "{\"label\":\"QSY\",\"category\":\"SOCIAL\",\"type\":\"Text\",\"value\":\"I am QRT for now \",\"valueLabel\":\"\"}" -p true -a true
}

# loop forever
# Just poll once a second so other tools like fldigi/others can also chat with the rigctld
get_freq
while true
do
get_freq
if [[ "$FREQ" != "$XFREQ" || "$MODE" != "$XMODE" ]]
then
        if [[ "$FREQ" == "$RIGOFF" || "$MODE" == "$RIGOFF" ]]
        then
        qrt_update_atsign
        else
        update_atsign
        fi
fi
XFREQ=$FREQ
XMODE=$MODE
sleep 1
done
