package com.nikmaram.special.telegram;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import android.os.AsyncTask;

public class Report extends AsyncTask{
	
	private String NAME,SUBJECT,MSG;

public Report(String ename,String esubject,String emsg){
	NAME = ename;
	SUBJECT = esubject;
	MSG = emsg;
	

}

protected Object doInBackground(Object... arg0) {


	
	try{
	

		
		String data = "name="+NAME+"&subject="+SUBJECT+"&msg="+MSG;
		URL log = new URL("http://nikmaram.ir/apps/telegroplus/send.php");
		URLConnection con = log.openConnection();

		   
		   
		con.setDoOutput(true);
		
		OutputStreamWriter w = new OutputStreamWriter(con.getOutputStream());
		w.write(data);
		w.close();
		
		BufferedReader r = new BufferedReader(new InputStreamReader(con.getInputStream()));
		StringBuilder sb = new StringBuilder();
		
		String line = null;
		
		while((line = r.readLine()) != null){
			sb.append(line);
		}
		ReportPage.result = sb.toString();
	}catch(Exception e){
		
	}
	

	
	return null;
}


}
