(* Mathematica Package *)

(* Created by Phil Ngo, Wolfram Research Inc., Jun 27, 2013 *)

BeginPackage["ANTConnector`"]
(* Exported symbols added here with SymbolName::usage *) 

LoadANTLibrary::usage = "Loads the library.";
ANTInit::usage = "ANTInit[ucUSBDeviceNum, ulBaudrate] initializes and opens USB connection to the module";
ANTInitSpecial::usage = "ANTInitSpecial[ucUSBDeviceNum, ulBaudrate, ucPortType, ucSerialFramerType] initializes and opens USB connection to the module, specifying port and framer type";
ANTClose::usage = "ANTClose[] is called by the application to close the usb connection. MUST NOT BE CALLED IN THE CONTEXT OF THE MessageThread. That is, at the application level it must not be called within the callback functions into this library.";
ANTAssignResponseFunction::usage = "ANTAssignResponseFunction[pfResponse] is called by the application to initialize the main callback funcation, which must be initialized before the application can receive any reponse messages.";
ANTAssignChannelEventFunction::usage = "ANTAssignChannelEventFunction[ucLink, pfLinkEvent] is called by the application to initialize the callback funcation and data buffers for a particular channel.  This must be done in order for a channel to function properly.";
ANTUnassignAllResponseFunctions::usage = "ANTUnassignAllResponseFunctions[] unassigns all response functions. Important for memory management of higher layer applications to avoid this library calling invalid pointers";
ANTLibVersion::usage = "ANTLibVersion[] returns a pointer to a string constant containing the core library version.";
ANTResetSystem::usage = "ANTResetSystem[] is called by the application to restart ANT on the module.";
ANTSetNetworkKey::usage = "ANTSetNetworkKey[ucNetNumber, listKey] is called by the application to set the network address for a given module channel. !! This is (should be) a private network function";
ANTSetNetworkKeyRTO::usage = "ANTSetNetworkKey[ucNetNumber, listKey, ulResponseTime] is called by the application to set the network address for a given module channel. This is (should be) a private network function! Response timeout version.";
ANTAssignChannel::usage = "ANTAssignChannel[ucANTChannel, ucChanType, ucNetNumber] is called by the application to assign a channel";
ANTAssignChannelRTO::usage = "ANTAssignChannelRTO[ucANTChannel, ucChanType, ucNetNumber, ulResponseTime] is called by the application to assign a channel. Response Timeout Version";
ANTAssignChannelExt::usage = "ANTAssignChannelExt[ucANTChannel, ucChanType, ucNetNumber, ucExtFlags] is called by the application to assign a channel using extended assignment";
ANTAssignChannelExtRTO::usage = "ANTAssignChannelExtRTO[ucANTChannel, ucChanType, ucNetNumber, ucExtFlags, ulResponseTime] is called by the application to assign a channel using extended assignment. Response Timeout Version";
ANTUnassignChannel::usage = "ANTUnassignChannel[ucANTChannel] is called by the application to unassign a channel";
ANTUnassignChannelRTO::usage = "ANTUnassignChannelRTO[ucANTChannel, ulResponseTime] is called by the application to unassign a channel. Response Timeout Version";
ANTSetChannelID::usage = "ANTSetChannelID[ucANTChannel, usDeviceNumber, ucDeviceType, ucTransmissionType] is called by the application to set the channel ID";
ANTSetChannelIDRTO::usage = "ANTSetChannelIDRTO[ucANTChannel, usDeviceNumber, ucDeviceType, ucTransmissionType, ulResponseTime] is called by the application to set the channel ID. Response Timeout Version";
ANTSetChannelPeriod::usage = "ANTSetChannelPeriod[ucANTChannel, usMesgPeriod] is called by the application to set the messaging period";
ANTSetChannelPeriodRTO::usage = "ANTSetChannelPeriodRTO[ucANTChannel, usMesgPeriod, ulResponseTime] is called by the application to set the messaging period. Response Timeout Version";
ANTRSSISetSearchThreshold::usage = "ANTRSSISetSearchThreshold[ucANTChannel, ucThreshold] is called by the application to set the messaging period";
ANTRSSISetSearchThresholdRTO::usage = "ANTRSSISetSearchThresholdRTO[ucANTChannel, ucThreshold, ulResponseTime] is called by the application to set the messaging period. Response Timeout Version";
ANTSetLowPriorityChannelSearchTimeout::usage = "ANTSetLowPriorityChannelSearchTimeout[ucANTChannel, ucSearchTimeout] is used to set Low Priority Search Timeout. Not available on AP1";
ANTSetLowPriorityChannelSearchTimeoutRTO::usage = "ANTSetLowPriorityChannelSearchTimeoutRTO[ucANTChannel, ucSearchTimeout, ulResponseTime] is used to set Low Priority Search Timeout. Not available on AP1. Response Timeout Version";
ANTSetChannelSearchTimeout::usage = "ANTSetChannelSearchTimeout[ucANTChannel, ucSearchTimeout] is called by the application to set the search timeout for a particular channel on the module";
ANTSetChannelSearchTimeoutRTO::usage = "ANTSetChannelSearchTimeoutRTO[ucANTChannel, ucSearchTimeout, ulResponseTime] is called by the application to set the search timeout for a particular channel on the module. Response Timeout Version";
ANTSetChannelRFFreq::usage = "ANTSetChannelRFFreq[ucANTChannel, ucRFFreq] is called by the application to set the RF frequency for a given channel !! This is (should be) a private network function ";
ANTSetChannelRFFreqRTO::usage = "ANTSetChannelRFFreqRTO[ucANTChannel, ucRFFreq, ulResponseTime] is called by the application to set the RF frequency for a given channel !! This is (should be) a private network function. Response Timeout Version";
ANTSetTransmitPower::usage = "ANTSetTransmitPower[ucTransmitPower] is called by the application to set the transmit power for the module";
ANTSetTransmitPowerRTO::usage = "ANTSetTransmitPowerRTO[ucTransmitPower, ulResponseTime] is called by the application to set the transmit power for the module. Response Timeout Version";
ANTSetChannelTxPower::usage = "ANTSetChannelTxPower[ucANTChannel, ucTransmitPower] is called by the application to set the transmit power for the module";
ANTSetChannelTxPowerRTO::usage = "ANTSetChannelTxPowerRTO[ucANTChannel, ucTransmitPower, ulResponseTime] is called by the application to set the transmit power for the module. Response Timeout Version";
ANTRequestMessage::usage = "ANTRequestMessage[ucANTChannel, ucMessageID] is called by the application to request a generic message";
ANTWriteMessage::usage = "ANTWriteMessage[ucMessageID, aucData, usMessageSize] is called by the application to send a generic message";
ANTOpenChannel::usage = "ANTOpenChannel[ucANTChannel] is called by the application to open an assigned channel";
ANTOpenChannelRTO::usage = "ANTOpenChannelRTO[ucANTChannel, ulResponseTime] is called by the application to open an assigned channel. Response Timeout Version";
ANTCloseChannel::usage = "ANTCloseChannel[ucANTChannel] is called by the application to close an open channel";
ANTCloseChannelRTO::usage = "ANTCloseChannelRTO[ucANTChannel, ulResponseTime] is called by the application to close an open channel. Response Timeout Version";
ANTSendBroadcastData::usage = "ANTSendBroadcastData[ucANTChannel, pucData] is called by the application to construct and send a broadcast data message. This message will be broadcast on the next synchronous channel period.";
ANTSendAcknowledgedData::usage = "ANTSendAcknowledgedData[ucANTChannel, pucData] is called by the application to construct and send an acknowledged data mesg.  This message will be transmitted on the next synchronous channel period.";
ANTSendAcknowledgedDataRTO::usage = "ANTSendAcknowledgedDataRTO[ucANTChannel, pucData, ulResponseTime] is called by the application to construct and send an acknowledged data mesg.  This message will be transmitted on the next synchronous channel period. Response Timeout Version";
ANTSendBurstTransfer::usage = "ANTSendBurstTransfer[ucANTChannel, pucData, usNumDataPackets] is used to send burst data using a block of data.  Proper sequence number of packet is maintained by the function.  Useful for testing purposes.";
ANTSendBurstTransferRTO::usage = "ANTSendBurstTransferRTO[ucANTChannel, pucData, usNumDataPackets, ulResponseTime] is used to send burst data using a block of data.  Proper sequence number of packet is maintained by the function.  Useful for testing purposes. Response Timeout Version";
ANTInitCWTestMode::usage = "ANTInitCWTestMode[] is called by the application to configure and start CW test mode. There is no way to turn off CW mode other than to do a reset on the module.";
ANTInitCWTestModeRTO::usage = "ANTInitCWTestModeRTO[ulResponseTime] is called by the application to configure and start CW test mode. There is no way to turn off CW mode other than to do a reset on the module. Response Timeout Version";
ANTSetCWTestMode::usage = "ANTSetCWTestMode[ucANTChannel, ucRFChannel] is called by the application to configure and start CW test mode. There is no way to turn off CW mode other than to do a reset on the module. ";
ANTSetCWTestModeRTO::usage = "ANTSetCWTestModeRTO[ucANTChannel, ucRFChannel, ulResponseTime] is called by the application to configure and start CW test mode. There is no way to turn off CW mode other than to do a reset on the module. Response Timeout Version";
ANTAddChannelID::usage = "ANTAddChannelID[ucANTChannel, usDeviceNumber, ucDeviceType, ucTransmissionType, ucListIndex] adds a channel ID to a channel's include/exclude ID list.";
ANTAddChannelIDRTO::usage = "ANTAddChannelIDRTO[ucANTChannel, usDeviceNumber, ucDeviceType, ucTransmissionType, ucListIndex, ulResponseTime] adds a channel ID to a channel's include/exclude ID list. Response Timeout Version";
ANTConfigList::usage = "ANTConfigList[ucANTChannel, ucListSize, ucExclude] configures the size and type of a channel's include/exclude ID list";
ANTConfigListRTO::usage = "ANTConfigListRTO[ucANTChannel, ucListSize, ucExclude, ulResponseTime] configures the size and type of a channel's include/exclude ID list. Response Timeout Version";
ANTOpenRxScanMode::usage = "ANTOpenRxScanMode[] opens Scan Mode";
ANTOpenRxScanModeRTO::usage = "ANTOpenRxScanModeRTO[ulResponseTime] opens Scan Mode. Response Timeout Version";
ANTConfigFrequencyAgility::usage = "ANTConfigFrequencyAgility[ucANTChannel, ucFreq1, ucFreq2, ucFreq3] configures ANT Freqeuncy Agility Functionality (not on AP1 or AT3)";
ANTConfigFrequencyAgilityRTO::usage = "ANTConfigFrequencyAgilityRTO[ucANTChannel, ucFreq1, ucFreq2, ucFreq3, ulResponseTime] configures ANT Freqeuncy Agility Functionality (not on AP1 or AT3). Response Timeout Version";
ANTSetProximitySearch::usage = "ANTSetProximitySearch[ucANTChannel, ucSearchThreshold] configures proximity search (not on AP1 or AT3)";
ANTSetProximitySearchRTO::usage = "ANTSetProximitySearchRTO[ucANTChannel, ucSearchThreshold, ulResponseTime] configures proximity search (not on AP1 or AT3). Response Timeout Version";
ANTSleepMessage::usage = "ANTSleepMessage[] message to put into DEEP SLEEP (not on AP1 or AT3)";
ANTSleepMessageRTO::usage = "ANTSleepMessageRTO[ulResponseTime] message to put into DEEP SLEEP (not on AP1 or AT3). Response Timeout Version";
ANTCrystalEnable::usage = "ANTCrystalEnable[] enables crystal";
ANTCrystalEnableRTO::usage = "ANTCrystalEnableRTO[ulResponseTime]  enables crystal. Response Timeout Version";
ANTNVMWrite::usage = "ANTNVMWrite[ucSize, pucData] is called by the application to write NVM data";
ANTNVMWriteRTO::usage = "ANTNVMWriteRTO[ucSize, pucData, ulResponseTime] is called by the application to write NVM data. Response Timeout Version";
ANTNVMClear::usage = "ANTNVMClear[ucSectNumber] is called by the application to clear NVM data";
ANTNVMClearRTO::usage = "ANTNVMClearRTO[ucSectNumber, ulResponseTime] is called by the application to clear NVM data. Response Timeout Version";
ANTNVMSetDefaultSector::usage = "ANTNVMSetDefaultSector[ucSectNumber] is called by the application to set default NVM sector";
ANTNVMSetDefaultSectorRTO::usage = "ANTNVMSetDefaultSectorRTO[ucSectNumber, ulResponseTime] is called by the application to set default NVM sector. Response Timeout Version";
ANTNVMEndSector::usage = "ANTNVMEndSector[] is called by the application to end NVM sector";
ANTNVMEndSectorRTO::usage = "ANTNVMEndSectorRTO[ulResponseTime] is called by the application to end NVM sector. Response Timeout Version";
ANTNVMDump::usage = "ANTNVMDump[] is called by the application to dump the contents of the NVM";
ANTNVMDumpRTO::usage = "ANTNVMDumpRTO[ulResponseTime] is called by the application to dump the contents of the NVM. Response Timeout Version";
ANTNVMLock::usage = "ANTNVMLock[] is called by the application to lock the contents of the NVM";
ANTNVMLockRTO::usage = "ANTNVMLockRTO[ulResponseTimeout] is called by the application to lock the contents of the NVM. Response Timeout Version";
FITSetFEState::usage = "FITSetFEState[ucFEState] is called by the application to set the state of the FE (FIT1e)";
FITSetFEStateRTO::usage = "FITSetFEStateRTO[ucFEState, ulResponseTime] is called by the application to set the state of the FE (FIT1e). Response Timeout Version";
FITAdjustPairingSettings::usage = "FITAdjustPairingSettings[cSearchLv, ucPairLv, ucTrackLv] is called by the application to set the pairing distance (FIT1e)";
FITAdjustPairingSettingsRTO::usage = "FITAdjustPairingSettingsRTO[cSearchLv, ucPairLv, ucTrackLv, ulResponseTime] is called by the application to set the pairing distance (FIT1e). Response Timeout Version";
ANTSendExtBroadcastData::usage = "ANTSendExtBroadcastData[ucANTChannel_, pucData] is called by the application to construct and send an extended broadcast data message. This message will be broadcast on the next synchronous channel period.";
ANTSendExtAcknowledgedData::usage = "ANTSendExtAcknowledgedData[ucANTChannel, pucData] is called by the application to construct and send an extended acknowledged data mesg.  This message will be transmitted on the next synchronous channel period";
ANTSendExtAcknowledgedDataRTO::usage = "ANTSendExtAcknowledgedDataRTO[ucANTChannel, pucData, ulResponseTime] is called by the application to construct and send an extended acknowledged data mesg.  This message will be transmitted on the next synchronous channel period. Response Timeout Version";
ANTSendExtBurstTransfer::usage = "ANTSendExtBurstTransfer[ucANTChannel, pucData, usNumDataPackets] is used to send extended burst data using a block of data.  Proper sequence number of packet is maintained by the function.  Useful for testing purposes.";
ANTSendExtBurstTransferRTO::usage = "ANTSendExtBurstTransferRTO[ucANTChannel_, pucData, usNumDataPackets, ulResponseTime] is used to send extended burst data using a block of data.  Proper sequence number of packet is maintained by the function.  Useful for testing purposes. Response Timeout Version";
ANTSendExtBurstTransferPacket::usage = "ANTSendExtBurstTransferPacket[ucANTChannelSeq_, pucData] is used to send extended burst data with individual packets.  Proper sequence number of packet is maintained by the application.";
ANTRxExtMesgsEnable::usage = "ANTRxExtMesgsEnable[ucEnable] is used to force the module to use extended rx messages all the time";
ANTRxExtMesgsEnableRTO::usage = "ANTRxExtMesgsEnableRTO[ucEnable, ulResponseTimeout]  is used to force the module to use extended rx messages all the time. Response Timeout Version";
ANTSetSerialNumChannelID::usage = "ANTSetSerialNumChannelID[ucANTChannel, ucDeviceType, ucTransmissionType] is used to set a channel device ID to the module serial number";
ANTSetSerialNumChannelIDRTO::usage = "ANTSetSerialNumChannelIDRTO[ucANTChannel, ucDeviceType, ucTransmissionType, ulResponseTime] is used to set a channel device ID to the module serial number. Response Timeout Version";
ANTEnableLED::usage = "ANTEnableLED[ucEnable] enables the module LED to flash on RF activity";
ANTEnableLEDRTO::usage = "ANTEnableLEDRTO[ucEnable, ulResponseTime] enables the module LED to flash on RF activity. Response Timeout Version";
ANTGetDeviceUSBInfo::usage = "ANTGetDeviceUSBInfo[ucDeviceNum] is called by the application to get the product string and serial number string (four bytes) of a particular device";
ANTGetDeviceUSBPID::usage = "ANTGetDeviceUSBPID[] is called by the application to get the USB PID";
ANTGetDeviceUSBVID::usage = "ANTGetDeviceUSBVID[] is called by the application to get the USB VID";
ANTFSInitEEPROMDevice::usage = "ANTFSInitEEPROMDevice[usPageSize, ucAddressConfig]";
ANTFSInitFSMemory::usage = "ANTFSInitFSMemory[]";
ANTFSFormatFSMemory::usage = "ANTFSFormatFSMemory[usNumberOfSectors, usPagesPerSector_]";
ANTFSSaveDirectory::usage = "ANTFSSaveDirectory[]";
ANTFSDirectoryRebuild::usage = "ANTFSDirectoryRebuild[]";
ANTFSFileDelete::usage = "ANTFSFileDelete[ucFileHandle]";
ANTFSFileClose::usage = "ANTFSFileClose[ucFileHandle]";
ANTFSSetFileSpecificFlags::usage = "ANTFSSetFileSpecificFlags[ucFileHandle, ucFlags] ";
ANTFSDirectoryReadLock::usage = "ANTFSDirectoryReadLock[bLock_]";
ANTFSSetSystemTime::usage = "ANTFSSetSystemTime[ulTime_]";
ANTFSGetUsedSpace::usage = "ANTFSGetUsedSpace[]";
ANTFSGetFreeSpace::usage = "ANTFSGetFreeSpace[]";
ANTFSFindFileIndex::usage = "ANTFSFindFileIndex[ucFileDataType_, ucFileSubType_, usFileNumber_]";
ANTFSReadDirectoryAbsolute::usage = "ANTFSReadDirectoryAbsolute[ulOffset_,ucSize_, pucBuffer_]";
ANTFSDirectoryReadEntry::usage = "ANTFSDirectoryReadEntry[usFileIndex_, ucFileDirectoryBuffer_]";
ANTFSDirectoryGetSize::usage = "ANTFSDirectoryGetSize[]";
ANTFSFileCreate::usage = "ANTFSFileCreate[usFileIndex, ucFileDataType, ulFileIdentifier, ucFileDataTypeSpecificFlags, ucGeneralFlags]";
ANTFSFileOpen::usage = "ANTFSFileOpen[usFileIndex, ucFileDataType]";
ANTFSFileReadAbsolute::usage = "ANTFSFileReadAbsolute[ucFileHandle, ulOffset,ucReadSize, pucReadBuffer]";
ANTFSFileReadRelative::usage = "ANTFSFileReadRelative[ucFileHandle, ucReadSize, pucReadBuffer]";
ANTFSFileWriteAbsolute::usage = "ANTFSFileWriteAbsolute[ucFileHandle, ulFileOffset,ucWriteSize, pucWriteBuffer, pucBytesWritten]";
ANTFSFileWriteRelative::usage = "ANTFSFileWriteRelative[ucFileHandle, ucWriteSize, pucWriteBuffer, pucBytesWritten]";
ANTFSFileGetSize::usage = "ANTFSFileGetSize[ucFileHandle]";
ANTFSFileGetSizeInMem::usage = "ANTFSFileGetSizeInMem[ucFileHandle]";
ANTFSFileGetSpecificFlags::usage = "ANTFSFileGetSpecificFlags[ucFileHandle]";
ANTFSFileGetSystemTime::usage = "ANTFSFileGetSystemTime[]";
ANTFSCryptoAddUserKeyIndex::usage = "ANTFSCryptoAddUserKeyIndex[ucIndex, pucKey]";
ANTFSCryptoSetUserKeyIndex::usage = "ANTFSCryptoSetUserKeyIndex[ucIndex]";
ANTFSCryptoSetUserKeyVal::usage = "ANTFSCryptoSetUserKeyVal[pucKey]";
ANTFSFitFileIntegrityCheck::usage = "ANTFSFitFileIntegrityCheck[ucFileHandle]";
ANTFSOpenBeacon::usage = "ANTFSOpenBeacon[]";
ANTFSCloseBeacon::usage = "ANTFSCloseBeacon[]";
ANTFSConfigBeacon::usage = "ANTFSConfigBeacon[usDeviceType, usManufacturer, ucAuthType, ucBeaconStatus]";
ANTFSSetFriendlyName::usage = "ANTFSSetFriendlyName[ucLength, pucString]";
ANTFSSetPasskey::usage = "ANTFSSetPasskey[ucLength, pucString]";
ANTFSSetBeaconState::usage = "ANTFSSetBeaconState[ucBeaconStatus]";
ANTFSPairResponse::usage = "ANTFSPairResponse[bAccept]";
ANTFSSetLinkFrequency::usage = "ANTFSSetLinkFrequency[ucChannelNumber, ucFrequency]";
ANTFSSetBeaconTimeout::usage = "ANTFSSetBeaconTimeout[ucTimeout]";
ANTFSSetPairingTimeout::usage = "ANTFSSetPairingTimeout[ucTimeout]";
ANTFSEnableRemoteFileCreate::usage = "ANTFSEnableRemoteFileCreate[bEnable]";
ANTFSGetCmdPipe::usage = "ANTFSGetCmdPipe[ucOffset, ucReadSize, pucReadBuffer]";
ANTFSSetCmdPipe::usage = "ANTFSSetCmdPipe[ucOffset, ucWriteSize, pucWriteBuffer]";
ANTFSGetLastError::usage = "ANTFSGetLastError[]";
ANTNap::usage = "ANTNap[ulMilliseconds] Put current thread to sleep for the specified number of milliseconds";

