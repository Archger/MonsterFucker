package com.analysis.hibernate;

import java.util.Date;

/**
 * Apk entity. @author MyEclipse Persistence Tools
 */

public class Apk implements java.io.Serializable {

	// Fields

	private Integer apkId;
	private String fileDirectoryName;
	private String iconDirectory;
	private String apkName;
	private String apkType;
	private Date uploadDate;
	private Integer fileSize;
	private Integer developerId;
	private String versionName;
	private Boolean internet;
	private Boolean accessCoarseLocation;
	private Boolean accessFineLocation;
	private Boolean camera;
	private Boolean recordAudio;
	private Boolean readContacts;
	private Boolean writeContacts;
	private Boolean bluetooth;
	private Boolean nfc;
	private Boolean callaPhone;
	private Boolean readSms;
	private Boolean writeSms;
	private Boolean modifyAudioSettings;
	private Boolean bodySensors;
	private Boolean readExternalStorage;
	private Boolean writeExternalStorage;
	private Boolean readPhoneState;
	private Boolean modifyPhoneState;
	private Boolean changeWifiState;
	private Boolean accessWifiState;
	private Boolean flashlight;
	private Boolean wakeLock;
	private Boolean viberate;
	private Boolean systemAlertWindow;
	private Boolean receiveBootCompleted;
	private Boolean accessNetworkState;
	private Boolean changeNetworkState;
	private Boolean readCallLog;
	private Boolean writeCallLog;
	private Boolean battertyStats;
	private Boolean writeSettings;
	private Boolean expandStatusBar;
	private Boolean setWallpaper;
	private Boolean setPreferredApplications;
	private Boolean writeSecureSettings;

	// Constructors

	/** default constructor */
	public Apk() {
		internet=false;
		accessCoarseLocation=false;
		accessFineLocation=false;
		camera=false;
		recordAudio=false;
		readContacts=false;
		writeContacts=false;
		bluetooth=false;
		nfc=false;
		callaPhone=false;
		readSms=false;
		writeSms=false;
		modifyAudioSettings=false;
		bodySensors=false;
		readExternalStorage=false;
 		writeExternalStorage=false;
 		readPhoneState=false;
 		modifyPhoneState=false;
	    changeWifiState=false;
		accessWifiState=false;
		flashlight=false;
		wakeLock=false;
		viberate=false;
		systemAlertWindow=false;
		receiveBootCompleted=false;
		accessNetworkState=false;
		changeNetworkState=false;
		readCallLog=false;
		writeCallLog=false;
		battertyStats=false;
		writeSettings=false;
		expandStatusBar=false;
		setWallpaper=false;
		setPreferredApplications=false;
		writeSecureSettings=false;
	}

	/** minimal constructor */
	public Apk(String fileDirectoryName) {
		this.fileDirectoryName = fileDirectoryName;
	}

	/** full constructor */
	public Apk(String fileDirectoryName, String iconDirectory, String apkName, String apkType, Date uploadDate,
			Integer fileSize, Integer developerId, String versionName, Boolean internet, Boolean accessCoarseLocation,
			Boolean accessFineLocation, Boolean camera, Boolean recordAudio, Boolean readContacts,
			Boolean writeContacts, Boolean bluetooth, Boolean nfc, Boolean callaPhone, Boolean readSms,
			Boolean writeSms, Boolean modifyAudioSettings, Boolean bodySensors, Boolean readExternalStorage,
			Boolean writeExternalStorage, Boolean readPhoneState, Boolean modifyPhoneState, Boolean changeWifiState,
			Boolean accessWifiState, Boolean flashlight, Boolean wakeLock, Boolean viberate, Boolean systemAlertWindow,
			Boolean receiveBootCompleted, Boolean accessNetworkState, Boolean changeNetworkState, Boolean readCallLog,
			Boolean writeCallLog, Boolean battertyStats, Boolean writeSettings, Boolean expandStatusBar,
			Boolean setWallpaper, Boolean setPreferredApplications, Boolean writeSecureSettings) {
		this.fileDirectoryName = fileDirectoryName;
		this.iconDirectory = iconDirectory;
		this.apkName = apkName;
		this.apkType = apkType;
		this.uploadDate = uploadDate;
		this.fileSize = fileSize;
		this.developerId = developerId;
		this.versionName = versionName;
		this.internet = internet;
		this.accessCoarseLocation = accessCoarseLocation;
		this.accessFineLocation = accessFineLocation;
		this.camera = camera;
		this.recordAudio = recordAudio;
		this.readContacts = readContacts;
		this.writeContacts = writeContacts;
		this.bluetooth = bluetooth;
		this.nfc = nfc;
		this.callaPhone = callaPhone;
		this.readSms = readSms;
		this.writeSms = writeSms;
		this.modifyAudioSettings = modifyAudioSettings;
		this.bodySensors = bodySensors;
		this.readExternalStorage = readExternalStorage;
		this.writeExternalStorage = writeExternalStorage;
		this.readPhoneState = readPhoneState;
		this.modifyPhoneState = modifyPhoneState;
		this.changeWifiState = changeWifiState;
		this.accessWifiState = accessWifiState;
		this.flashlight = flashlight;
		this.wakeLock = wakeLock;
		this.viberate = viberate;
		this.systemAlertWindow = systemAlertWindow;
		this.receiveBootCompleted = receiveBootCompleted;
		this.accessNetworkState = accessNetworkState;
		this.changeNetworkState = changeNetworkState;
		this.readCallLog = readCallLog;
		this.writeCallLog = writeCallLog;
		this.battertyStats = battertyStats;
		this.writeSettings = writeSettings;
		this.expandStatusBar = expandStatusBar;
		this.setWallpaper = setWallpaper;
		this.setPreferredApplications = setPreferredApplications;
		this.writeSecureSettings = writeSecureSettings;
	}

