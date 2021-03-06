{++ BUILD Version: 0001    // Increment this if a change has global effects

Copyright (c) 1992-1999  Microsoft Corporation

Module Name:

    svcguid.h

Abstract:

    Defines GUIDs for well-known services including:
        HOSTNAME
        RFC 1060 (Assigned Numbers) from IANA (All TCP/IP Services)
        NetWare services

Created:

    May 8, 1994

Revision History:

    converted by Alex Konshin alexk@mtgroup.ru  March 4, 2000

}
unit svcguid;

interface

uses
	SysUtils, Windows;

const

// HOSTNAME--special GUID which refers to the name of a host as opposed
// to any particular service on that host.
	SVCID_HOSTNAME                  : TGUID = '{0002a800-0000-0000-c000-000000000046}';

// GUIDs for dealing with AF_INET address spaces alone. These are
// intended to be used when fetching hostent or servent information
// from such a provider. These are not general-purpose types and
// should be used only when the intent is getting at down-level
// information.

	SVCID_INET_HOSTADDRBYINETSTRING : TGUID = '{0002a801-0000-0000-c000-000000000046}';
	SVCID_INET_SERVICEBYNAME        : TGUID = '{0002a802-0000-0000-c000-000000000046}';
	SVCID_INET_HOSTADDRBYNAME       : TGUID = '{0002a803-0000-0000-c000-000000000046}';

// **AK** GUID templates
	SVCID_0_TCP                     : TGUID = '{00090000-0000-0000-c000-000000000046}';
	SVCID_0_UDP                     : TGUID = '{000a0000-0000-0000-c000-000000000046}';
	SVCID_0_NETWARE                 : TGUID = '{000b0000-0000-0000-c000-000000000046}';


// Macros for defining and testing TCP and UDP GUIDs from a well-known port.

function SVCID_TCP( const Port : Word ) : TGUID;
function SVCID_DNS( const RecordType : Word ) : TGUID;

function IS_SVCID_DNS( Id : TGUID ) : Boolean;
function IS_SVCID_TCP( Id : TGUID ) : Boolean;

function PORT_FROM_SVCID_TCP( Id : TGUID ) : Word;

function RR_FROM_SVCID( Id : TGUID ) : Word; // extract RecordType from SVCID_DNS
procedure SET_TCP_SVCID_RR( var Id : TGUID; const Port, RecordType : Word );
procedure SET_TCP_SVCID( var Id : TGUID; const Port : Word );

function SVCID_UDP( const Port : Word ) : TGUID;
function IS_SVCID_UDP( Id : TGUID ) : Boolean;
function PORT_FROM_SVCID_UDP( Id : TGUID ) : Word;
procedure SET_UDP_SVCID( var Id : TGUID; const Port : Word );


// Macros for defining and testing Netware (SAP) services based on the SAP ID.

function SVCID_NETWARE( const SapId : Word ) : TGUID;
function IS_SVCID_NETWARE( Id : TGUID ) : Boolean;
function SAPID_FROM_SVCID_NETWARE( Id : TGUID ) : Word;
procedure SET_NETWARE_SVCID( var Id : TGUID; const SapId : Word );