ANTDeviceConnect::usage = "ANTDeviceConnect[deviceProfileType_String] connects to the device with the specified profile type.";
ANTDeviceData::usage = "ANTDeviceData[deviceProfileType_String] gets data from the device with the specified profile type.";
ANTDeviceDisconnect::usage = "ANTDeviceDisconnect[] disconnects from all devices.";

LoadANTLibrary::badfunc = "Could not load one of the library functions";
LoadANTLibrary::loaded = "Library already loaded";

GetNumCallbacks::usage = "";
(*eventHandler::info = "";*)

Begin["`Private`"]
(* Implementation of the package *)
numCallbacks = 0;
numDataPackets = 0;
MAXCHANNELS = 8;
$packageFile = $InputFileName;
$libraryFileName = Null;
Switch[$SystemID,
	"MacOSX-x86-64",
		$libraryFileName = "ANTConnector.dylib";,
	"Windows",
		$libraryFileName = "ANT_DLL.dll";,
	"Windows-x86-64",
		$libraryFileName = "ANT_DLL.dll",
	_,
		Print["ANT Mathematica connection for this System unsupported."];
];
$libraryPath = Null;
If[!MatchQ[$libraryFileName,Null],
	$libraryPath = FileNameJoin[{FileNameTake[$packageFile,{1,-2}],"LibraryResources",$SystemID,$libraryFileName}];
];
$libraryLoaded = False;

(* Callback Functions *)
ResponseFunction = None;
ChannelEventFunctions = Table[None, {MAXCHANNELS}];

