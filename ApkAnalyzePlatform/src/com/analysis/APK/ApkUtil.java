package com.analysis.APK;

import java.io.BufferedReader;  
import java.io.Closeable;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.InputStreamReader;  
  
  

  
//apk工具类
public class ApkUtil {  
    public static final String VERSION_NAME = "versionName";   
    public static final String USES_PERMISSION = "uses-permission";  
    public static final String APPLICATION_LABEL = "application-label";  
    public static final String PACKAGE = "package";  
    public static final String APPLICATION = "application:";  
    
    private ProcessBuilder mBuilder;  
    private static final String SPLIT_REGEX = "(: )|(=')|(' )|'";  

    //aapt.exe所在目录
    private String mAaptPath = "C:/Users/Arch/Desktop/tmp_apk/aapt.exe";  
  
    public ApkUtil() {  
        mBuilder = new ProcessBuilder();  
        mBuilder.redirectErrorStream(true);  
    }  
  

    //返回一个apk程序的信息
    public ApkInfo getApkInfo(String apkPath) throws Exception {  
        Process process = mBuilder.command(mAaptPath, "d", "badging", apkPath)  
                .start();  
        InputStream is = null;  
        is = process.getInputStream();  
        BufferedReader br = new BufferedReader(  
                new InputStreamReader(is, "utf8"));  
        String tmp = br.readLine();  
        try {  
            if (tmp == null || !tmp.startsWith("package")) {  
                throw new Exception("参数不正确，无法正常解析APK包。输出结果为:" + tmp + "...");  
            }  
            ApkInfo apkInfo = new ApkInfo();  
            do {  
                setApkInfoProperty(apkInfo, tmp);  
            } while ((tmp = br.readLine()) != null);  
            return apkInfo;  
        } catch (Exception e) {  
            throw e;  
        } finally {  
            process.destroy();  
            closeIO(is);  
            closeIO(br);  
        }  
    }  
  

    //设置apk的属性信息
    private void setApkInfoProperty(ApkInfo apkInfo, String source) {  
        if (source.startsWith(PACKAGE)) {  
            splitPackageInfo(apkInfo, source);  
        }else if (source.startsWith(USES_PERMISSION)) {  
            apkInfo.addToUsesPermissions(getPropertyInQuote(source));  
        } else if (source.startsWith(APPLICATION_LABEL)) {  
            apkInfo.setApplicationLable(getPropertyInQuote(source));  
        }  else if (source.startsWith(APPLICATION)) {  
            String[] rs = source.split("( icon=')|'");  
            apkInfo.setApplicationIcon(rs[rs.length - 1]);  
        }
    }  
  
  
    // 返回出格式为name: 'value'中的value内容。 
    private String getPropertyInQuote(String source) {  
        return source.substring(source.indexOf("'") + 1, source.length() - 1);  
    } 
 
    // 分离出版本信息。 
    private void splitPackageInfo(ApkInfo apkInfo, String packageSource) {  
        String[] packageInfo = packageSource.split(SPLIT_REGEX);   
        apkInfo.setVersionName(packageInfo[6]);  
    }  
  
    //释放资源 
    private final void closeIO(Closeable c) {  
        if (c != null) {  
            try {  
                c.close();  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
    }  

    public String getmAaptPath() {  
        return mAaptPath;  
    }  
  
    public void setmAaptPath(String mAaptPath) {  
        this.mAaptPath = mAaptPath;  
    }  
  
}  