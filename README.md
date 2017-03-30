# EmtyView-BlankView-ErrorView
EmtyView BlankView ErrorView

在项目中展示空数据页，或者错误页，无网络页等。<br>

//-----type 1-----<br>
//show的位置放哪里都可以，无所谓。<br>
//[self.view showBlankPageView];<br>
[self.view showErrorPageView];<br>

//-----type 2-----<br>
//self.view.errorSubTitle = @"副标题";<br>
//self.view.errorButtonTitle = @"点击刷新";<br>
self.view.blankSubTitle = @"副标题";<br>
self.view.blankButtonTitle = @"点击刷新";<br>
<br><br>
//-----type 3-----<br>
//self.view.errorImageName = @"icon_no_data";<br>
//self.view.errorPreTitle = @"标题";<br>
//self.view.errorSubTitle = @"副标题";<br>
//self.view.errorButtonTitle = @"点击刷新";<br>
self.view.blankImageName = @"icon_no_data";<br>
self.view.blankPreTitle = @"标题";<br>
self.view.blankSubTitle = @"副标题";<br>
self.view.blankButtonTitle = @"点击刷新";<br>
<br><br>
//-----type 4-----<br>
[self.view configReloadAction:^{<br>
NSLog(@"ReloadAction");<br>
}];<br>