	// Property accessors

	public Integer getApkId() {
		return this.apkId;
	}

	public void setApkId(Integer apkId) {
		this.apkId = apkId;
	}

	public String getFileDirectoryName() {
		return this.fileDirectoryName;
	}

	public void setFileDirectoryName(String fileDirectoryName) {
		this.fileDirectoryName = fileDirectoryName;
	}

	public String getIconDirectory() {
		return this.iconDirectory;
	}

	public void setIconDirectory(String iconDirectory) {
		this.iconDirectory = iconDirectory;
	}

	public String getApkName() {
		return this.apkName;
	}

	public void setApkName(String apkName) {
		this.apkName = apkName;
	}

	public String getApkType() {
		return this.apkType;
	}

	public void setApkType(String apkType) {
		this.apkType = apkType;
	}

	public Date getUploadDate() {
		return this.uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public Integer getFileSize() {
		return this.fileSize;
	}

	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
	}

	public Integer getDeveloperId() {
		return this.developerId;
	}

	public void setDeveloperId(Integer developerId) {
		this.developerId = developerId;
	}

	public String getVersionName() {
		return this.versionName;
	}

	public void setVersionName(String versionName) {
		this.versionName = versionName;
	}

	public Boolean getInternet() {
		return this.internet;
	}

	public void setInternet(Boolean internet) {
		this.internet = internet;
	}

	public Boolean getAccessCoarseLocation() {
		return this.accessCoarseLocation;
	}

	public void setAccessCoarseLocation(Boolean accessCoarseLocation) {
		this.accessCoarseLocation = accessCoarseLocation;
	}

	public Boolean getAccessFineLocation() {
		return this.accessFineLocation;
	}

	public void setAccessFineLocation(Boolean accessFineLocation) {
		this.accessFineLocation = accessFineLocation;
	}

	public Boolean getCamera() {
		return this.camera;
	}

	public void setCamera(Boolean camera) {
		this.camera = camera;
	}

	public Boolean getRecordAudio() {
		return this.recordAudio;
	}

	public void setRecordAudio(Boolean recordAudio) {
		this.recordAudio = recordAudio;
	}

	public Boolean getReadContacts() {
		return this.readContacts;
	}

	public void setReadContacts(Boolean readContacts) {
		this.readContacts = readContacts;
	}

	public Boolean getWriteContacts() {
		return this.writeContacts;
	}

	public void setWriteContacts(Boolean writeContacts) {
		this.writeContacts = writeContacts;
	}

	public Boolean getBluetooth() {
		return this.bluetooth;
	}

	public void setBluetooth(Boolean bluetooth) {
		this.bluetooth = bluetooth;
	}

	public Boolean getNfc() {
		return this.nfc;
	}

	public void setNfc(Boolean nfc) {
		this.nfc = nfc;
	}

	public Boolean getCallaPhone() {
		return this.callaPhone;
	}

	public void setCallaPhone(Boolean callaPhone) {
		this.callaPhone = callaPhone;
	}

	public Boolean getReadSms() {
		return this.readSms;
	}

	public void setReadSms(Boolean readSms) {
		this.readSms = readSms;
	}

	public Boolean getWriteSms() {
		return this.writeSms;
	}

	public void setWriteSms(Boolean writeSms) {
		this.writeSms = writeSms;
	}

