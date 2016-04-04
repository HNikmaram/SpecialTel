package com.nikmaram.special.telegram;

import java.util.Timer;
import java.util.TimerTask;

import android.app.Activity;
import android.app.ProgressDialog;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class ReportPage extends Activity{
	public static String result = "";
	private Button send,cancel;
	private TextView name,subject;
	private TextView msg;
	
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		
		requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
            WindowManager.LayoutParams.FLAG_FULLSCREEN);
        
		setContentView(R.layout.reportpage);
		
		send = (Button) findViewById(R.id.report_send);
		send.setTypeface(Main.sans);
		send.setTextSize(12);
		name = (TextView) findViewById(R.id.report_name);
		name.setTypeface(Main.sans);
		name.setTextSize(12);
		subject = (TextView) findViewById(R.id.report_subject);
		subject.setTypeface(Main.sans);
		subject.setTextSize(12);
		msg = (TextView) findViewById(R.id.report_msg);
		msg.setTypeface(Main.sans);
		msg.setTextSize(12);
		send.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				if(name.length() > 0 && subject.length() > 0 && msg.length()>0){
					sreport(name.getText().toString(),subject.getText().toString(),msg.getText().toString());
				}				
			}
		});

		
	}
	
	 public void sreport(String name,String subject,String msg){
		 

	     	new Report(name,subject,msg).execute();
	 		
	 		final ProgressDialog pd = new ProgressDialog(ReportPage.this);
	 		pd.setMessage("لطفا صبر کنید");
	 		pd.show();
	 		
	 		final Timer timer = new Timer();
	 		
	 		timer.schedule(new TimerTask() {
	 			
	 			public void run() {
	 				runOnUiThread(new Runnable() {
	 					public void run() {
	 						if(!result.equals("")){
	 							
	 							if(result.equals("ok")){
	 								timer.cancel();
		 							pd.cancel();
		 							result = "";
		 							Toast.makeText(ReportPage.this, "گزارش تخلف با موفیت ارسال شد", Toast.LENGTH_LONG).show();
	 							}
	 							
	 						}
	 						
	 						
	 					}
	 				});
	 			}
	 		}, 0, 500);
	 		
	 		
		 }

}