// RFC 1060 services as defined by the IANA
// GUID block = 0009xxxx-0000-0000-C000-000000000046
const

	SVCID_ECHO_TCP                : TGUID = '{00090007-0000-0000-c000-000000000046}';
	SVCID_DISCARD_TCP             : TGUID = '{00090009-0000-0000-c000-000000000046}';
	SVCID_SYSTAT_TCP              : TGUID = '{0009000b-0000-0000-c000-000000000046}';
	SVCID_DAYTIME_TCP             : TGUID = '{0009000d-0000-0000-c000-000000000046}';
	SVCID_NETSTAT_TCP             : TGUID = '{0009000f-0000-0000-c000-000000000046}';
	SVCID_QOTD_TCP                : TGUID = '{00090011-0000-0000-c000-000000000046}';
	SVCID_CHARGEN_TCP             : TGUID = '{00090013-0000-0000-c000-000000000046}';
	SVCID_FTP_DATA_TCP            : TGUID = '{00090014-0000-0000-c000-000000000046}';
	SVCID_FTP_TCP                 : TGUID = '{00090015-0000-0000-c000-000000000046}';
	SVCID_TELNET_TCP              : TGUID = '{00090017-0000-0000-c000-000000000046}';
	SVCID_SMTP_TCP                : TGUID = '{00090019-0000-0000-c000-000000000046}';
	SVCID_TIME_TCP                : TGUID = '{00090025-0000-0000-c000-000000000046}';
	SVCID_NAME_TCP                : TGUID = '{0009002a-0000-0000-c000-000000000046}';
	SVCID_WHOIS_TCP               : TGUID = '{0009002b-0000-0000-c000-000000000046}';
	SVCID_DOMAIN_TCP              : TGUID = '{00090035-0000-0000-c000-000000000046}';
	SVCID_NAMESERVER_TCP          : TGUID = '{00090035-0000-0000-c000-000000000046}';
	SVCID_MTP_TCP                 : TGUID = '{00090039-0000-0000-c000-000000000046}';
	SVCID_RJE_TCP                 : TGUID = '{0009004d-0000-0000-c000-000000000046}';
	SVCID_FINGER_TCP              : TGUID = '{0009004f-0000-0000-c000-000000000046}';
	SVCID_LINK_TCP                : TGUID = '{00090057-0000-0000-c000-000000000046}';
	SVCID_SUPDUP_TCP              : TGUID = '{0009005f-0000-0000-c000-000000000046}';
	SVCID_HOSTNAMES_TCP           : TGUID = '{00090065-0000-0000-c000-000000000046}';
	SVCID_ISO_TSAP_TCP            : TGUID = '{00090066-0000-0000-c000-000000000046}';
	SVCID_DICTIONARY_TCP          : TGUID = '{00090067-0000-0000-c000-000000000046}';
	SVCID_X400_TCP                : TGUID = '{00090067-0000-0000-c000-000000000046}';
	SVCID_X400_SND_TCP            : TGUID = '{00090068-0000-0000-c000-000000000046}';
	SVCID_CSNET_NS_TCP            : TGUID = '{00090069-0000-0000-c000-000000000046}';
	SVCID_POP_TCP                 : TGUID = '{0009006d-0000-0000-c000-000000000046}';
	SVCID_POP2_TCP                : TGUID = '{0009006d-0000-0000-c000-000000000046}';
	SVCID_POP3_TCP                : TGUID = '{0009006e-0000-0000-c000-000000000046}';
	SVCID_PORTMAP_TCP             : TGUID = '{0009006f-0000-0000-c000-000000000046}';
	SVCID_SUNRPC_TCP              : TGUID = '{0009006f-0000-0000-c000-000000000046}';
	SVCID_AUTH_TCP                : TGUID = '{00090071-0000-0000-c000-000000000046}';
	SVCID_SFTP_TCP                : TGUID = '{00090073-0000-0000-c000-000000000046}';
	SVCID_PATH_TCP                : TGUID = '{00090075-0000-0000-c000-000000000046}';
	SVCID_UUCP_PATH_TCP           : TGUID = '{00090075-0000-0000-c000-000000000046}';
	SVCID_NNTP_TCP                : TGUID = '{00090077-0000-0000-c000-000000000046}';
	SVCID_NBSESSION_TCP           : TGUID = '{0009008b-0000-0000-c000-000000000046}';
	SVCID_NEWS_TCP                : TGUID = '{00090090-0000-0000-c000-000000000046}';
	SVCID_TCPREPO_TCP             : TGUID = '{0009009e-0000-0000-c000-000000000046}';
	SVCID_PRINT_SRV_TCP           : TGUID = '{000900aa-0000-0000-c000-000000000046}';
	SVCID_VMNET_TCP               : TGUID = '{000900af-0000-0000-c000-000000000046}';
	SVCID_VMNET0_TCP              : TGUID = '{00090190-0000-0000-c000-000000000046}';
	SVCID_EXEC_TCP                : TGUID = '{00090200-0000-0000-c000-000000000046}';
	SVCID_LOGIN_TCP               : TGUID = '{00090201-0000-0000-c000-000000000046}';
	SVCID_SHELL_TCP               : TGUID = '{00090202-0000-0000-c000-000000000046}';
	SVCID_PRINTER_TCP             : TGUID = '{00090203-0000-0000-c000-000000000046}';
	SVCID_EFS_TCP                 : TGUID = '{00090208-0000-0000-c000-000000000046}';
	SVCID_TEMPO_TCP               : TGUID = '{0009020e-0000-0000-c000-000000000046}';
	SVCID_COURIER_TCP             : TGUID = '{00090212-0000-0000-c000-000000000046}';
	SVCID_CONFERENCE_TCP          : TGUID = '{00090213-0000-0000-c000-000000000046}';
	SVCID_NETNEWS_TCP             : TGUID = '{00090214-0000-0000-c000-000000000046}';
	SVCID_UUCP_TCP                : TGUID = '{0009021c-0000-0000-c000-000000000046}';
	SVCID_KLOGIN_TCP              : TGUID = '{0009021f-0000-0000-c000-000000000046}';
	SVCID_KSHELL_TCP              : TGUID = '{00090220-0000-0000-c000-000000000046}';
	SVCID_REMOTEFS_TCP            : TGUID = '{0009022c-0000-0000-c000-000000000046}';
	SVCID_GARCON_TCP              : TGUID = '{00090258-0000-0000-c000-000000000046}';
	SVCID_MAITRD_TCP              : TGUID = '{00090259-0000-0000-c000-000000000046}';
	SVCID_BUSBOY_TCP              : TGUID = '{0009025a-0000-0000-c000-000000000046}';
	SVCID_KERBEROS_TCP            : TGUID = '{000902ee-0000-0000-c000-000000000046}';
	SVCID_KERBEROS_MASTER_TCP     : TGUID = '{000902ef-0000-0000-c000-000000000046}';
	SVCID_KRB_PROP_TCP            : TGUID = '{000902f2-0000-0000-c000-000000000046}';
	SVCID_ERLOGIN_TCP             : TGUID = '{00090378-0000-0000-c000-000000000046}';
	SVCID_KPOP_TCP                : TGUID = '{00090455-0000-0000-c000-000000000046}';
	SVCID_INGRESLOCK_TCP          : TGUID = '{000905f4-0000-0000-c000-000000000046}';
	SVCID_KNETD_TCP               : TGUID = '{00090805-0000-0000-c000-000000000046}';
	SVCID_EKLOGIN_TCP             : TGUID = '{00090839-0000-0000-c000-000000000046}';
	SVCID_RMT_TCP                 : TGUID = '{000915b3-0000-0000-c000-000000000046}';
	SVCID_MTB_TCP                 : TGUID = '{000915b4-0000-0000-c000-000000000046}';
	SVCID_MAN_TCP                 : TGUID = '{0009253f-0000-0000-c000-000000000046}';
	SVCID_W_TCP                   : TGUID = '{00092540-0000-0000-c000-000000000046}';
	SVCID_MANTST_TCP              : TGUID = '{00092541-0000-0000-c000-000000000046}';
	SVCID_BNEWS_TCP               : TGUID = '{00092710-0000-0000-c000-000000000046}';
	SVCID_QUEUE_TCP               : TGUID = '{00092711-0000-0000-c000-000000000046}';
	SVCID_POKER_TCP               : TGUID = '{00092712-0000-0000-c000-000000000046}';
	SVCID_GATEWAY_TCP             : TGUID = '{00092713-0000-0000-c000-000000000046}';
	SVCID_REMP_TCP                : TGUID = '{00092714-0000-0000-c000-000000000046}';
	SVCID_QMASTER_TCP             : TGUID = '{0009271c-0000-0000-c000-000000000046}';

	SVCID_ECHO_UDP                : TGUID = '{000a0007-0000-0000-c000-000000000046}';
	SVCID_DISCARD_UDP             : TGUID = '{000a0009-0000-0000-c000-000000000046}';
	SVCID_DAYTIME_UDP             : TGUID = '{000a000d-0000-0000-c000-000000000046}';
	SVCID_QOTD_UDP                : TGUID = '{000a0011-0000-0000-c000-000000000046}';
	SVCID_CHARGEN_UDP             : TGUID = '{000a0013-0000-0000-c000-000000000046}';
	SVCID_TIME_UDP                : TGUID = '{000a0025-0000-0000-c000-000000000046}';
	SVCID_RLP_UDP                 : TGUID = '{000a0027-0000-0000-c000-000000000046}';
	SVCID_NAME_UDP                : TGUID = '{000a002a-0000-0000-c000-000000000046}';
	SVCID_DOMAIN_UDP              : TGUID = '{000a0035-0000-0000-c000-000000000046}';
	SVCID_NAMESERVER_UDP          : TGUID = '{000a0035-0000-0000-c000-000000000046}';
	SVCID_BOOTP_UDP               : TGUID = '{000a0043-0000-0000-c000-000000000046}';
	SVCID_TFTP_UDP                : TGUID = '{000a0045-0000-0000-c000-000000000046}';
	SVCID_PORTMAP_UDP             : TGUID = '{000a006f-0000-0000-c000-000000000046}';
	SVCID_SUNRPC_UDP              : TGUID = '{000a006f-0000-0000-c000-000000000046}';
	SVCID_NTP_UDP                 : TGUID = '{000a007b-0000-0000-c000-000000000046}';
	SVCID_NBNAME_UDP              : TGUID = '{000a0089-0000-0000-c000-000000000046}';
	SVCID_NBDATAGRAM_UDP          : TGUID = '{000a008a-0000-0000-c000-000000000046}';
	SVCID_SGMP_UDP                : TGUID = '{000a0099-0000-0000-c000-000000000046}';
	SVCID_SNMP_UDP                : TGUID = '{000a00a1-0000-0000-c000-000000000046}';
	SVCID_SNMP_TRAP_UDP           : TGUID = '{000a00a2-0000-0000-c000-000000000046}';
	SVCID_LOAD_UDP                : TGUID = '{000a013b-0000-0000-c000-000000000046}';
	SVCID_SYTEK_UDP               : TGUID = '{000a01f4-0000-0000-c000-000000000046}';
	SVCID_BIFF_UDP                : TGUID = '{000a0200-0000-0000-c000-000000000046}';
	SVCID_WHO_UDP                 : TGUID = '{000a0201-0000-0000-c000-000000000046}';
	SVCID_SYSLOG_UDP              : TGUID = '{000a0202-0000-0000-c000-000000000046}';
	SVCID_TALK_UDP                : TGUID = '{000a0205-0000-0000-c000-000000000046}';
	SVCID_NTALK_UDP               : TGUID = '{000a0206-0000-0000-c000-000000000046}';
	SVCID_ROUTE_UDP               : TGUID = '{000a0208-0000-0000-c000-000000000046}';
	SVCID_TIMED_UDP               : TGUID = '{000a020d-0000-0000-c000-000000000046}';
	SVCID_RVD_CONTROL_UDP         : TGUID = '{000a0213-0000-0000-c000-000000000046}';
	SVCID_NETWALL_UDP             : TGUID = '{000a0215-0000-0000-c000-000000000046}';
	SVCID_NEW_RWHO_UDP            : TGUID = '{000a0226-0000-0000-c000-000000000046}';
	SVCID_RMONITOR_UDP            : TGUID = '{000a0230-0000-0000-c000-000000000046}';
	SVCID_MONITOR_UDP             : TGUID = '{000a0231-0000-0000-c000-000000000046}';
	SVCID_ACCTMASTER_UDP          : TGUID = '{000a02bc-0000-0000-c000-000000000046}';
	SVCID_ACCTSLAVE_UDP           : TGUID = '{000a02bd-0000-0000-c000-000000000046}';
	SVCID_ACCT_UDP                : TGUID = '{000a02be-0000-0000-c000-000000000046}';
	SVCID_ACCTLOGIN_UDP           : TGUID = '{000a02bf-0000-0000-c000-000000000046}';
	SVCID_ACCTPRINTER_UDP         : TGUID = '{000a02c0-0000-0000-c000-000000000046}';
	SVCID_ELCSD_UDP               : TGUID = '{000a02c0-0000-0000-c000-000000000046}';
	SVCID_ACCTINFO_UDP            : TGUID = '{000a02c1-0000-0000-c000-000000000046}';
	SVCID_ACCTSLAVE2_UDP          : TGUID = '{000a02c2-0000-0000-c000-000000000046}';
	SVCID_ACCTDISK_UDP            : TGUID = '{000a02c3-0000-0000-c000-000000000046}';
	SVCID_KERBEROS_UDP            : TGUID = '{000a02ee-0000-0000-c000-000000000046}';
	SVCID_KERBEROS_MASTER_UDP     : TGUID = '{000a02ef-0000-0000-c000-000000000046}';
	SVCID_PASSWD_SERVER_UDP       : TGUID = '{000a02f0-0000-0000-c000-000000000046}';
	SVCID_USERREG_SERVER_UDP      : TGUID = '{000a02f1-0000-0000-c000-000000000046}';
	SVCID_PHONE_UDP               : TGUID = '{000a048f-0000-0000-c000-000000000046}';
	SVCID_MAZE_UDP                : TGUID = '{000a0682-0000-0000-c000-000000000046}';
	SVCID_NFS_UDP                 : TGUID = '{000a0801-0000-0000-c000-000000000046}';
	SVCID_RSCS0_UDP               : TGUID = '{000a2710-0000-0000-c000-000000000046}';
	SVCID_RSCS1_UDP               : TGUID = '{000a2711-0000-0000-c000-000000000046}';
	SVCID_RSCS2_UDP               : TGUID = '{000a2712-0000-0000-c000-000000000046}';
	SVCID_RSCS3_UDP               : TGUID = '{000a2713-0000-0000-c000-000000000046}';
	SVCID_RSCS4_UDP               : TGUID = '{000a2714-0000-0000-c000-000000000046}';
	SVCID_RSCS5_UDP               : TGUID = '{000a2715-0000-0000-c000-000000000046}';
	SVCID_RSCS6_UDP               : TGUID = '{000a2716-0000-0000-c000-000000000046}';
	SVCID_RSCS7_UDP               : TGUID = '{000a2717-0000-0000-c000-000000000046}';
	SVCID_RSCS8_UDP               : TGUID = '{000a2718-0000-0000-c000-000000000046}';
	SVCID_RSCS9_UDP               : TGUID = '{000a2719-0000-0000-c000-000000000046}';
	SVCID_RSCSA_UDP               : TGUID = '{000a271a-0000-0000-c000-000000000046}';
	SVCID_RSCSB_UDP               : TGUID = '{000a271b-0000-0000-c000-000000000046}';
	SVCID_QMASTER_UDP             : TGUID = '{000a271c-0000-0000-c000-000000000046}';

	// NetWare services
	// GUID block = 000axxxx-0000-0000-C000-000000000046

	SVCID_PRINT_QUEUE                 : TGUID = '{000b0003-0000-0000-c000-000000000046}';
	SVCID_FILE_SERVER                 : TGUID = '{000b0004-0000-0000-c000-000000000046}';
	SVCID_JOB_SERVER                  : TGUID = '{000b0005-0000-0000-c000-000000000046}';
	SVCID_GATEWAY                     : TGUID = '{000b0006-0000-0000-c000-000000000046}';
	SVCID_PRINT_SERVER                : TGUID = '{000b0007-0000-0000-c000-000000000046}';
	SVCID_ARCHIVE_QUEUE               : TGUID = '{000b0008-0000-0000-c000-000000000046}';
	SVCID_ARCHIVE_SERVER              : TGUID = '{000b0009-0000-0000-c000-000000000046}';
	SVCID_JOB_QUEUE                   : TGUID = '{000b000a-0000-0000-c000-000000000046}';
	SVCID_ADMINISTRATION              : TGUID = '{000b000b-0000-0000-c000-000000000046}';
	SVCID_NAS_SNA_GATEWAY             : TGUID = '{000b0021-0000-0000-c000-000000000046}';
	SVCID_REMOTE_BRIDGE_SERVER        : TGUID = '{000b0024-0000-0000-c000-000000000046}';
	SVCID_TIME_SYNCHRONIZATION_SERVER : TGUID = '{000b002d-0000-0000-c000-000000000046}';
	SVCID_ARCHIVE_SERVER_DYNAMIC_SAP  : TGUID = '{000b002e-0000-0000-c000-000000000046}';
	SVCID_ADVERTISING_PRINT_SERVER    : TGUID = '{000b0047-0000-0000-c000-000000000046}';
	SVCID_BTRIEVE_VAP                 : TGUID = '{000b004b-0000-0000-c000-000000000046}';
	SVCID_DIRECTORY_SERVER            : TGUID = '{000b0278-0000-0000-c000-000000000046}';
	SVCID_NETWARE_386                 : TGUID = '{000b0107-0000-0000-c000-000000000046}';
	SVCID_HP_PRINT_SERVER             : TGUID = '{000b030C-0000-0000-c000-000000000046}';
	SVCID_SNA_SERVER                  : TGUID = '{000b0444-0000-0000-c000-000000000046}';
	SVCID_SAA_SERVER                  : TGUID = '{000b0130-0000-0000-c000-000000000046}';

	// DNS services by record type
	// GUID block = 00090035-0000-xxxx-C000-000000000046

	SVCID_DNS_TYPE_A                  : TGUID = '{00090035-0000-0001-c000-000000000046}';
	SVCID_DNS_TYPE_NS                 : TGUID = '{00090035-0000-0002-c000-000000000046}';
	SVCID_DNS_TYPE_MD                 : TGUID = '{00090035-0000-0003-c000-000000000046}';
	SVCID_DNS_TYPE_MF                 : TGUID = '{00090035-0000-0004-c000-000000000046}';
	SVCID_DNS_TYPE_CNAME              : TGUID = '{00090035-0000-0005-c000-000000000046}';
	SVCID_DNS_TYPE_SOA                : TGUID = '{00090035-0000-0006-c000-000000000046}';
	SVCID_DNS_TYPE_MB                 : TGUID = '{00090035-0000-0007-c000-000000000046}';
	SVCID_DNS_TYPE_MG                 : TGUID = '{00090035-0000-0008-c000-000000000046}';
	SVCID_DNS_TYPE_MR                 : TGUID = '{00090035-0000-0009-c000-000000000046}';
	SVCID_DNS_TYPE_NULL               : TGUID = '{00090035-0000-000a-c000-000000000046}';
	SVCID_DNS_TYPE_WKS                : TGUID = '{00090035-0000-000b-c000-000000000046}';
	SVCID_DNS_TYPE_PTR                : TGUID = '{00090035-0000-000c-c000-000000000046}';
	SVCID_DNS_TYPE_HINFO              : TGUID = '{00090035-0000-000d-c000-000000000046}';
	SVCID_DNS_TYPE_MINFO              : TGUID = '{00090035-0000-000e-c000-000000000046}';
	SVCID_DNS_TYPE_MX                 : TGUID = '{00090035-0000-000f-c000-000000000046}';
	SVCID_DNS_TYPE_TEXT               : TGUID = '{00090035-0000-0010-c000-000000000046}';
	SVCID_DNS_TYPE_RP                 : TGUID = '{00090035-0000-0011-c000-000000000046}';
	SVCID_DNS_TYPE_AFSDB              : TGUID = '{00090035-0000-0012-c000-000000000046}';
	SVCID_DNS_TYPE_X25                : TGUID = '{00090035-0000-0013-c000-000000000046}';
	SVCID_DNS_TYPE_ISDN               : TGUID = '{00090035-0000-0014-c000-000000000046}';
	SVCID_DNS_TYPE_RT                 : TGUID = '{00090035-0000-0015-c000-000000000046}';
	SVCID_DNS_TYPE_NSAP               : TGUID = '{00090035-0000-0016-c000-000000000046}';
	SVCID_DNS_TYPE_NSAPPTR            : TGUID = '{00090035-0000-0017-c000-000000000046}';
	SVCID_DNS_TYPE_SIG                : TGUID = '{00090035-0000-0018-c000-000000000046}';
	SVCID_DNS_TYPE_KEY                : TGUID = '{00090035-0000-0019-c000-000000000046}';
	SVCID_DNS_TYPE_PX                 : TGUID = '{00090035-0000-001a-c000-000000000046}';
	SVCID_DNS_TYPE_GPOS               : TGUID = '{00090035-0000-001b-c000-000000000046}';
	SVCID_DNS_TYPE_AAAA               : TGUID = '{00090035-0000-001c-c000-000000000046}';
	SVCID_DNS_TYPE_LOC                : TGUID = '{00090035-0000-001d-c000-000000000046}';
	SVCID_DNS_TYPE_NXT                : TGUID = '{00090035-0000-001e-c000-000000000046}';
	SVCID_DNS_TYPE_SRV                : TGUID = '{00090035-0000-0021-c000-000000000046}';
	SVCID_DNS_TYPE_ATMA               : TGUID = '{00090035-0000-0022-c000-000000000046}';