	public Boolean getModifyAudioSettings() {
		return this.modifyAudioSettings;
	}

	public void setModifyAudioSettings(Boolean modifyAudioSettings) {
		this.modifyAudioSettings = modifyAudioSettings;
	}

	public Boolean getBodySensors() {
		return this.bodySensors;
	}

	public void setBodySensors(Boolean bodySensors) {
		this.bodySensors = bodySensors;
	}

	public Boolean getReadExternalStorage() {
		return this.readExternalStorage;
	}

	public void setReadExternalStorage(Boolean readExternalStorage) {
		this.readExternalStorage = readExternalStorage;
	}

	public Boolean getWriteExternalStorage() {
		return this.writeExternalStorage;
	}

	public void setWriteExternalStorage(Boolean writeExternalStorage) {
		this.writeExternalStorage = writeExternalStorage;
	}

	public Boolean getReadPhoneState() {
		return this.readPhoneState;
	}

	public void setReadPhoneState(Boolean readPhoneState) {
		this.readPhoneState = readPhoneState;
	}

	public Boolean getModifyPhoneState() {
		return this.modifyPhoneState;
	}

	public void setModifyPhoneState(Boolean modifyPhoneState) {
		this.modifyPhoneState = modifyPhoneState;
	}

	public Boolean getChangeWifiState() {
		return this.changeWifiState;
	}

	public void setChangeWifiState(Boolean changeWifiState) {
		this.changeWifiState = changeWifiState;
	}

	public Boolean getAccessWifiState() {
		return this.accessWifiState;
	}

	public void setAccessWifiState(Boolean accessWifiState) {
		this.accessWifiState = accessWifiState;
	}

	public Boolean getFlashlight() {
		return this.flashlight;
	}

	public void setFlashlight(Boolean flashlight) {
		this.flashlight = flashlight;
	}

	public Boolean getWakeLock() {
		return this.wakeLock;
	}

	public void setWakeLock(Boolean wakeLock) {
		this.wakeLock = wakeLock;
	}

	public Boolean getViberate() {
		return this.viberate;
	}

	public void setViberate(Boolean viberate) {
		this.viberate = viberate;
	}

	public Boolean getSystemAlertWindow() {
		return this.systemAlertWindow;
	}

	public void setSystemAlertWindow(Boolean systemAlertWindow) {
		this.systemAlertWindow = systemAlertWindow;
	}

	public Boolean getReceiveBootCompleted() {
		return this.receiveBootCompleted;
	}

	public void setReceiveBootCompleted(Boolean receiveBootCompleted) {
		this.receiveBootCompleted = receiveBootCompleted;
	}

	public Boolean getAccessNetworkState() {
		return this.accessNetworkState;
	}

	public void setAccessNetworkState(Boolean accessNetworkState) {
		this.accessNetworkState = accessNetworkState;
	}

	public Boolean getChangeNetworkState() {
		return this.changeNetworkState;
	}

	public void setChangeNetworkState(Boolean changeNetworkState) {
		this.changeNetworkState = changeNetworkState;
	}

	public Boolean getReadCallLog() {
		return this.readCallLog;
	}

	public void setReadCallLog(Boolean readCallLog) {
		this.readCallLog = readCallLog;
	}

	public Boolean getWriteCallLog() {
		return this.writeCallLog;
	}

	public void setWriteCallLog(Boolean writeCallLog) {
		this.writeCallLog = writeCallLog;
	}

	public Boolean getBattertyStats() {
		return this.battertyStats;
	}

	public void setBattertyStats(Boolean battertyStats) {
		this.battertyStats = battertyStats;
	}

	public Boolean getWriteSettings() {
		return this.writeSettings;
	}

	public void setWriteSettings(Boolean writeSettings) {
		this.writeSettings = writeSettings;
	}

	public Boolean getExpandStatusBar() {
		return this.expandStatusBar;
	}

	public void setExpandStatusBar(Boolean expandStatusBar) {
		this.expandStatusBar = expandStatusBar;
	}

	public Boolean getSetWallpaper() {
		return this.setWallpaper;
	}

	public void setSetWallpaper(Boolean setWallpaper) {
		this.setWallpaper = setWallpaper;
	}

	public Boolean getSetPreferredApplications() {
		return this.setPreferredApplications;
	}

	public void setSetPreferredApplications(Boolean setPreferredApplications) {
		this.setPreferredApplications = setPreferredApplications;
	}

	public Boolean getWriteSecureSettings() {
		return this.writeSecureSettings;
	}

	public void setWriteSecureSettings(Boolean writeSecureSettings) {
		this.writeSecureSettings = writeSecureSettings;
	}

}