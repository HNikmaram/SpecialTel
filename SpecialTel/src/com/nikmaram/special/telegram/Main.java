package com.nikmaram.special.telegram;

import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.DefaultHttpClient;

import android.support.v7.app.ActionBarActivity;
import android.annotation.SuppressLint;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.CookieManager;
import android.webkit.CookieSyncManager;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.Toast;

@SuppressLint({ "NewApi", "JavascriptInterface" })
public class Main extends ActionBarActivity {

	private WebView myWebView;
	private DefaultHttpClient httpClient;
	public static Cookie cookie = null; 
	private ValueCallback<Uri> mUploadMessage;
	private final static int FILECHOOSER_RESULTCODE = 1;
	public static Typeface sans;
	public static SharedPreferences sp;
	private String stylestring;
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
            WindowManager.LayoutParams.FLAG_FULLSCREEN);
        
        
		setContentView(R.layout.main);
		
		sans = Typeface.createFromAsset(getAssets(), "sans.ttf");
		sp = getApplicationContext().getSharedPreferences("lock",0);
		String status = sp.getString("localpw","");
		if(!status.equals("")){
			Intent lock = new Intent(Main.this,LockScreen.class);
        	startActivity(lock);
		}
		
		
    	if(sp.getString("backcolor","white").equals("white")){
        	 stylestring = "<style>.im_history_messages_peer{background:white;}</style>"; 
    	}
    	else{
        	 stylestring = "<style>.im_history_messages_peer{background:url(backgrounds/"+sp.getString("backcolor","white")+".jpg);}</style>"; 
    	}
    	
		myWebView = (WebView) findViewById(R.id.webView1);
	      
        WebSettings settings = myWebView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDatabaseEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(true);
        settings.setBuiltInZoomControls(true);
        settings.setUseWideViewPort(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(true);
        settings.setLoadWithOverviewMode(true);
        myWebView.setScrollBarStyle(WebView.SCROLLBARS_OUTSIDE_OVERLAY);
        myWebView.addJavascriptInterface(new WebAppInterface(this), "Android");
        
      
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
        	settings.setAllowUniversalAccessFromFileURLs(true);
        }
        
        
        
        myWebView.setWebChromeClient(new WebChromeClient()  
	    {  


	        public void openFileChooser(ValueCallback<Uri> uploadMsg) {  
		           mUploadMessage = uploadMsg;

	            Intent i = new Intent(Intent.ACTION_GET_CONTENT);  
	            i.addCategory(Intent.CATEGORY_OPENABLE);  
	            i.setType("image/*");  
	            Main.this.startActivityForResult(Intent.createChooser(i,"File Chooser"), FILECHOOSER_RESULTCODE);  

	           }



	           public void openFileChooser( ValueCallback uploadMsg, String acceptType ) {
	           mUploadMessage = uploadMsg;
	           Intent i = new Intent(Intent.ACTION_GET_CONTENT);
	           i.addCategory(Intent.CATEGORY_OPENABLE);
	           i.setType("*/*");
	           Main.this.startActivityForResult(
	           Intent.createChooser(i, "File Browser"),
	           FILECHOOSER_RESULTCODE);
	           }


	           public void openFileChooser(ValueCallback<Uri> uploadMsg, String acceptType, String capture){
	               mUploadMessage = uploadMsg;  
	               Intent i = new Intent(Intent.ACTION_GET_CONTENT);  
	               i.addCategory(Intent.CATEGORY_OPENABLE);  
	               i.setType("image/*");  
	               Main.this.startActivityForResult( Intent.createChooser( i, "File Chooser" ), Main.FILECHOOSER_RESULTCODE );

	           }

	    });  

        
  

        myWebView.loadUrl("file:///android_asset/index.html");
		
	
        
        
      //------- Web Browser activity
        Cookie sessionCookie = this.cookie;
        CookieSyncManager.createInstance(this);
        CookieManager cookieManager = CookieManager.getInstance();
        if (sessionCookie != null) {
            cookieManager.removeSessionCookie();
            String cookieString = sessionCookie.getName() + "=" + sessionCookie.getValue() + "; domain=" + sessionCookie.getDomain();
            cookieManager.setCookie("file:///android_asset/index.html", cookieString);
            CookieSyncManager.getInstance().sync();
        }   
        
        
	}
 


@Override  
protected void onActivityResult(int requestCode, int resultCode,  
                                   Intent intent) {  
 if(requestCode==FILECHOOSER_RESULTCODE)  
 {  
  if (null == mUploadMessage) return;  
           Uri result = intent == null || resultCode != RESULT_OK ? null  
                   : intent.getData();  
           mUploadMessage.onReceiveValue(result);  
           mUploadMessage = null;  
 }
 }  

	
	 public class WebAppInterface {
	        Context mContext;
 
	        WebAppInterface(Context c) {
	            mContext = c; 
	        }
	 
	        public void supportus() {
 
	        	
	        	Intent intent = new Intent(Intent.ACTION_EDIT); 
				intent.setData(Uri.parse("bazaar://details?id=com.nikmaram.special.telegram")); 
				intent.setPackage("com.farsitel.bazaar"); 
				startActivity(intent); 
				
	        }
	        
	        public void storecookies(){
	        	
	        	 myWebView.loadUrl("javascript:appendText('"+stylestring+"')"); 

	            //After Login
	        	try{
	        		List<Cookie> cookies = httpClient.getCookieStore().getCookies();
	        		for (int i = 0; i < cookies.size(); i++) {
	        			cookie = cookies.get(i);
	        		}
	        	}catch(Exception e){
	        		
	        	}
	        }
	        
	        
	        public void runother(){
	        	
	        	final Handler handler = new Handler();
	        	handler.postDelayed(new Runnable() {
	        	  @Override
	        	  public void run() {
	        		  storecookies();
	        	  }
	        	}, 5000);
	        	
	        	
	        }
	        public void lockscreen(){
	        	
	        	Editor editor = sp.edit();
	        	editor.putString("localpw", sp.getString("slocalpw", ""));
	        	editor.commit();
	        
	        	String status = sp.getString("localpw","");
	    		if(!status.equals("")){
	    			Intent lock = new Intent(Main.this,LockScreen.class);
	            	startActivity(lock);
	    		}
	        	 
	        	
	        }
	        
	        public void setlocalpw(String getpw){
	        	// Toast.makeText(Main.this,getpw.toString()+"", Toast.LENGTH_LONG).show();
	        	Editor editor = sp.edit();
	        	editor.putString("slocalpw", getpw.toString());
	        	editor.putString("localpw", sp.getString("slocalpw", ""));
	        	editor.commit();
	        }
	        
	        public void report(){
	        	
	        	Intent report = new Intent(Main.this,ReportPage.class);
	        	startActivity(report);
	        }
	        public void setbackground(String color){
	        	
	        	Editor editor = sp.edit();
	        	editor.putString("backcolor", color.toString());
	        	editor.commit();	        	 
	        	
	        	//Toast.makeText(Main.this, color+"", Toast.LENGTH_LONG).show();
	        }
	 
	    }
	 public void onBackPressed() {
		    if (myWebView.canGoBack()) {
		    	myWebView.goBack();
		    }
		    else{
		    	super.onBackPressed();
		    }
		}
	 
	 @Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		 	if (keyCode == KeyEvent.KEYCODE_MENU) {
		       return false;
		    } else {
		        return super.onKeyDown(keyCode, event);
		    }
	}
	
}