implementation

function SVCID_TCP( const Port : Word ) : TGUID;
begin
	Result := SVCID_0_TCP;
	PWord(@Result.D1)^ := Port;
end;

function SVCID_DNS( const RecordType : Word ) : TGUID;
begin
	Result := SVCID_DOMAIN_TCP;
	Result.D3 := RecordType;
end;

function IS_SVCID_DNS( Id : TGUID ) : Boolean;
begin
	with Id do Result := (D1=$00090035) and (D2=0) and (PInteger(@D4)^=$000000c0) and (PInteger(PChar(@D4)+4)^=$46000000);
end;

function IS_SVCID_TCP( Id : TGUID ) : Boolean;
begin
	with Id do Result := (PWord(PChar(@D1)+2)^=$0009) and (D2=0) and (PInteger(@D4)^=$000000c0) and (PInteger(PChar(@D4)+4)^=$46000000);
end;

function PORT_FROM_SVCID_TCP( Id : TGUID ) : Word;
begin
	Result := PWord(@Id.D1)^;
end;

function RR_FROM_SVCID( Id : TGUID ) : Word;
begin
	Result := Id.D3;
end;

procedure SET_TCP_SVCID_RR( var Id : TGUID; const Port, RecordType : Word );
begin
	with Id do
	begin
		PWord(@D1)^ := Port;
		D3 := RecordType;
	end;
