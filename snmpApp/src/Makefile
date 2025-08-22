TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

USR_CFLAGS += `net-snmp-config --cflags`
USR_CFLAGS += -DNETSNMP_NO_INLINE

USR_LDFLAGS += `net-snmp-config --libs`
PROD_LDLIBS += `net-snmp-config --libs`

USR_CFLAGS += $(shell $(PERL) ../getNetSNMPversion.pl)
USR_CPPFLAGS += $(shell $(PERL) ../getNetSNMPversion.pl)


PROD_IOC = snmp
# snmp.dbd will be created and installed
DBD += snmp.dbd

# snmp.dbd will be made up from these files:
snmp_DBD += base.dbd

# Include dbd files from all support applications:
snmp_DBD += devSnmp.dbd
snmp_DBD += system.dbd
snmp_DBD += devIocStats.dbd
snmp_DBD += asSupport.dbd
snmp_DBD += caPutLog.dbd
snmp_DBD += reccaster.dbd
snmp_DBD += calc.dbd calcSupport.dbd

# Add all the support libraries needed by this IOC
snmp_LIBS += devIocStats autosave caPutLog devSnmp reccaster calc

# snmp_registerRecordDeviceDriver.cpp derives from snmp.dbd
snmp_SRCS += snmp_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
snmp_SRCS_DEFAULT += snmpMain.cpp
snmp_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#snmp_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
snmp_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

