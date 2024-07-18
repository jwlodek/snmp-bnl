#!../../bin/linux-x86_64/snmp

< envPaths
< /epics/common/xf31id1-ioc1-netsetup.cmd

epicsEnvSet("ENGINEER", "John Doe")
epicsEnvSet("LOCATION", "XF:31ID1")

epicsEnvSet("MIBDIRS", "+$(TOP)/mibs:/var/lib/mibs/ietf/:/usr/share/mibs/ietf/:/usr/share/mibs/iana/")

SNMP_DRV_DEBUG(1)

cd $(TOP)

## Register all support components
dbLoadDatabase("dbd/snmp.dbd")
snmp_registerRecordDeviceDriver(pdbbase)

## Load record instances
dbLoadRecords("$(TOP)/db/AP7900.db", "SYS=XF:31ID1-ES,DEV={PDU:1},IP=host.domain.local")

dbLoadRecords("db/iocAdminSoft.db", "IOC=XF:31ID1-ES{IOC:SNMP}")
dbLoadRecords("db/save_restoreStatus.db", "P=XF:31ID1-ES{IOC:SNMP}")

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")

set_pass0_restoreFile("snmp_settings.sav")
set_pass1_restoreFile("snmp_settings.sav")


iocInit()
#epicsSnmpInit()

makeAutosaveFileFromDbInfo("as/req/snmp_settings.req", "autosaveFields")
create_monitor_set("snmp_settings.req", 10 , "")

dbl > records.dbl
