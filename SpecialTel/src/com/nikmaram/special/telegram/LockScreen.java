package com.nikmaram.special.telegram;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class LockScreen extends Activity{

	private TextView txt1,txt2;
	private Button login;
	private EditText field;
	
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		
		requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
            WindowManager.LayoutParams.FLAG_FULLSCREEN);
        
        
		setContentView(R.layout.lockscreen);
		
		txt1 = (TextView) findViewById(R.id.lockscreen_txt1);
		txt1.setTypeface(Main.sans);
		txt1.setTextSize(12);
		txt2 = (TextView) findViewById(R.id.lockscreen_txt2);
		txt2.setTypeface(Main.sans);
		txt2.setTextSize(12);
		login = (Button) findViewById(R.id.lockscreen_btn);
		login.setTypeface(Main.sans);
		login.setTextSize(12);
		field = (EditText) findViewById(R.id.lockscreen_field);
		field.setTypeface(Main.sans);
		field.setTextSize(12);
		
		login.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				if(field.length() > 0){
					String status = Main.sp.getString("localpw", "");
					if(status.equals(field.getText().toString())){
						
						Editor editor = Main.sp.edit();
						editor.putString("localpw", "");
						editor.commit();
						
						Intent lock = new Intent(LockScreen.this,Main.class);
			        	startActivity(lock);
			        	finish();
					}
				}
				
			}
		});
		
		
	}
	
	@Override
	public void onBackPressed() {
		// TODO Auto-generated method stub
	//	super.onBackPressed();
	}
}
