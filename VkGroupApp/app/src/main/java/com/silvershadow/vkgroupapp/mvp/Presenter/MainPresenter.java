package com.silvershadow.vkgroupapp.mvp.Presenter;

import com.arellomobile.mvp.InjectViewState;
import com.arellomobile.mvp.MvpPresenter;
import com.silvershadow.vkgroupapp.CurrentUser;
import com.silvershadow.vkgroupapp.mvp.View.MainView;

@InjectViewState
public class MainPresenter extends MvpPresenter<MainView> {
    public void checkAuth(){
        if(!CurrentUser.isAuthorized())
            getViewState().startSigningIn();
        else
            getViewState().signedIn();
    }
}