(* Message Info Offsets *)
MESGCHANNELOFFSET = 2;
MESGEVENTIDOFFSET = 3;
MESGEVENTCODEOFFSET = 4;
AUTOTRANSFERCHANNEL = FromDigits["FF",16];

(* Masks *)
CHANNELNUMBERMASK = FromDigits["1F",16];
SEQUENCENUMBERMASK = FromDigits["E0",16];
SEQUENCENUMBERROLLOVER = FromDigits["60",16];
SEQUENCEFIRSTMESSAGE = FromDigits["00",16];
SEQUENCELASTMESSAGE = FromDigits["80",16];
SEQUENCENUMBERINC = FromDigits["20",16];

(* Message IDS*)
MESGINVALIDID = FromDigits["00",16];
MESGEVENTID = FromDigits["01",16];
MESGVERSIONID = FromDigits["3E",16];
MESGRESPONSEEVENTID = FromDigits["40",16];
MESGUNASSIGNCHANNELID = FromDigits["41",16];
MESGASSIGNCHANNELID = FromDigits["42",16];
MESGCHANNELMESGPERIODID = FromDigits["43",16];
MESGCHANNELSEARCHTIMEOUTID = FromDigits["44",16];
MESGCHANNELRADIOFREQID = FromDigits["45",16];
MESGNETWORKKEYID = FromDigits["46",16];
MESGRADIOTXPOWERID = FromDigits["47",16];
MESGRADIOCWMODEID = FromDigits["48",16];
MESGSYSTEMRESETID = FromDigits["4A",16];
MESGOPENCHANNELID = FromDigits["4B",16];
MESGCLOSECHANNELID = FromDigits["4C",16];
MESGREQUESTID = FromDigits["4D",16];
MESGBROADCASTDATAID = FromDigits["4E",16];
MESGACKNOWLEDGEDDATAID = FromDigits["4F",16];
MESGBURSTDATAID = FromDigits["50",16];
MESGCHANNELIDID = FromDigits["51",16];
MESGCHANNELSTATUSID = FromDigits["52",16];
MESGRADIOCWINITID = FromDigits["53",16];
MESGCAPABILITIESID = FromDigits["54",16];
MESGSTACKLIMITID = FromDigits["55",16];
MESGSCRIPTDATAID = FromDigits["56",16];
MESGSCRIPTCMDID = FromDigits["57",16];
MESGIDLISTADDID = FromDigits["59",16];
MESGIDLISTCONFIGID = FromDigits["5A",16];
MESGOPENRXSCANID = FromDigits["5B",16];
MESGEXTBROADCASTDATAID = FromDigits["5D",16];
MESGEXTACKNOWLEDGEDDATAID = FromDigits["5E",16];
MESGEXTBURSTDATAID = FromDigits["5F",16];
MESGCHANNELRADIOTXPOWERID = FromDigits["60",16];
MESGGETSERIALNUMID = FromDigits["61",16];
MESGGETTEMPCALID = FromDigits["62",16];
MESGSETLPSEARCHTIMEOUTID = FromDigits["63",16];
MESGSETTXSEARCHONNEXTID = FromDigits["64",16];
MESGSERIALNUMSETCHANNELIDID = FromDigits["65",16];
MESGRXEXTMESGSENABLEID = FromDigits["66",16];
MESGRADIOCONFIGALWAYSID = FromDigits["67",16];
MESGENABLELEDFLASHID = FromDigits["68",16];
MESGXTALENABLEID = FromDigits["6D",16];
MESGANTLIBCONFIGID = FromDigits["6E",16];
MESGSTARTUPMESGID = FromDigits["6F",16];
MESGAUTOFREQCONFIGID = FromDigits["70",16];
MESGPROXSEARCHCONFIGID = FromDigits["71",16];
MESGSETSEARCHCHPRIORITYID = FromDigits["75",16];
MESGCUBECMDID = FromDigits["80",16];
MESGGETPINDIODECONTROLID = FromDigits["8D",16];
MESGPINDIODECONTROLID = FromDigits["8E",16];
MESGFIT1SETAGCID = FromDigits["8F",16];
MESGSETCHANNELINPUTMASKID = FromDigits["90",16];
MESGSETCHANNELDATATYPEID = FromDigits["91",16];
MESGREADPINSFORSECTID = FromDigits["92",16];
MESGTIMERSELECTID = FromDigits["93",16];
MESGATODSETTINGSID = FromDigits["94",16];
MESGSETSHAREDADDRESSID = FromDigits["95",16];
MESGATODEXTERNALENABLEID = FromDigits["96",16];
MESGATODPINSETUPID = FromDigits["97",16];
MESGSETUPALARMID = FromDigits["98",16];
MESGALARMVARIABLEMODIFYTESTID = FromDigits["99",16];
MESGPARTIALRESETID = FromDigits["9A",16];
MESGOVERWRITETEMPCALID = FromDigits["9B",16];
MESGSERIALPASSTHRUSETTINGSID = FromDigits["9C",16];
MESGBISTID = FromDigits["AA",16];
MESGUNLOCKINTERFACEID = FromDigits["AD",16];
MESGSERIALERRORID = FromDigits["AE",16];
MESGSETIDSTRINGID = FromDigits["AF",16];
MESGPORTGETIOSTATEID = FromDigits["B4",16];
MESGPORTSETIOSTATEID = FromDigits["B5",16];
MESGRSSIID = FromDigits["C0",16];
MESGRSSIBROADCASTDATAID = FromDigits["C1",16];
MESGRSSIACKNOWLEDGEDDATAID = FromDigits["C2",16];
MESGRSSIBURSTDATAID = FromDigits["C3",16];
MESGRSSISEARCHTHRESHOLDID = FromDigits["C4",16];
MESGSLEEPID = FromDigits["C5",16];
MESGGETGRMNESNID = FromDigits["C6",16];
MESGSETUSBINFOID = FromDigits["C7",16];
MESGHCICOMMANDCOMPLETE = FromDigits["C8",16];

