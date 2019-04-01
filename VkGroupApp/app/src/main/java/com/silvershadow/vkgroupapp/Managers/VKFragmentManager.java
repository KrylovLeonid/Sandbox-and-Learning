package com.silvershadow.vkgroupapp.Managers;

import android.support.annotation.IdRes;
import android.support.v4.app.FragmentTransaction;

import com.silvershadow.vkgroupapp.Ui.Activity.BaseActivity;
import com.silvershadow.vkgroupapp.Ui.Fragments.BaseFragment;

import java.util.Stack;

public class VKFragmentManager {
    private static final int EMPTY_FRAGMENT_STACK_SIZE = 1;

    private Stack<BaseFragment> mFragmentStack = new Stack<>();
    private BaseFragment mCurrentFragment;

    public void setFragment (BaseActivity activity, BaseFragment fragment, @IdRes int containerId){
        if (activity != null && !activity.isFinishing() && !contains(fragment)) {
            FragmentTransaction transaction = createAddTransaction(activity,fragment,false);
            transaction.replace(containerId,fragment);
            commitAddTransaction(activity, fragment, transaction, false);
        }
    }

    public void addFragment (BaseActivity activity, BaseFragment fragment, @IdRes int containerId){
        if (activity != null && !activity.isFinishing() && !contains(fragment)) {
            FragmentTransaction transaction = createAddTransaction(activity, fragment,true);
            transaction.add(containerId, fragment);
            commitAddTransaction(activity, fragment, transaction, true);
        }
    }

    public boolean removeFragment(BaseActivity activity, BaseFragment fragment){
        boolean canBeRemoved = fragment != null && mFragmentStack.size() > EMPTY_FRAGMENT_STACK_SIZE;

        if(canBeRemoved){
            FragmentTransaction transaction = activity.getSupportFragmentManager().beginTransaction();
            mFragmentStack.pop();
            mCurrentFragment = mFragmentStack.lastElement();
            transaction.remove(fragment);
            commitTransaction(activity,transaction);
        }
        return canBeRemoved;
    }

    public boolean removeCurrentFragment(BaseActivity activity){
        return removeFragment(activity, mCurrentFragment);
    }


    private FragmentTransaction createAddTransaction(BaseActivity activity, BaseFragment fragment, boolean addToBackstack){
        FragmentTransaction fragmentTransaction = activity.getSupportFragmentManager().beginTransaction();

        if(addToBackstack)
            fragmentTransaction.addToBackStack(fragment.getTag());

        return fragmentTransaction;
    }

    private void commitAddTransaction(BaseActivity activity, BaseFragment fragment, FragmentTransaction transaction, boolean addToBackStack){
        if(transaction != null) {
            mCurrentFragment = fragment;
            if (!addToBackStack)
                mFragmentStack = new Stack<>();
            mFragmentStack.add(fragment);
            commitTransaction(activity, transaction);
        }
    }

    private void commitTransaction (BaseActivity activity, FragmentTransaction transaction){
        transaction.commit();
        activity.fragmentOnScreen(mCurrentFragment);
    }

    public boolean contains(BaseFragment baseFragment){
        if (baseFragment == null)
            return false;
        return mCurrentFragment != null && mCurrentFragment.getClass().getName().equals(baseFragment.getClass().getName());
    }
}
