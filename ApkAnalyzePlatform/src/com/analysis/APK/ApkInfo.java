package com.analysis.APK;

import java.util.ArrayList;  
import java.util.List;  

  
//apk信息类
public class ApkInfo {  

	private String fileName=null;//文件名
    private String versionName = null;  //apk版本号 
    private List<String> usesPermissions = null;   //apk所需要的权限  
    private String applicationLable=null;  //应用程序名  
    private String applicationIcon=null;  //程序图标
  
    
    public ApkInfo() {  
        this.usesPermissions = new ArrayList<String>();  
    }  
  
    //返回和设置文件名
    public String getFileName()
    {
    	return fileName;
    }
    public void setFileName(String fileName)
    {
    	this.fileName=fileName;
    }
    
   //返回和设置版本号
    public String getVersionName() {  
        return versionName;  
    }  

    public void setVersionName(String versionName) {  
        this.versionName = versionName;  
    }  
  
    
   //返回设置添加用户权限
    public List<String> getUsesPermissions() {  
        return usesPermissions;  
    }  
  
    public void setUsesPermissions(List<String> usesPermission) {  
        this.usesPermissions = usesPermission;  
    }  
  
    public void addToUsesPermissions(String usesPermission) {  
        this.usesPermissions.add(usesPermission);  
    }  
  
    //返回和设置程序名
    public String getApplicationLable() {  
        return applicationLable;  
    }  
  
    public void setApplicationLable(String applicationLable) {  
        this.applicationLable = applicationLable;  
    }  
    
    //返回和设置程序图标
    public String getApplicationIcon() {  
        return applicationIcon;  
    }  
  
    public void setApplicationIcon(String applicationIcon) {  
        this.applicationIcon = applicationIcon;  
    }  
  
   
    public String toString() {  
        return "ApkInfo [versionName="  + versionName  
        		+ ",\n usesPermissions="  + usesPermissions 
                + ",\n applicationLable=" + applicationLable  
                + ",\n applicationIcon=" + applicationIcon  
                + "]";  
    }  
  
}  