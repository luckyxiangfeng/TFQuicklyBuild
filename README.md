# TFQuicklyBuild
三五成群，一人撑天。
三五(ThreeFive)TF框架，简单配置Plist文件，一行代码搞定主框架

版本1.0
使用教程：

第一步将TFFramework整个文件夹加入你的工程


第二步创建你的UIViewController


第三步将修改Plist文件，配置成你需要的项目样式

加入代码：
    TFConfig *tfConfig  = [[TFConfig alloc] init];
    [tfConfig setPlist:@"TFPropertyList" window:self.window];
    
    
    搞定有木有

未来将有更多更方便的版本哦，敬请期待....

