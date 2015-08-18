package com.sample.binaryresponse;

import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.text.Editable;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;

import com.worklight.wlclient.api.WLClient;
import com.worklight.wlclient.api.WLResourceRequest;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;

public class MainActivity extends AppCompatActivity {
    private Button buttonInvoke = null;
    private EditText codeInput = null;
    private ImageView imageView = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        WLClient client = WLClient.createInstance(this);

        buttonInvoke = (Button)findViewById(R.id.generate);
        codeInput = (EditText)findViewById(R.id.code);
        imageView = (ImageView)findViewById(R.id.imageView);
        final MainActivity activity = this;

        buttonInvoke.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    Editable input = codeInput.getText();
                    String code = input.toString();
                    URI adapterPath = new URI("/adapters/QR/" + code);
                    WLResourceRequest request = new WLResourceRequest(adapterPath,WLResourceRequest.GET);
                    request.send(new MyInvokeListener(activity));
                } catch (URISyntaxException e) {
                    e.printStackTrace();
                }

            }
        });



    }

    public void setImage(final InputStream input){
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                imageView.setImageBitmap(BitmapFactory.decodeStream(input));
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