end;

procedure SET_TCP_SVCID( var Id : TGUID; const Port : Word );
begin
	PWord(@Id.D1)^ := Port;
end;

function SVCID_UDP( const Port : Word ) : TGUID;
begin
	Result := SVCID_0_UDP;
	PWord(@Result.D1)^ := Port;
end;

function IS_SVCID_UDP( Id : TGUID ) : Boolean;
begin
	with Id do Result := (PWord(PChar(@D1)+2)^=$000a) and (D2=0) and (PInteger(@D4)^=$000000c0) and (PInteger(PChar(@D4)+4)^=$46000000);
end;

function PORT_FROM_SVCID_UDP( Id : TGUID ) : Word;
begin
	Result := PWord(@Id.D1)^;
end;

procedure SET_UDP_SVCID( var Id : TGUID; const Port : Word );
begin
	PWord(@Id.D1)^ := Port;
end;

function SVCID_NETWARE( const SapId : Word ) : TGUID;
begin
	Result := SVCID_0_NETWARE;
	PWord(@Result.D1)^ := SapId;
end;

function IS_SVCID_NETWARE( Id : TGUID ) : Boolean;
begin
	with Id do Result := (PWord(PChar(@D1)+2)^=$000b) and (D2=0) and (PInteger(@D4)^=$000000c0) and (PInteger(PChar(@D4)+4)^=$46000000);
end;

function SAPID_FROM_SVCID_NETWARE( Id : TGUID ) : Word;
begin
	Result := PWord(@Id.D1)^;
end;

procedure SET_NETWARE_SVCID( var Id : TGUID; const SapId : Word );
begin
	PWord(@Id.D1)^ := SapId;
end;


end.