(* Event Response Codes *)
RESPONSENOERROR = FromDigits["00",16];
NOEVENT = FromDigits["00",16];
EVENTRXSEARCHTIMEOUT = FromDigits["01",16];
EVENTRXFAIL = FromDigits["02",16];
EVENTTX = FromDigits["03",16];
EVENTTRANSFERRXFAILED = FromDigits["04",16];
EVENTTRANSFERTXCOMPLETED = FromDigits["05",16];
EVENTTRANSFERTXFAILED = FromDigits["06",16];
EVENTCHANNELCLOSED = FromDigits["07",16];
EVENTRXFAILGOTOSEARCH = FromDigits["08",16];
EVENTCHANNELCOLLISION = FromDigits["09",16];
EVENTTRANSFERTXSTART = FromDigits["0A",16];          (*a pending transmit transfer has begun *)
EVENTCHANNELACTIVE = FromDigits["0F",16];
EVENTTRANSFERTXNEXTMESSAGE = FromDigits["11",16];           (* only enabled in FIT1*)
CHANNELINWRONGSTATE = FromDigits["15",16];           (* returned on attempt to perform an action from the wrong channel state *)
CHANNELNOTOPENED = FromDigits["16",16];           (* returned on attempt to communicate on a channel that is not open *)
CHANNELIDNOTSET = FromDigits["18",16];           (* returned on attempt to open a channel without setting the channel ID *)
CLOSEALLCHANNELS = FromDigits["19",16];           (* returned when attempting to start scanning mode, when channels are still open *)
TRANSFERINPROGRESS = FromDigits["1F",16];           (* returned on attempt to communicate on a channel with a TX transfer in progress *)
TRANSFERSEQUENCENUMBERERROR = FromDigits["20",16];           (* returned when sequence number is out of order on a Burst transfer *)
TRANSFERINERROR = FromDigits["21",16];
TRANSFERBUSY = FromDigits["22",16];
INVALIDMESSAGECRC = FromDigits["26",16];           (* returned if there is a framing error on an incomming message *)
MESSAGESIZEEXCEEDSLIMIT = FromDigits["27",16];           (* returned if a data message is provided that is too large *)
INVALIDMESSAGE = FromDigits["28",16];           (* returned when the message has an invalid parameter *)
INVALIDNETWORKNUMBER = FromDigits["29",16];           (* returned when an invalid network number is provided *)
INVALIDLISTID = FromDigits["30",16];           (* returned when the provided list ID or size exceeds the limit *)
INVALIDSCANTXCHANNEL = FromDigits["31",16];           (* returned when attempting to transmit on channel 0 when in scan mode *)
INVALIDPARAMETERPROVIDED = FromDigits["33",16];           (* returned when an invalid parameter is specified in a configuration message *)
EVENTSERIALQUEOVERFLOW = FromDigits["34",16];
EVENTQUEOVERFLOW = FromDigits["35",16];           (* ANT event que has overflowed and lost 1 or more events *)
EVENTCLKERROR = FromDigits["36",16];           (* debug event for XOSC16M on LE1 *)
EVENTSTATEOVERRUN = FromDigits["37",16];
SCRIPTFULLERROR = FromDigits["40",16];           (* error writing to script, memory is full *)
SCRIPTWRITEERROR = FromDigits["41",16];           (* error writing to script, bytes not written correctly *)
SCRIPTINVALIDPAGEERROR = FromDigits["42",16];           (* error accessing script page *)
SCRIPTLOCKEDERROR = FromDigits["43",16];           (* the scripts are locked and can't be dumped *)
NORESPONSEMESSAGE = FromDigits["50",16];           (* returned to the Command_SerialMessageProcess function, so no reply message is generated *)
RETURNTOMFG = FromDigits["51",16];           (* default return to any mesg when the module determines that the mfg procedure has not been fully completed *)
FITACTIVESEARCHTIMEOUT = FromDigits["60",16];           (* Fit1 only event added for timeout of the pairing state after the Fit module becomes active *)
FITWATCHPAIR = FromDigits["61",16];         (* Fit1 only *)
FITWATCHUNPAIR = FromDigits["62",16];           (* Fit1 only *)
USBSTRINGWRITEFAIL = FromDigits["70",16];

(* Internal only events below this point *)
INTERNALONLYEVENTS = FromDigits["80",16];
EVENTRX = FromDigits["80",16];           (* INTERNAL: Event for a receive message *)
EVENTNEWCHANNEL = FromDigits["81",16];           (* INTERNAL: EVENT for a new active channel *)
EVENTPASSTHRU = FromDigits["82",16];           (* INTERNAL: Event to allow an upper stack events to pass through lower stacks *)
EVENTBLOCKED = FromDigits["FF",16];           (* INTERNAL: Event to replace any event we do not wish to go out, will also zero the size of the Tx message *)
MESGDATASIZE = 7;

(* Simplified Event Codes *)
EVENTRXBROADCAST        = FromDigits["9A",16];          (* returned when module receives broadcast data *)
EVENTRXACKNOWLEDGED     = FromDigits["9B",16];          (* returned when module receives acknowledged data *)
EVENTRXBURSTPACKET      = FromDigits["9C",16];          (* returned when module receives burst data *)

EVENTRXEXTBROADCAST     = FromDigits["9D",16];          (* returned when module receives broadcast data *)
EVENTRXEXTACKNOWLEDGED  = FromDigits["9E",16];          (* returned when module receives acknowledged data *)
EVENTRXEXTBURSTPACKET   = FromDigits["9F",16];          (* returned when module receives burst data *)

EVENTRXRSSIBROADCAST    = FromDigits["A0",16];          (* returned when module receives broadcast data *)
EVENTRXRSSIACKNOWLEDGED = FromDigits["A1",16];          (* returned when module receives acknowledged data *)
EVENTRXRSSIBURSTPACKET  = FromDigits["A2",16];          (* returned when module receives burst data *)

EVENTRXFLAGBROADCAST    = FromDigits["A3",16];          (* returned when module receives broadcast data with flag attached *)
EVENTRXFLAGACKNOWLEDGED = FromDigits["A4",16];          (* returned when module receives acknowledged data with flag attached *)
EVENTRXFLAGBURSTPACKET  = FromDigits["A5",16];          (* returned when module receives burst data with flag attached *)

(* User Connection settings *)
USBDEVICENUM = 1; 
USERBAUDRATE = 57600;
(* ANT+ Managed Network Key. You *must* be an ANT Adopter and conform 
to all regulations to use this key to communicate on an ANT+ network. *)
USERNETWORKKEY = IntegerDigits[FromDigits["B9A521FBBD72C345", 16], 256];
USERNETWORKNUM = 1;
USERANTCHANNEL = 0;
USERCHANNELTYPE = 0;		(* slave *)
SDMDEVICENUM = 0;			(* wild-card *)
SDMDEVICETYPE = 0;			(* wild-card *)
SDMTRANSMISSIONTYPE = 0;	(* wild-card *)
SDMMESGPERIOD = 8134;		(* ~ 4 Hz *)
SDMRFFREQ = 57;				(* interpreted as (2400 + 57) *)
USERSEARCHTIMEOUT = 255;
$resetSuccessful = False;
$connected = False;

(* Device-specific parameters *)
$pageNumbers = Null;
$pageNames = Null;
$pageFields = Null;
$channelConfiguration = Null;
$deviceData = Null;
$currentDevice = Null;
$exampleDeviceData = {
	"Data Page Number (unit:N/A)" -> 2, 
	"Time - Fractional (unit:1/200 sec)" -> 117, 
	"Time - Integer (unit:Seconds (s))" -> 176, 
	"Distance - Integer (unit:meters (m))" -> 195, 
	"Distance - Fractional (unit:1/16 meters)" -> 32, 
	"Instantaneous Speed - Integer (unit:m/s)" -> 0, 
	"Instantaneous Speed - Fractional (unit:1/256 m/s)" -> 0, 
	"Stride Count (unit:Strides)" -> 124, 
	"Update Latency (unit:1/32 sec)" -> 61,
	"Reserved (unit:N/A)" -> 129,
	"Reserved (unit:N/A)" -> 129, 
	"Cadence - Integer (unit:Strides per Minute)" -> 0, 
	"Cadence - Fractional (unit:1/16 Strides per Minute)" -> 0, 
	"Reserved (unit:N/A)" -> 129, 
	"Status (unit:Binary)" -> {
		"SDM Location" -> "Midsole", 
		"Battery Status" -> "OK (New)",
		"SDM Health" -> "OK",
		"Use State" -> "Active"},
	"HW Revision (unit:N/A)" -> 239, 
	"Serial Number (Bits 0 - 7) (unit:N/A)" -> 1, 
	"Serial Number (Bits 8 - 15) (unit:N/A)" -> 0, 
	"Serial Number (Bits 16 - 23) (unit:N/A)" -> 23, 
	"Serial Number (Bits 24 - 31) (unit:N/A)" -> 39, 
	"SW Revision (unit:N/A)" -> 20, 
	"Manufacturer ID LSB (unit:N/A)" -> 6, 
	"Manufacturer ID MSB (unit:N/A)" -> 29, 
	"Model Number LSB (unit:N/A)" -> 54, 
	"Model Number MSB (unit:N/A)" -> 0};

Off[General::stop];


LoadANTLibrary[]:= 
(
	If[ !$libraryLoaded,
		antInit = LibraryFunctionLoad[ $libraryPath, "W_ANT_Init", {Integer,Integer}, Integer];
		antInitSpecial = LibraryFunctionLoad[ $libraryPath, "W_ANT_Init_Special", {Integer,Integer,Integer,Integer}, Integer];
		antClose = LibraryFunctionLoad[ $libraryPath, "W_ANT_Close", {}, "Void"];
		antLibVersion = LibraryFunctionLoad[ $libraryPath, "W_ANT_LibVersion", {}, "UTF8String"];
		antResetSystem = LibraryFunctionLoad[ $libraryPath, "W_ANT_ResetSystem", {}, "Boolean"];
		antSetNetworkKey = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetNetworkKey", {Integer, {Integer,1}}, "Boolean"];
		antSetNetworkKeyRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetNetworkKey_RTO", {Integer, {Integer,1}, Integer}, "Boolean"];
		antAssignChannel = LibraryFunctionLoad[ $libraryPath, "W_ANT_AssignChannel", {Integer,Integer,Integer}, "Boolean"];
    	antAssignChannelRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_AssignChannel_RTO", {Integer,Integer,Integer,Integer}, "Boolean"];
    	antAssignChannelExt = LibraryFunctionLoad[ $libraryPath, "W_ANT_AssignChannelExt", {Integer,Integer,Integer,Integer}, "Boolean"];
    	antAssignChannelExtRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_AssignChannelExt_RTO", {Integer,Integer,Integer,Integer}, "Boolean"];
    	antUnassignChannel = LibraryFunctionLoad[ $libraryPath, "W_ANT_UnassignChannel", {Integer}, "Boolean"];
    	antUnassignChannelRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_UnassignChannel_RTO", {Integer,Integer}, "Boolean"];
    	antSetChannelID = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetChannelID", {Integer,Integer,Integer,Integer}, "Boolean"];
    	antSetChannelIDRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetChannelID_RTO", {Integer,Integer,Integer,Integer,Integer}, "Boolean"];
    	antSetChannelPeriod = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetChannelPeriod", {Integer,Integer}, "Boolean"];
    	antSetChannelPeriodRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetChannelPeriod_RTO", {Integer,Integer,Integer}, "Boolean"];
    	antRSSISetSearchThreshold = LibraryFunctionLoad[ $libraryPath, "W_ANT_RSSI_SetSearchThreshold", {Integer,Integer}, "Boolean"];
    	antRSSISetSearchThresholdRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_RSSI_SetSearchThreshold_RTO", {Integer,Integer,Integer}, "Boolean"];
    	antSetLowPriorityChannelSearchTimeout = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetLowPriorityChannelSearchTimeout", {Integer,Integer}, "Boolean"];
    	antSetLowPriorityChannelSearchTimeoutRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetLowPriorityChannelSearchTimeout_RTO", {Integer,Integer,Integer}, "Boolean"];
		antSetChannelSearchTimeout = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetChannelSearchTimeout", {Integer,Integer}, "Boolean"];
		antSetChannelSearchTimeoutRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetChannelSearchTimeout_RTO", {Integer,Integer,Integer}, "Boolean"];
		antSetChannelRFFreq = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetChannelRFFreq", {Integer,Integer}, "Boolean"];
		antSetChannelRFFreqRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetChannelRFFreq_RTO", {Integer,Integer,Integer}, "Boolean"];
		antSetTransmitPower = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetTransmitPower", {Integer}, "Boolean"];
		antSetTransmitPowerRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetTransmitPower_RTO", {Integer,Integer}, "Boolean"];
		antSetChannelTxPower = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetChannelTxPower", {Integer,Integer}, "Boolean"];
		antSetChannelTxPowerRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetChannelTxPower_RTO", {Integer,Integer,Integer}, "Boolean"];
		antRequestMessage = LibraryFunctionLoad[ $libraryPath, "W_ANT_RequestMessage", {Integer,Integer}, "Boolean"];
		antWriteMessage = LibraryFunctionLoad[ $libraryPath, "W_ANT_WriteMessage", {Integer,Integer,Integer}, "Boolean"];
		antOpenChannel = LibraryFunctionLoad[ $libraryPath, "W_ANT_OpenChannel", {Integer}, "Boolean"];
		antOpenChannelRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_OpenChannel_RTO", {Integer,Integer}, "Boolean"];
		antCloseChannel = LibraryFunctionLoad[ $libraryPath, "W_ANT_CloseChannel", {Integer}, "Boolean"];
		antCloseChannelRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_CloseChannel_RTO", {Integer,Integer}, "Boolean"];
		antSendBroadcastData = LibraryFunctionLoad[ $libraryPath, "W_ANT_SendBroadcastData", {Integer,{Integer,1}}, "Boolean"];
		antSendAcknowledgedData = LibraryFunctionLoad[ $libraryPath, "W_ANT_SendAcknowledgedData", {Integer,{Integer,1}}, "Boolean"];
		antSendAcknowledgedDataRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SendAcknowledgedData_RTO", {Integer,{Integer,1},Integer}, "Boolean"];
		antSendBurstTransfer = LibraryFunctionLoad[ $libraryPath, "W_ANT_SendBurstTransfer", {Integer,{Integer,1},Integer}, "Boolean"];
		antSendBurstTransferRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SendBurstTransfer_RTO", {Integer,{Integer,1},Integer,Integer}, "Boolean"];
		antInitCWTestMode = LibraryFunctionLoad[ $libraryPath, "W_ANT_InitCWTestMode", {}, "Boolean"];
		antInitCWTestModeRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_InitCWTestMode_RTO", {Integer}, "Boolean"];
		antSetCWTestMode = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetCWTestMode", {Integer,Integer}, "Boolean"];
		antSetCWTestModeRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetCWTestMode_RTO", {Integer,Integer,Integer}, "Boolean"];
		antAddChannelID = LibraryFunctionLoad[ $libraryPath, "W_ANT_AddChannelID", {Integer,Integer,Integer,Integer,Integer}, "Boolean"];
		antAddChannelIDRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_AddChannelID_RTO", {Integer,Integer,Integer,Integer,Integer,Integer}, "Boolean"];
		antConfigList = LibraryFunctionLoad[ $libraryPath, "W_ANT_ConfigList", {Integer,Integer,Integer}, "Boolean"];
		antConfigListRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_ConfigList_RTO", {Integer,Integer,Integer,Integer}, "Boolean"];
		antOpenRxScanMode = LibraryFunctionLoad[ $libraryPath, "W_ANT_OpenRxScanMode", {}, "Boolean"];
		antOpenRxScanModeRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_OpenRxScanMode_RTO", {Integer}, "Boolean"];
		antConfigFrequencyAgility = LibraryFunctionLoad[ $libraryPath, "W_ANT_ConfigFrequencyAgility", {Integer,Integer,Integer,Integer}, "Boolean"];
		antConfigFrequencyAgilityRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_ConfigFrequencyAgility_RTO", {Integer,Integer,Integer,Integer,Integer}, "Boolean"];
		antSetProximitySearch = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetProximitySearch", {Integer,Integer}, "Boolean"];
		antSetProximitySearchRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetProximitySearch_RTO", {Integer,Integer,Integer}, "Boolean"];
		antSleepMessage = LibraryFunctionLoad[ $libraryPath, "W_ANT_SleepMessage", {}, "Boolean"];
		antSleepMessageRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SleepMessage_RTO", {Integer}, "Boolean"];
		antCrystalEnable = LibraryFunctionLoad[ $libraryPath, "W_ANT_CrystalEnable", {}, "Boolean"];
		antCrystalEnableRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_CrystalEnable_RTO", {Integer}, "Boolean"];
		antNVMWrite = LibraryFunctionLoad[ $libraryPath, "W_ANT_NVM_Write", {Integer,{Integer,1}}, "Boolean"];
		antNVMWriteRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_NVM_Write_RTO", {Integer,{Integer,1},Integer}, "Boolean"];
		antNVMClear = LibraryFunctionLoad[ $libraryPath, "W_ANT_NVM_Clear", {Integer}, "Boolean"];
		antNVMClearRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_NVM_Clear_RTO", {Integer,Integer}, "Boolean"];
		antNVMSetDefaultSector = LibraryFunctionLoad[ $libraryPath, "W_ANT_NVM_SetDefaultSector", {Integer}, "Boolean"];
		antNVMSetDefaultSectorRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_NVM_SetDefaultSector_RTO", {Integer,Integer}, "Boolean"];
		antNVMEndSector = LibraryFunctionLoad[ $libraryPath, "W_ANT_NVM_EndSector", {}, "Boolean"];
		antNVMEndSectorRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_NVM_EndSector_RTO", {Integer}, "Boolean"];
		antNVMDump = LibraryFunctionLoad[ $libraryPath, "W_ANT_NVM_Dump", {}, "Boolean"];
		antNVMDumpRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_NVM_Dump_RTO", {Integer,Integer}, "Boolean"];
		antNVMLock = LibraryFunctionLoad[ $libraryPath, "W_ANT_NVM_Lock", {}, "Boolean"];
		antNVMLockRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_NVM_Lock_RTO", {Integer}, "Boolean"];
		fitSetFEState = LibraryFunctionLoad[ $libraryPath, "W_FIT_SetFEState", {Integer}, "Boolean"];
		fitSetFEStateRTO = LibraryFunctionLoad[ $libraryPath, "W_FIT_SetFEState_RTO", {Integer,Integer}, "Boolean"];
		fitAdjustPairingSettings = LibraryFunctionLoad[ $libraryPath, "W_FIT_AdjustPairingSettings", {Integer,Integer,Integer}, "Boolean"];
		fitAdjustPairingSettingsRTO = LibraryFunctionLoad[ $libraryPath, "W_FIT_AdjustPairingSettings_RTO", {Integer,Integer,Integer,Integer}, "Boolean"];
		antSendExtBroadcastData = LibraryFunctionLoad[ $libraryPath, "W_ANT_SendExtBroadcastData", {Integer,{Integer,1}}, "Boolean"];
		antSendExtAcknowledgedData = LibraryFunctionLoad[ $libraryPath, "W_ANT_SendExtAcknowledgedData", {Integer,{Integer,1},Integer}, "Boolean"];
		antSendExtAcknowledgedDataRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SendExtAcknowledgedData_RTO", {Integer,{Integer,1},Integer,Integer}, "Boolean"];
		antSendExtBurstTransfer = LibraryFunctionLoad[ $libraryPath, "W_ANT_SendExtBurstTransfer", {Integer,{Integer,1},Integer}, "Boolean"];
		antSendExtBurstTransferRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SendExtBurstTransfer_RTO", {Integer,{Integer,1},Integer,Integer}, "Boolean"];
		antSendExtBurstTransferPacket = LibraryFunctionLoad[ $libraryPath, "W_ANT_SendExtBurstTransferPacket", {Integer,{Integer,1}}, "Boolean"];
		antRxExtMesgsEnable = LibraryFunctionLoad[ $libraryPath, "W_ANT_RxExtMesgsEnable", {Integer}, "Boolean"];
		antRxExtMesgsEnableRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_RxExtMesgsEnable_RTO", {Integer,Integer}, "Boolean"];
		antSetSerialNumChannelID = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetSerialNumChannelId", {Integer,Integer,Integer}, "Boolean"];
		antSetSerialNumChannelIDRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_SetSerialNumChannelID_RTO", {Integer,Integer,Integer,Integer}, "Boolean"];
		antEnableLED = LibraryFunctionLoad[ $libraryPath, "W_ANT_EnableLED", {Integer}, "Boolean"];
		antEnableLEDRTO = LibraryFunctionLoad[ $libraryPath, "W_ANT_EnableLED_RTO", {Integer,Integer}, "Boolean"];
		
		antGetDeviceUSBInfo = LibraryFunctionLoad[ $libraryPath, "W_ANT_GetDeviceUSBInfo", LinkObject, LinkObject];
		antGetDeviceUSBPID = LibraryFunctionLoad[ $libraryPath, "W_ANT_GetDeviceUSBPID", LinkObject, LinkObject]; 
		antGetDeviceUSBVID = LibraryFunctionLoad[ $libraryPath, "W_ANT_GetDeviceUSBVID", LinkObject, LinkObject];
		
		antfsInitEEPROMDevice = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_InitEEPROMDevice", {Integer,Integer}, "Boolean"];
		antfsInitFSMemory = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_InitFSMemory", {}, "Boolean"];
		antfsFormatFSMemory = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FormatFSMemory", {Integer,Integer}, "Boolean"];
		antfsSaveDirectory = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_SaveDirectory", {}, "Boolean"];
		antfsDirectoryRebuild = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_DirectoryRebuild", {}, "Boolean"];
		antfsFileDelete = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FileDelete", {Integer}, "Boolean"];
		antfsFileClose = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FileClose", {Integer}, "Boolean"];
		antfsSetFileSpecificFlags = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_SetFileSpecificFlags", {Integer,Integer}, "Boolean"];
		antfsDirectoryReadLock = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_DirectoryReadLock", {"Boolean"}, Integer];
		antfsSetSystemTime = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_SetSystemTime", {Integer}, "Boolean"];
		antfsGetUsedSpace = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_GetUsedSpace", {}, Integer];
		antfsGetFreeSpace = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_GetFreeSpace", {}, Integer];
		antfsFindFileIndex = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FindFileIndex", {Integer,Integer,Integer}, Integer];
		antfsReadDirectoryAbsolute = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_ReadDirectoryAbsolute", {Integer,Integer,{Integer,1}}, Integer];
		antfsDirectoryReadEntry = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_DirectoryReadEntry", {Integer,{Integer,1}}, Integer];
		antfsDirectoryGetSize = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_DirectoryGetSize", {}, Integer];
		antfsFileCreate = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FileCreate", {Integer,Integer,Integer,Integer,Integer}, Integer];
		antfsFileOpen = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FileOpen", {Integer,Integer}, Integer];
		antfsFileReadAbsolute = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FileReadAbsolute", {Integer,Integer,Integer,{Integer,1}}, Integer];
		antfsFileReadRelative = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FileReadRelative", {Integer,Integer,{Integer,1}}, Integer];
		antfsFileWriteAbsolute = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FileWriteAbsolute", {Integer,Integer,Integer,{Integer,1},{Integer,1}}, Integer];
		antfsFileWriteRelative = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FileWriteRelative", {Integer,Integer,{Integer,1},{Integer,1}}, Integer];
		antfsFileGetSize = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FileGetSize", {Integer}, Integer];
		antfsFileGetSizeInMem = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FileGetSizeInMem", {Integer}, Integer];
		antfsFileGetSpecificFlags = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FileGetSpecificFlags", {Integer}, Integer];
		antfsFileGetSystemTime = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FileGetSystemTime", {}, Integer];
		antfsCryptoAddUserKeyIndex = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_CryptoAddUserKeyIndex", {Integer,{Integer,1}}, Integer];
		antfsCryptoSetUserKeyIndex = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_CryptoSetUserKeyIndex", {Integer}, Integer];
		antfsCryptoSetUserKeyVal = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_CryptoSetUserKeyVal", {{Integer,1}}, Integer];
		antfsFitFileIntegrityCheck = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_FitFileIntegrityCheck", {Integer}, Integer];
		antfsOpenBeacon = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_OpenBeacon", {}, Integer];
		antfsCloseBeacon = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_CloseBeacon", {}, Integer];
		antfsConfigBeacon = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_ConfigBeacon", {Integer,Integer,Integer,Integer}, Integer];
		antfsSetFriendlyName = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_SetFriendlyName", {Integer,{Integer,1}}, Integer];
		antfsSetPasskey = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_SetPasskey", {Integer,{Integer,1}}, Integer];
		antfsSetBeaconState = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_SetBeaconState", {Integer}, Integer];
		antfsPairResponse = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_PairResponse", {"Boolean"}, Integer];
		antfsSetLinkFrequency = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_SetLinkFrequency", {Integer,Integer}, Integer];
		antfsSetBeaconTimeout = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_SetBeaconTimeout", {Integer}, Integer];
		antfsSetPairingTimeout = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_SetPairingTimeout", {Integer}, Integer];
		antfsEnableRemoteFileCreate = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_EnableRemoteFileCreate", {"Boolean"}, Integer];
		antfsGetCmdPipe = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_GetCmdPipe", {Integer,Integer,{Integer,1}}, Integer];
		antfsSetCmdPipe = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_SetCmdPipe", {Integer,Integer,{Integer,1}}, Integer];
		antfsGetLastError = LibraryFunctionLoad[ $libraryPath, "W_ANTFS_GetLastError", {}, "Boolean"];
		antNap = LibraryFunctionLoad[ $libraryPath, "W_ANT_Nap", {Integer}, "Void"];
		
		If[Head[antInit] != LibraryFunction, Message[LoadANTLibrary::badfunc];Return@$Failed];
		If[Head[antInitSpecial] != LibraryFunction, Message[LoadANTLibrary::badfunc];Return@$Failed];
		If[Head[antAssignResponseFunction] != LibraryFunction, Message[LoadANTLibrary::badfunc];Return@$Failed];
		If[Head[antAssignResponseFunction] != LibraryFunction, Message[LoadANTLibrary::badfunc];Return@$Failed];
		If[Head[antAssignChannelEventFunction] != LibraryFunction, Message[LoadANTLibrary::badfunc];Return@$Failed];
		If[Head[antUnassignAllResponseFunctions] != LibraryFunction, Message[LoadANTLibrary::badfunc];Return@$Failed];
		If[Head[antLibVersion] != LibraryFunction, Message[LoadANTLibrary::badfunc];Return@$Failed];
		If[Head[antResetSystem] != LibraryFunction, Message[LoadANTLibrary::badfunc];Return@$Failed];
		If[Head[antSetNetworkKey] != LibraryFunction, Message[LoadANTLibrary::badfunc];Return@$Failed];
		If[Head[antAssignChannel] != LibraryFunction, Message[LoadANTLibrary::badfunc];Return@$Failed];
		If[Head[antAssignChannelExt] != LibraryFunction, Message[LoadANTLibrary::badfunc];Return@$Failed];
		If[Head[antAssignChannelExtRTO] != LibraryFunction, Message[LoadANTLibrary::badfunc];Return@$Failed];
		(* And so on.... find a better solution? *)
		
		
		(* Create the asynchronous task for getting events. *)
		
		$libraryLoaded = True;
		ANTInit[USBDEVICENUM, USERBAUDRATE];,
		Message[LoadANTLibrary::loaded];
	]
)

ANTInit[ucUSBDeviceNum_, ulBaudrate_] :=
	Module[{(*counter, numRetries*)},
		Internal`CreateAsynchronousTask[antInit, {ucUSBDeviceNum, ulBaudrate}, eventHandler];
	
		ANTAssignResponseFunction[myResponseFunction];
		ANTAssignChannelEventFunction[USERANTCHANNEL, myChannelEventFunction];
		(*
		numRetries = 5;
  		For[counter = 0, counter < numRetries && ! $resetSuccessful, counter++,
   			If[! ANTResetSystem[],
   				Break[]
   			];
   			ANTNap[1000];
   		];
   		*)
	];
	
ANTInitSpecial[ucUSBDeviceNum_, ulBaudrate_, ucPortType_, ucSerialFramerType_] := 
	Internal`CreateAsynchronousTask[antInitSpecial, {ucUSBDeviceNum, ulBaudrate, ucPortType, ucSerialFramerType}, eventHandler];

ANTClose[] :=
	antClose[]

ANTAssignResponseFunction[pfResponse_] :=
	Module[{},
		ResponseFunction = pfResponse;
	]

ANTAssignChannelEventFunction[ucLink_, pfLinkEvent_] :=
	Module[{},
		ChannelEventFunctions[[ucLink]] = pfLinkEvent;
	]

ANTUnassignAllResponseFunctions[] :=
	Module[{},
		ResponseFunction = None;
		ChannelEventFunctions = Table[None, {8}];
	]

ANTLibVersion[] :=
	antLibVersion[]

ANTResetSystem[] :=
	antResetSystem[]

ANTSetNetworkKey[ucNetNumber_, listKey_] :=
	antSetNetworkKey[ucNetNumber, listKey];

ANTSetNetworkKeyRTO[ucNetNumber_, listKey_, ulResponseTime_] :=
	antSetNetworkKeyRTO[ucNetNumber, listKey, ulResponseTime];

ANTAssignChannel[ucANTChannel_, ucChanType_, ucNetNumber_] :=
	antAssignChannel[ucANTChannel, ucChanType, ucNetNumber];

ANTAssignChannelRTO[ucANTChannel_, ucChanType_, ucNetNumber_, ulResponseTime_] :=
	antAssignChannelRTO[ucANTChannel,ucChanType, ucNetNumber, ulResponseTime];

ANTAssignChannelExt[ucANTChannel_, ucChanType_, ucNetNumber_, ucExtFlags_] :=
	antAssignChannelExt[ucANTChannel, ucChanType, ucNetNumber, ucExtFlags];

ANTAssignChannelExtRTO[ucANTChannel_, ucChanType_, ucNetNumber_, ucExtFlags_, ulResponseTime_] :=
	antAssignChannelExtRTO[ucANTChannel, ucChanType, ucNetNumber, ucExtFlags, ulResponseTime];

ANTUnassignChannel[ucANTChannel_] :=
	antUnassignChannel[ucANTChannel];

ANTUnassignChannelRTO[ucANTChannel_, ulResponseTime_] :=
	antUnassignChannelRTO[ucANTChannel, ulResponseTime];

ANTSetChannelID[ucANTChannel_, usDeviceNumber_, ucDeviceType_, ucTransmissionType_] :=
	antSetChannelID[ucANTChannel, usDeviceNumber, ucDeviceType, ucTransmissionType];

ANTSetChannelIDRTO[ucANTChannel_, usDeviceNumber_, ucDeviceType_, ucTransmissionType_, ulResponseTime_] :=
	antSetChannelIDRTO[ucANTChannel, usDeviceNumber, ucDeviceType, ucTransmissionType, ulResponseTime];

ANTSetChannelPeriod[ucANTChannel_, usMesgPeriod_] :=
	antSetChannelPeriod[ucANTChannel, usMesgPeriod];

ANTSetChannelPeriodRTO[ucANTChannel_, usMesgPeriod_, ulResponseTime_] :=
	antSetChannelPeriodRTO[ucANTChannel, usMesgPeriod, ulResponseTime];

ANTRSSISetSearchThreshold[ucANTChannel_,ucThreshold_] :=
	antRSSISetSearchThreshold[ucANTChannel, ucThreshold];

ANTRSSISetSearchThresholdRTO[ucANTChannel_, ucThreshold_, ulResponseTime_] :=
	antRSSISetSearchThresholdRTO[ucANTChannel, ucThreshold, ulResponseTime];

ANTSetLowPriorityChannelSearchTimeout[ucANTChannel_, ucSearchTimeout_ ] :=
	antSetLowPriorityChannelSearchTimeout[ucANTChannel, ucSearchTimeout];

ANTSetLowPriorityChannelSearchTimeoutRTO[ucANTChannel_, ucSearchTimeout_, ulResponseTime_] :=
	antSetLowPriorityChannelSearchTimeoutRTO[ucANTChannel, ucSearchTimeout, ulResponseTime];
	
ANTSetChannelSearchTimeout[ucANTChannel_, ucSearchTimeout_] :=
	antSetChannelSearchTimeout[ucANTChannel, ucSearchTimeout];
		
ANTSetChannelSearchTimeoutRTO[ucANTChannel_, ucSearchTimeout_, ulResponseTime_] :=
	antSetChannelSearchTimeoutRTO[ucANTChannel, ucSearchTimeout, ulResponseTime];
		
ANTSetChannelRFFreq[ucANTChannel_, ucRFFreq_] :=
	antSetChannelRFFreq[ucANTChannel, ucRFFreq];
		
ANTSetChannelRFFreqRTO[ucANTChannel_, ucRFFreq_, ulResponseTime_] :=	
	antSetChannelRFFreqRTO[ucANTChannel, ucRFFreq, ulResponseTime];
		
ANTSetTransmitPower[ucTransmitPower_] :=		
	antSetTransmitPower[ucTransmitPower];
		
ANTSetTransmitPowerRTO[ucTransmitPower_, ulResponseTime_] :=
	antSetTransmitPowerRTO[ucTransmitPower, ulResponseTime];
		
ANTSetChannelTxPower[ucANTChannel_, ucTransmitPower_] :=
	antSetChannelTxPower[ucANTChannel, ucTransmitPower];
		
ANTSetChannelTxPowerRTO[ucANTChannel_, ucTransmitPower_, ulResponseTime_] :=
	antSetChannelTxPowerRTO[ucANTChannel, ucTransmitPower, ulResponseTime];

ANTRequestMessage[ucANTChannel_, ucMessageID_] :=
	antRequestMessage[ucANTChannel, ucMessageID];

ANTWriteMessage[ucMessageID_, aucData_, usMessageSize_] :=
	antWriteMessage[ucMessageID, aucData, usMessageSize];

ANTOpenChannel[ucANTChannel_] :=
	antOpenChannel[ucANTChannel];

ANTOpenChannelRTO[ucANTChannel_, ulResponseTime_] :=
	antOpenChannelRTO[ucANTChannel, ulResponseTime];

ANTCloseChannel[ucANTChannel_] := 
	antCloseChannel[ucANTChannel];

ANTCloseChannelRTO[ucANTChannel_, ulResponseTime_] :=
	antCloseChannelRTO[ucANTChannel, ulResponseTime];

ANTSendBroadcastData[ucANTChannel_, pucData_] :=
	antSendBroadcastData[ucANTChannel, pucData];
		
ANTSendAcknowledgedData[ucANTChannel_, pucData_] :=
	antSendAcknowledgedData[ucANTChannel, pucData];

ANTSendAcknowledgedDataRTO[ucANTChannel_, pucData_, ulResponseTime_] :=
	antSendAcknowledgedDataRTO[ucANTChannel, pucData, ulResponseTime];

ANTSendBurstTransfer[ucANTChannel_, pucData_, usNumDataPackets_] :=
	antSendBurstTransfer[ucANTChannel, pucData, usNumDataPackets];

ANTSendBurstTransferRTO[ucANTChannel_, pucData_, usNumDataPackets_, ulResponseTime_] :=
	antSendBurstTransferRTO[ucANTChannel, pucData, usNumDataPackets, ulResponseTime];

ANTInitCWTestMode[] :=
	antInitCWTestMode[];

ANTInitCWTestModeRTO[ulResponseTime_] :=
	antInitCWTestModeRTO[ulResponseTime];

ANTSetCWTestMode[ucANTChannel_, ucRFChannel_] :=
	antSetCWTestMode[ucANTChannel, ucRFChannel];

ANTSetCWTestModeRTO[ucANTChannel_, ucRFChannel_, ulResponseTime_] :=
	antSetCWTestModeRTO[ucANTChannel, ucRFChannel, ulResponseTime];

ANTAddChannelID[ucANTChannel_, usDeviceNumber_, ucDeviceType_, ucTransmissionType_, ucListIndex_] :=
	antAddChannelID[ucANTChannel, usDeviceNumber, ucDeviceType, ucTransmissionType, ucListIndex];

ANTAddChannelIDRTO[ucANTChannel_, usDeviceNumber_, ucDeviceType_, ucTransmissionType_, ucListIndex_, ulResponseTime_] :=
	antAddChannelIDRTO[ucANTChannel, usDeviceNumber, ucDeviceType, ucTransmissionType, ucListIndex, ulResponseTime];

ANTConfigList[ucANTChannel_, ucListSize_, ucExclude_] :=
	antConfigList[ucANTChannel, ucListSize, ucExclude];

ANTConfigListRTO[ucANTChannel_, ucListSize_, ucExclude_, ulResponseTime_] :=
	antConfigListRTO[ucANTChannel, ucListSize, ucExclude, ulResponseTime];

ANTOpenRxScanMode[] :=
	antOpenRxScanMode[];

ANTOpenRxScanModeRTO[ulResponseTime_] :=
	antOpenRxScanModeRTO[ulResponseTime];

ANTConfigFrequencyAgility[ucANTChannel_, ucFreq1_, ucFreq2_, ucFreq3_] :=
	antConfigFrequencyAgility[ucANTChannel, ucFreq1, ucFreq2, ucFreq3];

ANTConfigFrequencyAgilityRTO[ucANTChannel_, ucFreq1_, ucFreq2_, ucFreq3_, ulResponseTime_] :=
	antConfigFrequencyAgilityRTO[ucANTChannel1, ucFreq1, ucFreq2, ucFreq3, ulResponseTime];

ANTSetProximitySearch[ucANTChannel_, ucSearchThreshold_] :=
	antSetProximitySearch[ucANTChannel, ucSearchThreshold];

ANTSetProximitySearchRTO[ucANTChannel_, ucSearchThreshold_, ulResponseTime_] :=
	antSetProximitySearchRTO[ucANTChannel, ucSearchThreshold, ulResponseTime];

ANTSleepMessage[] :=
	antSleepMessage[];

ANTSleepMessageRTO[ulResponseTime_] :=
	antSleepMessageRTO[ulResponseTime];

ANTCrystalEnable[] :=
	antCrystalEnable[];

ANTCrystalEnableRTO[ulResponseTime_] :=
	antCrystalEnableRTO[ulResponseTime];

ANTNVMWrite[ucSize_, pucData_] :=
	antNVMWrite[ucSize, pucData];

ANTNVMWriteRTO[ucSize_, pucData_,ulResponseTime_] :=
	antNVMWriteRTO[ucSize, pucData,ulResponseTime];

ANTNVMClear[ucSectNumber_] :=
	antNVMClear[ucSectNumber];

ANTNVMClearRTO[ucSectNumber_, ulResponseTime_] :=
	antNVMClearRTO[ucSectNumber, ulResponseTime];

ANTNVMSetDefaultSector[ucSectNumber_] :=
	antNVMSetDefaultSector[ucSectNumber];

ANTNVMSetDefaultSectorRTO[ucSectNumber_, ulResponseTime_] :=
	antNVMSetDefaultSectorRTO[ucSectNumber, ulResponseTime];

ANTNVMEndSector[] :=
	antNVMEndSector[];

ANTNVMEndSectorRTO[ulResponseTime_] :=
	antNVMEndSectorRTO[ulResponseTime];

ANTNVMDump[] :=
	antNVMDump[];

ANTNVMDumpRTO[ulResponseTime_] :=
	antNVMDumpRTO[ulResponseTime];

ANTNVMLock[] :=
	antNVMLock[];

ANTNVMLockRTO[ulResponseTimeout_] :=
	antNVMLockRTO[ulResponseTimeout];

FITSetFEState[ucFEState_] :=
	fitSetFEState[ucFEState];

FITSetFEStateRTO[ucFEState_, ulResponseTime_] :=
	fitSetFEStateRTO[ucFEState, ulResponseTime];

FITAdjustPairingSettings[cSearchLv_, ucPairLv_, ucTrackLv_] :=
	fitAdjustPairingSettings[cSearchLv, ucPairLv, ucTrackLv];

FITAdjustPairingSettingsRTO[cSearchLv_, ucPairLv_, ucTrackLv_, ulResponseTime_] :=
	fitAdjustPairingSettingsRTO[cSearchLv, ucPairLv, ucTrackLv, ulResponseTime];
	
ANTSendExtBroadcastData[ucANTChannel_, pucData_] :=
	antSendExtBroadcastData[ucANTChannel, pucData];
	
ANTSendExtAcknowledgedData[ucANTChannel_, pucData_] :=
	antSendExtAcknowledgedData[ucANTChannel, pucData];

ANTSendExtAcknowledgedDataRTO[ucANTChannel_, pucData_, ulResponseTime_] :=
	antSendExtAcknowledgedDataRTO[ucANTChannel, pucData, ulResponseTime];

ANTSendExtBurstTransfer[ucANTChannel_, pucData_, usNumDataPackets_] :=
	antSendExtBurstTransfer[ucANTChannel, pucData, usNumDataPackets];

ANTSendExtBurstTransferRTO[ucANTChannel_, pucData_, usNumDataPackets_, ulResponseTime_] :=
	antSendExtBurstTransferRTO[ucANTChannel, pucData, usNumDataPackets, ulResponseTime];

ANTSendExtBurstTransferPacket[ucANTChannelSeq_, pucData_] :=
	antSendExtBurstTransferPacket[ucANTChannelSeq, pucData];

ANTRxExtMesgsEnable[ucEnable_] :=
	antRxExtMesgsEnable[ucEnable];

ANTRxExtMesgsEnableRTO[ucEnable_, ulResponseTimeout_] :=
	antRxExtMesgsEnableRTO[ucEnable, ulResponseTimeout];

ANTSetSerialNumChannelID[ucANTChannel_, ucDeviceType_, ucTransmissionType_] :=
	antSetSerialNumChannelID[ucANTChannel, ucDeviceType, ucTransmissionType];

ANTSetSerialNumChannelIDRTO[ucANTChannel_, ucDeviceType_, ucTransmissionType_, ulResponseTime_] :=
	antSetSerialNumChannelIDRTO[ucANTChannel, ucDeviceType, ucTransmissionType, ulResponseTime];

ANTEnableLED[ucEnable_] :=
	antEnableLED[ucEnable];

ANTEnableLEDRTO[ucEnable_, ulResponseTime_] :=
	antEnableLEDRTO[ucEnable, ulResponseTime];

ANTGetDeviceUSBInfo[ucDeviceNum_] :=
	antGetDeviceUSBInfo[ucDeviceNum];

ANTGetDeviceUSBPID[] :=
	antGetDeviceUSBPID[];

ANTGetDeviceUSBVID[] :=
	antGetDeviceUSBVID[];

ANTFSInitEEPROMDevice[usPageSize_, ucAddressConfig_] :=
	antfsInitEEPROMDevice[usPageSize, ucAddressConfig];

ANTFSInitFSMemory[] :=
	antfsInitFSMemory[];

ANTFSFormatFSMemory[usNumberOfSectors_, usPagesPerSector_] :=
	antfsFormatFSMemory[usNumberOfSectors, usPagesPerSector];

ANTFSSaveDirectory[] :=
	antfsSaveDirectory[];

ANTFSDirectoryRebuild[] :=
	antfsDirectoryRebuild[];

ANTFSFileDelete[ucFileHandle_] :=
	antfsFileDelete[ucFileHandle];

ANTFSFileClose[ucFileHandle_] :=
	antfsFileClose[ucFileHandle];

ANTFSSetFileSpecificFlags[ucFileHandle_, ucFlags_] :=
	antfsSetFileSpecificFlags[ucFileHandle, ucFlags];

ANTFSDirectoryReadLock[bLock_] :=
	antfsDirectoryReadLock[bLock];

ANTFSSetSystemTime[ulTime_] :=
	antfsSetSystemTime[ulTime];

ANTFSGetUsedSpace[] :=
	antfsGetUsedSpace[];

ANTFSGetFreeSpace[] :=
	antfsGetFreeSpace[];

ANTFSFindFileIndex[ucFileDataType_, ucFileSubType_, usFileNumber_] :=
	antfsFindFileIndex[ucFileDataType, ucFileSubType, usFileNumber];

ANTFSReadDirectoryAbsolute[ulOffset_,ucSize_, pucBuffer_] :=
	antfsReadDirectoryAbsolute[ulOffset,ucSize, pucBuffer];

ANTFSDirectoryReadEntry[usFileIndex_, ucFileDirectoryBuffer_] :=
	antfsDirectoryReadEntry[usFileIndex, ucFileDirectoryBuffer];

ANTFSDirectoryGetSize[] :=
	antfsDirectoryGetSize[];

ANTFSFileCreate[usFileIndex_, ucFileDataType_, ulFileIdentifier_, ucFileDataTypeSpecificFlags_, ucGeneralFlags_] :=
	antfsFileCreate[usFileIndex, ucFileDataType, ulFileIdentifier, ucFileDataTypeSpecificFlags, ucGeneralFlags];

ANTFSFileOpen[usFileIndex_, ucFileDataType_] :=
	antfsFileOpen[usFileIndex, ucFileDataType];

ANTFSFileReadAbsolute[ucFileHandle_, ulOffset_,ucReadSize_, pucReadBuffer_] :=
	antfsFileReadAbsolute[ucFileHandle, ulOffset,ucReadSize, pucReadBuffer];

ANTFSFileReadRelative[ucFileHandle_, ucReadSize_, pucReadBuffer_] :=
	antfsFileReadRelative[ucFileHandle, ucReadSize, pucReadBuffer];

ANTFSFileWriteAbsolute[ucFileHandle_, ulFileOffset_,ucWriteSize_, pucWriteBuffer_, pucBytesWritten_] :=
	antfsFileWriteAbsolute[ucFileHandle, ulFileOffset,ucWriteSize, pucWriteBuffer, pucBytesWritten];

ANTFSFileWriteRelative[ucFileHandle_, ucWriteSize_, pucWriteBuffer_, pucBytesWritten_] :=
	antfsFileWriteRelative[ucFileHandle, ucWriteSize, pucWriteBuffer, pucBytesWritten];

ANTFSFileGetSize[ucFileHandle_] :=
	antfsFileGetSize[ucFileHandle];

ANTFSFileGetSizeInMem[ucFileHandle_] :=
	antfsFileGetSizeInMem[ucFileHandle];

ANTFSFileGetSpecificFlags[ucFileHandle_] :=
	antfsFileGetSpecificFlags[ucFileHandle];

ANTFSFileGetSystemTime[] :=
	antfsFileGetSystemTime[];

ANTFSCryptoAddUserKeyIndex[ucIndex_, pucKey_] :=
	antfsCryptoAddUserKeyIndex[ucIndex, pucKey];

ANTFSCryptoSetUserKeyIndex[ucIndex_] :=
	antfsCryptoSetUserKeyIndex[ucIndex];

ANTFSCryptoSetUserKeyVal[pucKey_] :=
	antfsCryptoSetUserKeyVal[pucKey];

ANTFSFitFileIntegrityCheck[ucFileHandle_] :=
	antfsFitFileIntegrityCheck[ucFileHandle];

ANTFSOpenBeacon[] :=
	antfsOpenBeacon[];

ANTFSCloseBeacon[] :=
	antfsCloseBeacon[];

ANTFSConfigBeacon[usDeviceType_, usManufacturer_, ucAuthType_, ucBeaconStatus_] :=
	antfsConfigBeacon[usDeviceType, usManufacturer, ucAuthType, ucBeaconStatus];

ANTFSSetFriendlyName[ucLength_, pucString_] :=
	antfsSetFriendlyName[ucLength, pucString];

ANTFSSetPasskey[ucLength_, pucString_] :=
	antfsSetPasskey[ucLength, pucString];

ANTFSSetBeaconState[ucBeaconStatus_] :=
	antfsSetBeaconState[ucBeaconStatus];

ANTFSPairResponse[bAccept_] :=
	antfsPairResponse[bAccept];

ANTFSSetLinkFrequency[ucChannelNumber_, ucFrequency_] :=
	antfsSetLinkFrequency[ucChannelNumber, ucFrequency];

ANTFSSetBeaconTimeout[ucTimeout_] :=
	antfsSetBeaconTimeout[ucTimeout];

ANTFSSetPairingTimeout[ucTimeout_] :=
	antfsSetPairingTimeout[ucTimeout];

ANTFSEnableRemoteFileCreate[bEnable_] :=
	antfsEnableRemoteFileCreate[bEnable];

ANTFSGetCmdPipe[ucOffset_, ucReadSize_, pucReadBuffer_] :=
	antfsGetCmdPipe[ucOffset, ucReadSize, pucReadBuffer];

ANTFSSetCmdPipe[ucOffset_, ucWriteSize_, pucWriteBuffer_] :=
	antfsSetCmdPipe[ucOffset, ucWriteSize, pucWriteBuffer];

ANTFSGetLastError[] :=
	antfsGetLastError[];

ANTNap[ulMilliseconds_] :=
	antNap[ulMilliseconds];

ANTDeviceConnect[deviceProfileType_String] :=
	Module[{profileXML,longName,pages},
		If[$deviceData === Null && $libraryLoaded,
			$deviceData = {};
			longName = Null;
			Switch[deviceProfileType,
				"SDM",
					longName = "stride_based_speed_and_distance";
					$currentDevice = "SDM";,
				"BPowM",
					longName = "bicycle_power";
					$currentDevice = "BPowM";,
				"HRM",
					longName = "heart_rate";
					$currentDevice = "HRM";,
				"BPressM",
					longName = "blood_pressure";
					$currentDevice = "BPressM";,
				"ENVM",
					longName = "environment";
					$currentDevice = "ENVM";,
				"BSCM",
					longName = "bike_speed_and_cadence";
					$currentDevice = "BSCM";,
				"MSM",
					longName = "multi-sport_speed_and_distance";
					$currentDevice = "MSM";,
				_,
					longName = Null;
			];
			If[longName =!= Null,
				profileXML = Import[FileNameJoin[{"ANTConnector","DeviceProfiles",longName <> ".xml"}]];
				$channelConfiguration = (#[[1]]->#[[3,1]])&/@Cases[profileXML, XMLElement["ChannelConfiguration", _, _], Infinity][[1,3]];
				updateChannelConfiguration[$channelConfiguration];
				pages = Cases[profileXML, XMLElement["Page", _, _], Infinity][[All,3]];
				$pageNumbers = pages[[All,1,3,1]];
				$pageNames = pages[[All,2,3,1]];
				$pageFields = 
					Map[
						Map[
							If[#[[1]]!="Bits",
								#[[1]]->#[[3,1]],
								#[[1]]->
									Map[#[[1]]->
										Map[
											If[#[[1]] != "Enumerations",
												#[[1]]->#[[3,1]],
												#[[1]]->
												Map[#[[3,1,3,1]]->#[[3,2,3,1]]&,
												#[[3]]]
											]&,
										#[[3]]]&,
									#[[3]]]
							]&,
						#[[3]]]&,
						Cases[#,XMLElement["Field", _, _], Infinity]&/@pages,
					{2}];,
				Return@$Failed;
			];
			ANTSetNetworkKey[USERANTCHANNEL,USERNETWORKKEY];
		];
	];

ANTDeviceDisconnect[] :=
	Module[{},
		ANTCloseChannel[USERANTCHANNEL];
		USERNETWORKKEY = IntegerDigits[FromDigits["B9A521FBBD72C345", 16], 256];
		USERNETWORKNUM = 1;
		USERANTCHANNEL = 0;
		USERCHANNELTYPE = 0;		(* slave *)
		SDMDEVICENUM = 0;			(* wild-card *)
		SDMDEVICETYPE = 0;			(* wild-card *)
		SDMTRANSMISSIONTYPE = 0;	(* wild-card *)
		SDMMESGPERIOD = 8134;		(* ~ 4 Hz *)
		SDMRFFREQ = 57;				(* interpreted as (2400 + 57) *)
		USERSEARCHTIMEOUT = 255;
		$resetSuccessful = False;
		$connected = False;

		(* Device-specific parameters *)
		$pageNumbers = Null;
		$pageNames = Null;
		$pageFields = Null;
		$channelConfiguration = Null;
		$deviceData = Null;
		$currentDevice = Null;
	];

ANTDeviceData[deviceProfileType_String] :=
	Module[{},
		If[deviceProfileType ==$currentDevice,
			Return@$deviceData;,
			Return@{};
		];
	];

eventHandler[id_, type_, data_]:=
	Module[{MessageID, ChannelID, ResponseID, DataBody, DataBodyWithResponseID},
		If["debug" == type, Print[data]];
		If["SerialMessage" == type,
			MessageID = "ucMessageID"/.(data[[1]]);
			If[Length[data] > MESGCHANNELOFFSET,
				ChannelID = BitAnd[data[[MESGCHANNELOFFSET]],CHANNELNUMBERMASK];
				ResponseID = data[[MESGEVENTIDOFFSET]];
				DataBody = Drop[data,MESGEVENTIDOFFSET];
				DataBodyWithResponseID = Drop[data,MESGCHANNELOFFSET];,
				ChannelID = None;
				ResponseID = data[[MESGCHANNELOFFSET]];
				DataBody = {};
				DataBodyWithResponseID = {ResponseID};
			];
			Switch[MessageID,
				MESGSTARTUPMESGID,
					If[ResponseID == 32,
						If[None =!= ResponseFunction,
							ResponseFunction[ 255 (* not possible, but no channel in this case *), MESGSTARTUPMESGID, {ResponseID}]
						]
					],
				MESGRESPONSEEVENTID,
					Switch[ResponseID,
						MESGEVENTID,
							If[EVENTTRANSFERTXFAILED == DataBody[[1]] && AUTOTRANSFERCHANNEL == ChannelID,
								numDataPackets = 0;
							];
							If[None =!= ChannelEventFunctions[[ChannelID]],
								ChannelEventFunctions[[ChannelID]][ChannelID, ResponseID, DataBody]
							],
						_,
							If[None =!= ResponseFunction,
								ResponseFunction[ChannelID, ResponseID, DataBody]
							]
					],
				MESGBROADCASTDATAID, (* Data Page*)
					If[None =!= ChannelEventFunctions[[ChannelID]],
						ChannelEventFunctions[[ChannelID]][ChannelID, If[Length[DataBody] > MESGDATASIZE, EVENTRXFLAGBROADCAST, EVENTRXBROADCAST], DataBodyWithResponseID]
					],
				MESGACKNOWLEDGEDDATAID,
					If[None =!= ChannelEventFunctions[[ChannelID]],
						ChannelEventFunctions[[ChannelID]][ChannelID, If[Length[DataBody] > MESGDATASIZE, EVENTRXFLAGACKNOWLEDGED, EVENTRXACKNOWLEDGED], DataBodyWithResponseID]
					],
				MESGBURSTDATAID,
					If[None =!= ChannelEventFunctions[[ChannelID]],
						ChannelEventFunctions[[ChannelID]][ChannelID, If[Length[DataBody] > MESGDATASIZE, EVENTRXFLAGBURSTPACKET, EVENTRXBURSTPACKET], DataBodyWithResponseID]
					],
				MESGEXTBROADCASTDATAID,
					If[None =!= ChannelEventFunctions[[ChannelID]],
						ChannelEventFunctions[[ChannelID]][ChannelID, EVENTRXEXTBROADCAST, DataBodyWithResponseID]
					],
				MESGEXTACKNOWLEDGEDDATAID,
					If[None =!= ChannelEventFunctions[[ChannelID]],
						ChannelEventFunctions[[ChannelID]][ChannelID, EVENTRXEXTACKNOWLEDGED, DataBodyWithResponseID]
					],
				MESGEXTBURSTDATAID,
					If[None =!= ChannelEventFunctions[[ChannelID]],
						ChannelEventFunctions[[ChannelID]][ChannelID, EVENTRXEXTBURSTPACKET, DataBodyWithResponseID]
					],
				MESGRSSIBROADCASTDATAID,
					If[None =!= ChannelEventFunctions[[ChannelID]],
						ChannelEventFunctions[[ChannelID]][ChannelID, EVENTRXRSSIBROADCAST, DataBodyWithResponseID]
					],
				MESGRSSIBURSTDATAID,
					If[None =!= ChannelEventFunctions[[ChannelID]],
						ChannelEventFunctions[[ChannelID]][ChannelID, EVENTRXRSSIBURSTPACKET, DataBodyWithResponseID]
					],
				_,
					If[None =!= ResponseFunction,
						ResponseFunction[ChannelID, ResponseID, DataBody]
					];
			];,
			Message[MessageName[eventHandler,"info"], type <> ToString[data]];
		];
	];

myResponseFunction[channelID_Integer, mesgID_Integer, data_List] := 
	Module[{MESGASSIGNCHANNELID,
			MESGCHANNELMESGPERIODID, 
			MESGCHANNELSEARCHTIMEOUTID,
			MESGCHANNELRADIOFREQID, 
			MESGNETWORKKEYID,
			MESGOPENCHANNELID,
			MESGCLOSECHANNELID, 
			MESGCHANNELIDID,
			MESGSTARTUPMESGID},
		MESGASSIGNCHANNELID = 			66;
		MESGCHANNELMESGPERIODID = 		67;
		MESGCHANNELSEARCHTIMEOUTID = 	68;
		MESGCHANNELRADIOFREQID = 		69;
		MESGNETWORKKEYID = 				70;
		MESGOPENCHANNELID = 			75;
		MESGCLOSECHANNELID = 			76;
		MESGCHANNELIDID = 				81;
		MESGSTARTUPMESGID = 			111;
		
		Print[mesgID];
		Switch[mesgID,
			MESGNETWORKKEYID,
				If[0 == data[[1]] (*no error*),
					ANTAssignChannel[USERANTCHANNEL, USERCHANNELTYPE, USERNETWORKNUM],
					Print[data[[1]]];
			 	],
			MESGASSIGNCHANNELID,
				If[0 == data[[1]] (*no error*),
			    	ANTSetChannelID[USERANTCHANNEL, SDMDEVICENUM, SDMDEVICETYPE, SDMTRANSMISSIONTYPE],
			    	Print[data[[1]]];
			    ],
	   		MESGCHANNELIDID,
	   			If[0 == data[[1]] (*no error*), 
	    			ANTSetChannelPeriod[USERANTCHANNEL, SDMMESGPERIOD],
	    			Print[data[[1]]];
	    		],
	   		MESGCHANNELMESGPERIODID,
				If[0 == data[[1]] (*no error*), 
					ANTSetChannelRFFreq[USERANTCHANNEL, SDMRFFREQ],
					Print[data[[1]]];
				],
			MESGCHANNELRADIOFREQID,
				If[0 == data[[1]] (*no error*),
					ANTSetChannelSearchTimeout[USERANTCHANNEL, USERSEARCHTIMEOUT],
					Print[data[[1]]];
				],
			MESGCHANNELSEARCHTIMEOUTID,
				If[0 == data[[1]] (*no error*),
					ANTOpenChannel[USERANTCHANNEL];
					$connected = True;,
					Print[data[[1]]];
				],
			MESGOPENCHANNELID,
				If[0 != data[[1]] (*no error*),
					Return@$Failed;,
					Print[data[[1]]];
				],
			MESGCLOSECHANNELID,
				If[7 != data[[1]] (* successful channel closure *),
					$connected = False;
					ANTResetSystem[];,
					Print[data[[1]]];
				],
			MESGSTARTUPMESGID,
				If[32 == data[[1]],
					$resetSuccessful = True;
					Print["Reset Successful"];,
					Print[data[[1]]];
				],
			_,
				Print["myResponseFunction did not recognise this mesgID:" <> ToString[mesgID]];
		];
	];

myChannelEventFunction[channel_Integer, mesgID_Integer, data_List] := 
	Module[{
	  	EVENTRXBROADCAST, EVENTRXACKNOWLEDGED, EVENTRXBURSTPACKET, 
		EVENTRXEXTBROADCAST, EVENTRXEXTACKNOWLEDGED, EVENTRXEXTBURSTPACKET,
	    EVENTRXRSSIBROADCAST, EVENTRXRSSIACKNOWLEDGED, 
		EVENTRXRSSIBURSTPACKET, EVENTRXFLAGBROADCAST, 
		EVENTRXFLAGACKNOWLEDGED, EVENTRXFLAGBURSTPACKET,pagePosition,newData},
		EVENTRXBROADCAST = FromDigits["9A", 16];
		EVENTRXACKNOWLEDGED = FromDigits["9B", 16];
		EVENTRXBURSTPACKET = FromDigits["9C", 16];
		EVENTRXEXTBROADCAST = FromDigits["9D", 16];
		EVENTRXEXTACKNOWLEDGED = FromDigits["9E", 16];
		EVENTRXEXTBURSTPACKET = FromDigits["9F", 16];
		EVENTRXRSSIBROADCAST = FromDigits["A0", 16];
		EVENTRXRSSIACKNOWLEDGED = FromDigits["A1", 16];
		EVENTRXRSSIBURSTPACKET = FromDigits["A2", 16];
		EVENTRXFLAGBROADCAST = FromDigits["A3", 16]; 
		EVENTRXFLAGACKNOWLEDGED = FromDigits["A4", 16];
		EVENTRXFLAGBURSTPACKET = FromDigits["A5", 16];
		Switch[mesgID,
			EVENTRXBROADCAST,
				If[$pageNumbers =!= Null,
					pagePosition = Position[$pageNumbers,ToString[data[[1]]]];
					If[pagePosition=!={},
						newData = Map[interpretData[#,data[[ToExpression["Byte"/.#] + 1]]]&,$pageFields[[pagePosition[[1,1]] ]] ];
						$deviceData = Join[$deviceData /. (((#[[1]] -> _) -> #) & /@ newData), FilterRules[newData, Except[$deviceData[[All, 1]]]]];,
						Print@"Encountered unrecognised page format.";
					],
					Print@"receivingData";
				],
			EVENTRXACKNOWLEDGED,
				Print["EventRXAcknowledged"];,
			EVENTRXBURSTPACKET,
				Print["EventRXBurstPacket"];,
			EVENTRXEXTBROADCAST,
				Print["EventRXExtBroadcast"];,
			EVENTRXEXTACKNOWLEDGED,
				Print["EventRXExtAcknowledged"];,
			EVENTRXEXTBURSTPACKET,
				Print["EventRXExtBurstPacket"];,
			EVENTRXRSSIBROADCAST,
				Print["EventRXRSSIBroadcast"];,
			EVENTRXRSSIACKNOWLEDGED,
				Print["EventRXRSSIAcknowledged"];,
			EVENTRXRSSIBURSTPACKET,
				Print["EventRXRSSIBurstPacket"];,
			EVENTRXFLAGBROADCAST,
				Print["EventRXFlagBroadcast"];,
			EVENTRXFLAGACKNOWLEDGED,
				Print["EventRXFlagAcknowledged"];,
			EVENTRXFLAGBURSTPACKET,
				Print["EventRXFlagBurstPacket"];
		];
	];

updateChannelConfiguration[channelConfiguration_List] :=
	Module[{},
		USERCHANNELTYPE = ToExpression["ChannelType"/.channelConfiguration];
		USERNETWORKKEY = IntegerDigits[FromDigits["NetworkKey"/.channelConfiguration, 16], 256];
		SDMRFFREQ = ToExpression["RFChannelFrequency"/.channelConfiguration];
		SDMTRANSMISSIONTYPE = ToExpression["TransmissionType"/.channelConfiguration];			
		SDMDEVICETYPE = ToExpression["DeviceType"/.channelConfiguration];
		SDMDEVICENUM = ToExpression["DeviceNumber"/.channelConfiguration];
		SDMMESGPERIOD = ToExpression["ChannelPeriod"/.channelConfiguration];
		USERSEARCHTIMEOUT = ToExpression["SearchTimeout"/.channelConfiguration];
		ANTSetNetworkKey[USERNETWORKNUM, USERNETWORKKEY];
	];

interpretData[field_List,data_Integer] :=
	Module[{length,units,bits,description},
		length = "Length"/.field;
		units = "Units"/.field;
		bits = ("Bits"/.field)/.("Bits"->Null);
		description = ("Description"/.field)<>" (unit:"<>units<>")";
		Switch[length,
			"1 Byte",
				If[bits === Null,
					Return[description->data];,
					Return[description->interpretBinaryData[bits,data]];
				],
			"Upper 4 bits",
				Return[description->BitAnd[data,240]];,
			"Lower 4 bits",
				Return[description->BitAnd[data,15]];,
			"1 bit",
				Return[description->BitAnd[data,128]];,
			"7 bits",
				Return[description->BitAnd[data,127]];,
			_,
				Return[description->data];
		]
	];

interpretBinaryData[bits_List,data_Integer] :=
	Module[{bitData,currentBit,result,digits,size,i,bit},
		bitData = IntegerDigits[data,2,8];
		currentBit = 1;
		result = {};
		For[ i = 1, i <= Length[bits],i += 1,
			bit = "Bit"/.bits[[i]];
			size = Length[StringSplit["Number"/.bit,","]];
			digits = StringJoin[ToString/@Take[bitData,{currentBit,currentBit + size - 1}]];
			currentBit += size;
			AppendTo[result,("Contents"/.bit)->(digits/.("Enumerations"/.bit))];
		];
		Return@result;
	];

End[]

EndPackage[]

