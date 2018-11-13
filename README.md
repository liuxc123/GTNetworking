# GTNetworking

GTNetworking是根据GTNetwork更改的，更改了自己的命名规范，是基于 [AFNetworking][AFNetworking] 封装的 iOS 网络库，其实现了一套 High Level 的 API，提供了更高层次的网络访问抽象。

## GTNetworking 提供了哪些功能

相比 AFNetworking，GTNetworking 提供了以下更高级的功能：

* 支持按时间缓存网络请求内容
* 支持按版本号缓存网络请求内容
* 支持统一设置服务器和 CDN 的地址
* 支持检查返回 JSON 内容的合法性
* 支持文件的断点续传
* 支持 `block` 和 `delegate` 两种模式的回调方式
* 支持批量的网络请求发送，并统一设置它们的回调（实现在 `GTBatchRequest` 类中）
* 支持方便地设置有相互依赖的网络请求的发送，例如：发送请求 A，根据请求 A 的结果，选择性的发送请求 B 和 C，再根据 B 和 C 的结果，选择性的发送请求 D。（实现在 `GTChainRequest` 类中）
* 支持网络请求 URL 的 filter，可以统一为网络请求加上一些参数，或者修改一些路径。
* 定义了一套插件机制，可以很方便地为 GTNetwork 增加功能。猿题库官方现在提供了一个插件，可以在某些网络请求发起时，在界面上显示“正在加载”的 HUD。

## GTNetworking 的基本思想

GTNetworking 的基本的思想是把每一个网络请求封装成对象。所以使用 GTNetworking，你的每一个请求都需要继承 `GTRequest` 类，通过覆盖父类的一些方法来构造指定的网络请求。

把每一个网络请求封装成对象其实是使用了设计模式中的 Command 模式，它有以下好处：

* 将网络请求与具体的第三方库依赖隔离，方便以后更换底层的网络库。
* 方便在基类中处理公共逻辑，例如猿题库的数据版本号信息就统一在基类中处理。
* 方便在基类中处理缓存逻辑，以及其它一些公共逻辑。
* 方便做对象的持久化。



## Requirements

## 安装

你可以在 Podfile 中加入下面一行代码来使用 GTNetworking


```ruby
pod 'GTNetworking'
```

## 作者

liuxc123, lxc_work@126.com

## 协议

GTNetworking is available under the MIT license. See the LICENSE file for more info.
