package com.silvershadow.vkgroupapp.Ui.Activity;

import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.widget.FrameLayout;


import com.arellomobile.mvp.MvpAppCompatActivity;
import com.silvershadow.vkgroupapp.Managers.VKFragmewntManager;
import com.silvershadow.vkgroupapp.R;
import com.silvershadow.vkgroupapp.Ui.Fragments.BaseFragment;

public abstract class BaseActivity extends MvpAppCompatActivity {

    VKFragmewntManager mFragmewntManager;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_base);
        Toolbar toolbar = (Toolbar) findViewById(R.id.tooolbar);
        setSupportActionBar(toolbar);

        mFragmewntManager = new VKFragmewntManager();

        FrameLayout parent = findViewById(R.id.main_wrapper);
        getLayoutInflater().inflate(getMainContentLayout(), parent);
    }

    protected abstract int getMainContentLayout();

    public void fragmentOnScreen(BaseFragment fragment){

    }
}
