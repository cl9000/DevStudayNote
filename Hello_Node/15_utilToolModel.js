/**
 * Created by weichanglu on 2017/3/8.
 */
/**在 Node.js 模块库中有很多好用的模块。接下来我们为大家介绍几种常用模块的使用：
 序号	模块名          & 描述
 1	    OS 模块       提供基本的系统操作函数。
 2	    Path 模块     提供了处理和转换文件路的工具。
 3	    Net 模块      用于底层的网络通信。提供了服务端和客户端的的操作。
 4	    DNS 模块      用于解析域名。
 5	    Domain 模块   简化异步代码的异常处理，可以捕捉处理try catch无法捕捉的。*/

/** *****************************************Node.js OS 模块 start*****************************************************/
//Node.js OS 模块
/*Node.js os 模块提供了一些基本的系统操作函数。我们可以通过以下方式引入该模块：var os = require("os")*/
/*序号	方法                       & 描述
 1	    os.tmpdir()         返回操作系统的默认临时文件夹。
 2	    os.endianness()     返回 CPU 的字节序，可能的是 "BE" 或 "LE"。
 3	    os.hostname()       返回操作系统的主机名。
 4	    os.type()           返回操作系统名
 5	    os.platform()       返回操作系统名
 6	    os.arch()           返回操作系统 CPU 架构，可能的值有 "x64"、"arm" 和 "ia32"。
 7	    os.release()        返回操作系统的发行版本。
 8	    os.uptime()         返回操作系统运行的时间，以秒为单位。
 9	    os.loadavg()        返回一个包含 1、5、15 分钟平均负载的数组。
 10	    os.totalmem()       返回系统内存总量，单位为字节。
 11	    os.freemem()        返回操作系统空闲内存量，单位是字节。
 12	    os.cpus()           返回一个对象数组，包含所安装的每个 CPU/内核的信息：型号、速度（单位 MHz）、时间（一个包含 user、nice、sys、idle 和 irq 所使用 CPU/内核毫秒数的对象）。
 13	    os.networkInterfaces() 获得网络接口列表。*/
/** 实例: */
var os = require("os");

// CPU 的字节序
console.log('CPU 的字节序 : ' + os.endianness());

// 操作系统名
console.log('操作系统名 : ' + os.type());

// 操作系统名
console.log('操作系统名 : ' + os.platform());

// 系统内存总量
console.log('系统内存总量 : ' + os.totalmem() + " bytes.");

// 操作系统空闲内存量
console.log('操作系统空闲内存量 : ' + os.freemem() + " bytes.");

/** *****************************************Node.js OS 模块 end *****************************************************/

/** *****************************************Node.js Path 模块 start *****************************************************/
//Node.js Path 模块
/*Node.js path 模块提供了一些用于处理文件路径的小工具，我们可以通过以下方式引入该模块：var path = require("path")*/
/** 实例: */
var path = require("path");

// 格式化路径
console.log('格式化路径 : ' + path.normalize('/test/test1//2slashes/1slash/tab/..'));

// 连接路径
console.log('连接路径 : ' + path.join('/test', 'test1', '2slashes/1slash', 'tab', '..'));

// 转换为绝对路径
console.log('转换为绝对路径 : ' + path.resolve('main.js'));

// 路径中文件的后缀名
console.log('路径中文件的后缀名 : ' + path.extname('main.js'));
/** *****************************************Node.js Path 模块 end *****************************************************/

/** *****************************************Node.js Net 模块 start *****************************************************/
//Node.js Net 模块
/*Node.js Net 模块提供了一些用于底层的网络通信的小工具，包含了创建服务器/客户端的方法，我们可以通过以下方式引入该模块：var net = require("net")*/
var net = require('net');

var data={"name":"1111","lastname":"2222"};
var server = net.createServer(function(connection) {
    console.log('client connected');
    connection.on('end', function() {
        console.log('客户端关闭连接');
    });
    connection.write(data);
    connection.pipe(connection);
});
server.listen(8080, function() {
    console.log('server is listening');
});
/** *****************************************Node.js Net 模块 end *****************************************************/

/** *****************************************Node.js DNS 模块 start *****************************************************/
//Node.js DNS 模块
/*Node.js DNS 模块用于解析域名。引入 DNS 模块语法格式如下：var dns = require("dns")*/
var dns = require('dns');

dns.lookup('www.github.com', function onLookup(err, address, family) {
    console.log('ip 地址:', address);
    dns.reverse(address, function (err, hostnames) {
        if (err) {
            console.log(err.stack);
        }
        console.log('反向解析 ' + address + ': ' + JSON.stringify(hostnames));
    });
});
/** *****************************************Node.js DNS 模块 end *****************************************************/

/** *****************************************Node.js Domain 模块 start *****************************************************/
//Node.js Domain(域) 简化异步代码的异常处理，可以捕捉处理try catch无法捕捉的异常。引入 Domain 模块 语法格式如下：var domain = require("domain")
/*domain模块，把处理多个不同的IO的操作作为一个组。注册事件和回调到domain，当发生一个错误事件或抛出一个错误时，domain对象会被通知，不会丢失上下文环境，也不导致程序错误立即推出，与process.on('uncaughtException')不同。
 Domain 模块可分为隐式绑定和显式绑定：
 隐式绑定: 把在domain上下文中定义的变量，自动绑定到domain对象
 显式绑定: 把不是在domain上下文中定义的变量，以代码的方式绑定到domain对象*/
var EventEmitter = require("events").EventEmitter;
var domain = require("domain");

var emitter1 = new EventEmitter();

// 创建域
var domain1 = domain.create();

domain1.on('error', function(err){
    console.log("domain1 处理这个错误 ("+err.message+")");
});

// 显式绑定
domain1.add(emitter1);

emitter1.on('error',function(err){
    console.log("监听器处理此错误 ("+err.message+")");
});

emitter1.emit('error',new Error('通过监听器来处理'));

emitter1.removeAllListeners('error');

emitter1.emit('error',new Error('通过 domain1 处理'));

var domain2 = domain.create();

domain2.on('error', function(err){
    console.log("domain2 处理这个错误 ("+err.message+")");
});

// 隐式绑定
domain2.run(function(){
    var emitter2 = new EventEmitter();
    emitter2.emit('error',new Error('通过 domain2 处理'));
});


domain1.remove(emitter1);
emitter1.emit('error', new Error('转换为异常，系统将崩溃!'));
