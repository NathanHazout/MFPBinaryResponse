package com.sample.binaryresponse;

import android.util.Log;

import com.worklight.wlclient.api.WLHttpResponseListener;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by nathanh on 8/18/15.
 */
public class MyInvokeListener implements WLHttpResponseListener {
    private static final String TAG = "MyInvokeListener";
    private MainActivity activity = null;

    public MyInvokeListener(MainActivity activity) {
        Log.v(TAG, "MyInvokeListener constructor");
        this.activity = activity;
    }

    @Override
    public void onFailure(HttpResponse httpResponse, Exception e) {
        Log.v(TAG, "onFailure");
    }

    @Override
    public void onSuccess(HttpResponse httpResponse) {
        Log.v(TAG, "onSuccess");
        HttpEntity entity = httpResponse.getEntity();
        try {
            InputStream content = entity.getContent();
            activity.setImage(content);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
