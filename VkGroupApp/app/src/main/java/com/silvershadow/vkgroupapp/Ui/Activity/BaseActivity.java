package com.silvershadow.vkgroupapp.Ui.Activity;

import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.widget.FrameLayout;


import com.arellomobile.mvp.MvpAppCompatActivity;
import com.silvershadow.vkgroupapp.Managers.VKFragmentManager;
import com.silvershadow.vkgroupapp.R;
import com.silvershadow.vkgroupapp.Ui.Fragments.BaseFragment;

public abstract class BaseActivity extends MvpAppCompatActivity {

    VKFragmentManager mFragmentManager;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_base);
        Toolbar toolbar = (Toolbar) findViewById(R.id.tooolbar);
        setSupportActionBar(toolbar);

        mFragmentManager = new VKFragmentManager();

        FrameLayout parent = findViewById(R.id.main_wrapper);
        getLayoutInflater().inflate(getMainContentLayout(), parent);
    }

    protected abstract int getMainContentLayout();

    public void fragmentOnScreen(BaseFragment fragment){
        setToolbarTitle(fragment.createToolbarTitle(this));
    }

    public void setToolbarTitle(String title){
        if(getSupportActionBar() != null){
            getSupportActionBar().setTitle(title);
        }
    }

    public void setContent(BaseFragment fragment){
        mFragmentManager.setFragment(this, fragment, R.id.main_wrapper);
    }

    public void addContent(BaseFragment fragment){
        mFragmentManager.addFragment(this,  fragment, R.id.main_wrapper);
    }

    public boolean removeFragment(BaseFragment fragment){
        return mFragmentManager.removeFragment(this, fragment);
    }

    public boolean removeCurrentFragment(){
        return mFragmentManager.removeCurrentFragment(this);
    }

    @Override
    public void onBackPressed() {
        removeCurrentFragment();
    }
}
