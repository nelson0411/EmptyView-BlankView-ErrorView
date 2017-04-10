# EmptyView-BlankView-ErrorView
EmptyView BlankView ErrorView

在项目中展示空数据页，或者错误页，无网络页等。<br>

```objective-c
//-----type 1-----
//show的位置放哪里都可以，无所谓。
//[self.view showBlankPageView];
[self.view showErrorPageView];
```

```objective-c
//-----type 2-----
//self.view.errorSubTitle = @"副标题";
//self.view.errorButtonTitle = @"点击刷新";
self.view.blankSubTitle = @"副标题";
self.view.blankButtonTitle = @"点击刷新";
```

```objective-c
//-----type 3-----
//self.view.errorImageName = @"icon_no_data";
//self.view.errorPreTitle = @"标题";
//self.view.errorSubTitle = @"副标题";
//self.view.errorButtonTitle = @"点击刷新";
self.view.blankImageName = @"icon_no_data";
self.view.blankPreTitle = @"标题";
self.view.blankSubTitle = @"副标题";
self.view.blankButtonTitle = @"点击刷新";
```


```objective-c
//-----type 4-----
[self.view configReloadAction:^{
    NSLog(@"ReloadAction");
}];
```
