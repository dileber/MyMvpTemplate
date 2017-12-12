<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    xmlns:tools="http://schemas.android.com/tools"
    android:orientation="vertical"
    app:swipe_style="classic"
    android:fitsSystemWindows="true"
    android:clipChildren="true"
    tools:context="${packageName}.activity.${activityClass}">
    <com.xiaohe.baonahao_school.widget.TitleBar
        android:id="@+id/titleBar"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        app:tbBottomDividerEnable="true"
        app:tbTitle="${listName}" />
    <include layout="@layout/include_recycleview_emptypage"/>
</LinearLayout>
