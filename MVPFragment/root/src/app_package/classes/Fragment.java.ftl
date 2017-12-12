package ${packageName}.fragment;

import android.app.Activity;
import android.support.v4.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;

import ${applicationPackage}.R;
import ${packageName}.view.${viewClass};
import ${packageName}.presenter.${presenterClass};


public class ${activityClass} extends BaseLazyFragment<${viewClass} ,${presenterClass}> implements ${viewClass}
{

	@Override
    protected ${presenterClass} createPresenterInstance() {
        return new ${presenterClass}();
    }

    @Override
    protected int getLayoutId() {
        return R.layout.${layoutName};
    }

   @Override
    protected void onViewCreated() {
    }

    public static ${activityClass} newInstance() {
        ${activityClass} fragment = new ${activityClass}();
        return fragment;
    }

}
