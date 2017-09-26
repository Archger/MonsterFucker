package com.analysis.APK;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import com.analysis.APK.ApkInfo;
import com.analysis.APK.ApkUtil;
import com.analysis.cfg.HibernateSessionFactory;
import com.analysis.hibernate.Apk;


/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class Upload extends HttpServlet {
    private static final long serialVersionUID = 1L;
     
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
 
    /**
     * 上传数据及保存文件
     */
    protected void doPost(HttpServletRequest request,
		
 
    		
    		HttpServletResponse response) throws ServletException, IOException {
		// 检测是否为多媒体上传
		if (!ServletFileUpload.isMultipartContent(request)) {
		    // 如果不是则停止q	
		    PrintWriter writer = response.getWriter();
		    writer.println("Error: 表单必须包含 enctype=multipart/form-data");
		    writer.flush();
		    return;
		}
 
        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);
        
        // 中文处理
        upload.setHeaderEncoding("UTF-8"); 

        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
        String uploadPath = getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
         
        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
 
        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
            	ApkInfo tempApkInfo=new ApkInfo();
            	//初始化文件大小
            	Integer fileSize=new Integer(0);
            	//获取上传日期
            	Date date=new Date();

                for (FileItem item : formItems) {
                	
                	// 处理不在表单中的字段
            
                	if (!item.isFormField()&&item.getName().endsWith(".apk")) {
                        String fileName = new File(item.getName()).getName();
                        fileSize=(int)item.getSize(); 
                        fileSize=fileSize/1048576; //获取大小并转换为MB为单位
                        
                        String filePath =uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        // 保存文件到硬盘
                        item.write(storeFile);
                        request.setAttribute("message",
                            "文件上传成功!");
                      
                        //调用extract方法解压得到的信息
                        	tempApkInfo=extract(fileName);
            
                    }
                	//处理普通文本（apk的类型）
                	else if(item.isFormField())
                	{
                		Apk apk=storeInfo(tempApkInfo,item.getString("utf-8"),date,fileSize);
                		request.setAttribute("apk",apk );
                		request.setAttribute("iconPath", apk.getIconDirectory());
                	}
                    //拒绝非apk文件
                	else
                	{
                		request.setAttribute("message", "只能上传.apk文件");
                		break;
                	}
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "错误信息: " + ex.getMessage());
        }
        
        
        // 跳转到 message.jsp
        getServletContext().getRequestDispatcher("/upload_message.jsp").forward(
                request, response);
        
        }
    
    	
    	public ApkInfo extract(String fileName) throws Exception
    	{
    		//E:/Files/Documents/study/j2ee/project/.metadata/.me_tcat7/webapps/ApkAnalyzePlatform/
    		String apkPath = getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY+"/"+fileName;
            ApkUtil apkutil = new ApkUtil();  
            ApkInfo apkInfo = apkutil.getApkInfo(apkPath);  
            apkInfo.setFileName(fileName);
            System.out.println(apkInfo.getUsesPermissions());
            return apkInfo;

    	}
    	
    	//将apk信息保存到数据库中
    	public Apk storeInfo(ApkInfo apkInfo,String type,Date date,int fileSize) throws IOException
    	{
    		//E:/Files/Documents/study/j2ee/project/.metadata/.me_tcat7/webapps/ApkAnalyzePlatform/
    			String apkPath = getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY+"/"+apkInfo.getFileName();
    			Session session = HibernateSessionFactory.getSession();
    			Transaction tx= session.beginTransaction();
    			//-------------------------------------------
    			Apk apk=new Apk();
    			apk.setFileDirectoryName(UPLOAD_DIRECTORY+'/'+apkInfo.getFileName());
    			apk.setApkName(apkInfo.getApplicationLable());
    			apk.setApkType(type);
    			apk.setUploadDate(date);
    			apk.setFileSize(fileSize);
    			//传用户id apk.setDeveloperId(developerId);
    		    apk.setVersionName(apkInfo.getVersionName());
    		    apk.setIconDirectory(storeIcon(apkInfo.getApplicationIcon(),apkPath));
    		    
    		    //判断权限
    		    for(String permission : apkInfo.getUsesPermissions()) {
    		    	  if(permission.indexOf("INTERNET")>0){apk.setInternet(true);}
    		    	  else if(permission.indexOf("ACCESS_COARSE_LOCATION")>0){apk.setAccessCoarseLocation(true);}
    		    	  else if(permission.indexOf("ACCESS_FINE_LOCATION")>0){apk.setAccessFineLocation(true);}
    		    	  else if(permission.indexOf("CAMERA")>0){apk.setCamera(true);}
    		    	  else if(permission.indexOf("RECORD_AUDIO")>0){apk.setRecordAudio(true);}
    		    	  else if(permission.indexOf("READ_CONTACTS")>0){apk.setReadContacts(true);}
    		    	  else if(permission.indexOf("WRITE_CONTACTS")>0){apk.setWriteContacts(true);}
    		    	  else if(permission.indexOf("BLUETOOTH")>0){apk.setBluetooth(true);}
    		    	  else if(permission.indexOf("NFC")>0){apk.setNfc(true);}
    		    	  else if(permission.indexOf("CALL_PHONE")>0){apk.setCallaPhone(true);}
    		    	  else if(permission.indexOf("READ_SMS")>0){apk.setReadSms(true);}
    		    	  else if(permission.indexOf("WRITE_SMS")>0){apk.setWriteSms(true);}
    		    	  else if(permission.indexOf("MODIFY_AUDIO_SETTINGS")>0){apk.setModifyAudioSettings(true);}
    		    	  else if(permission.indexOf("BODY_SENSORS")>0){apk.setBodySensors(true);}
    		    	  else if(permission.indexOf("READ_EXTERNAL_STORAGE")>0){apk.setReadExternalStorage(true);}
    		    	  else if(permission.indexOf("WRITE_EXTERNAL_STORAGE")>0){apk.setWriteExternalStorage(true);}
    		    	  else if(permission.indexOf("READ_PHONE_STATE")>0){apk.setReadPhoneState(true);}
    		    	  else if(permission.indexOf("MODIFY_PHONE_STATE")>0){apk.setModifyPhoneState(true);}
    		    	  else if(permission.indexOf("CHANGE_WIFI_STATE")>0){apk.setChangeWifiState(true);}
    		    	  else if(permission.indexOf("ACCESS_WIFI_STAT")>0){apk.setAccessWifiState(true);}
    		    	  else if(permission.indexOf("FLASHLIGHT")>0){apk.setFlashlight(true);}
    		    	  else if(permission.indexOf("WAKE_LOCK")>0){apk.setWakeLock(true);}
    		    	  else if(permission.indexOf("VIBRATE")>0){apk.setViberate(true);}
    		    	  else if(permission.indexOf("SYSTEM_ALERT_WINDOW")>0){apk.setSystemAlertWindow(true);}
    		    	  else if(permission.indexOf("RECEIVE_BOOT_COMPLETED")>0){apk.setReceiveBootCompleted(true);}
    		    	  else if(permission.indexOf("ACCESS_NETWORK_STATE")>0){apk.setAccessNetworkState(true);}
    		    	  else if(permission.indexOf("CHANGE_NETWORK_STATE")>0){apk.setChangeNetworkState(true);}
    		    	  else if(permission.indexOf("READ_CALL_LOG")>0){apk.setReadCallLog(true);}
    		    	  else if(permission.indexOf("WRITE_CALL_LOG")>0){apk.setWriteCallLog(true);}
    		    	  else if(permission.indexOf("BATTERY_STATS")>0){apk.setBattertyStats(true);}
    		    	  else if(permission.indexOf("WRITE_SETTINGS")>0){apk.setWriteSettings(true);}
    		    	  else if(permission.indexOf("EXPAND_STATUS_BAR")>0){apk.setExpandStatusBar(true);}
    		    	  else if(permission.indexOf("SET_WALLPAPER")>0){apk.setSetWallpaper(true);}
    		    	  else if(permission.indexOf("SET_PREFERRED_APPLICATIONS")>0){apk.setSetPreferredApplications(true);}
    		    	  else if(permission.indexOf("WRITE_SECURE_SETTINGS")>0){apk.setWriteSecureSettings(true);}

    		    }
    		    session.save(apk);
    		    //-------------------------------------------

    		tx.commit();
    			HibernateSessionFactory.closeSession();
    			return apk;
    	}
    	
    	//将应用图标单独提取出来
    	public String storeIcon(String iconPath, String apkPath) throws IOException  {      
    		//E:/Files/Documents/study/j2ee/project/.metadata/.me_tcat7/webapps/ApkAnalyzePlatform/
    		String targetPath=getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY+"/icons/";
    		String outPath=null;
    		File file = new File(apkPath);    
    	    if (!file.isFile()) {    
    	        throw new FileNotFoundException("file not exist!");    
    	    }    
    	    if (targetPath == null || "".equals(targetPath)) {    
    	        targetPath = file.getParent();    
    	    }      
    	    ZipFile zipFile = new ZipFile(file);    
    	    Enumeration<? extends ZipEntry> files = zipFile.entries();  
    	    
    	    ZipEntry entry = null;    
    	    File outFile = null;    
    	    BufferedInputStream bin = null;    
    	    BufferedOutputStream bout = null;    
    	    while (files.hasMoreElements()) {    
    	        entry = files.nextElement();    
    	        
    	        //只提取图标
    	        if(entry.toString().equals(iconPath))
    	        {
    	        	outPath=targetPath + file.getName() + entry.getName();
    	        	iconPath="upload/icons/"+file.getName() + entry.getName();
    		        outFile = new File(outPath);    
    		        // 如果条目为目录，则跳向下一个     
    		        if(entry.isDirectory()){  
    		            outFile.mkdirs();    
    		            continue;    
    		        }    
    		        // 创建目录    
    		        if (!outFile.getParentFile().exists()) {    
    		            outFile.getParentFile().mkdirs();    
    		        }    
    		        // 创建新文件    
    		        outFile.createNewFile();    
    		        // 如果不可写，则跳向下一个条目    
    		        if (!outFile.canWrite()) {    
    		            continue;    
    		        }    
    		        try {    
    		            bin = new BufferedInputStream(zipFile.getInputStream(entry));    
    		            bout = new BufferedOutputStream(new FileOutputStream(outFile));    
    		            byte[] buffer = new byte[1024];    
    		            int readCount = -1;    
    		            while ((readCount = bin.read(buffer)) != -1) {    
    		                bout.write(buffer, 0, readCount);    
    		            }    
    		        } finally {    
    		            try {    
    		                bin.close();    
    		                bout.flush();    
    		                bout.close();    
    		            } catch (Exception e) {}    
    		        }    
    		    } 
    	    }
    	    
    	    return iconPath;
    	    		
    	}   
}
