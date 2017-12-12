package ${packageName}.activity;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;

import ${applicationPackage}.R;
import ${packageName}.view.${viewClass};
import ${packageName}.presenter.${presenterClass};


public class ${activityClass} extends BaseActivity<${viewClass} ,${presenterClass}> implements ${viewClass}
{

	public static void startFrom(Context context) {
        LauncherManager.getLauncher().launch((Activity) context, ${activityClass}.class);
    }


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
        super.onViewCreated();
    }

}
