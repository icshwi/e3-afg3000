require asyn,4.33
require stream,2.8.8
require afg3000,master

epicsEnvSet("AFG_IP",    "$(AFG3000_IP=10.4.0.46)")   # Choose afg ethernet address
epicsEnvSet("AFG_PREFIX", "$(AFG3000_PREFIX=AFG3102C)") # Choose site prefix name
epicsEnvSet("AFG_ASYN_PORT",  "AFG3102C")  # Choose asyn port name
epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES", 1000000)

# Setup IOC->hardware link
vxi11Configure("$(AFG_ASYN_PORT)", "$(AFG_IP)", 0, 0.0, "inst0", 0)

# Tell E3 where the stream device protocol file is
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(E3_SITEAPPS_PATH)/afg3000/master/db"

# Load records
dbLoadRecords("AFG3000Device.template","PREFIX=$(AFG_PREFIX),ASYN_PORT=$(AFG_ASYN_PORT),ASYN_ADDR=0")
dbLoadRecords("AFG3000Channel.template","PREFIX=$(AFG_PREFIX),ASYN_PORT=$(AFG_ASYN_PORT),ASYN_ADDR=0, NDS_CH=AO0, CHANNEL=1")
dbLoadRecords("AFG3000Channel.template","PREFIX=$(AFG_PREFIX),ASYN_PORT=$(AFG_ASYN_PORT),ASYN_ADDR=0, NDS_CH=AO1, CHANNEL=2")

iocInit()
