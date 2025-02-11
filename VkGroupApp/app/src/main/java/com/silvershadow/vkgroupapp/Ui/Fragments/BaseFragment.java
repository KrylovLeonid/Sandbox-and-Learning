package com.silvershadow.vkgroupapp.Ui.Fragments;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.arellomobile.mvp.MvpAppCompatFragment;

public abstract class BaseFragment extends MvpAppCompatFragment {
    protected abstract int getMainContentLayout();
    @StringRes
    public abstract int onCreateToolbarTitle();

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(getMainContentLayout(), container, false);
    }

    public String createToolbarTitle(Context context){
        return context.getString(onCreateToolbarTitle());
    }
}
