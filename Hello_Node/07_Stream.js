/**
 * Created by weichanglu on 2017/2/16.
 */
/**
 * Stream 是一个抽象接口，Node 中有很多对象实现了这个接口。
 * 例如，对http 服务器发起请求的request 对象就是一个 Stream，还有stdout（标准输出).
 */

//从流中读取数据
var fs = require('fs');
var data = '';

//创建可读流
var readerStream = fs.createReadStream('input.txt');
readerStream.setEnCode = 'utf8';
//处理流事件--->  data, end, error
readerStream.on('data', function(chunk){
    data += chunk;
    //console.log('!!!'+chunk.toString());
});
readerStream.on('end', function(){
    console.log(data);
});
readerStream.on('error',function(err){
    console.log(err.stack);
});
console.log('读取流程序执行完毕');


//写入流
data = '写入的数据:123456789';
// 创建一个可以写入的流，写入到文件 output.txt 中
var writerStream = fs.createWriteStream('output.txt');
// 使用 utf8 编码写入数据
writerStream.write(data,'utf8');
// 标记文件末尾
writerStream.end();

// 处理流事件 --> data, end, error
writerStream.on('finish',function(){
    console.log('写入完成');
});
writerStream.on('error',function(err){
    console.log(err.stack);
});
console.log('写入流程序执行完毕');



var fs2 = require("fs");
// 创建一个可读流
var readerStream2 = fs2.createReadStream('input.txt');
// 创建一个可写流
var writerStream2 = fs2.createWriteStream('output.txt');

// 管道读写操作
// 读取 input.txt 文件内容，并将内容写入到 output.txt 文件中
readerStream2.pipe(writerStream2);
console.log('管道流程序执行完毕');


//链式流
//链式是通过连接输出流到另外一个流并创建多个对个流操作链的机制。链式流一般用于管道操作。
//接下来我们就是用管道和链式来 压缩 和 解压 文件。

var fs = require("fs");
var zlib = require('zlib');
// 压缩 input.txt 文件为 input.txt.gz
fs.createReadStream('input.txt')
    .pipe(zlib.createGzip())
    .pipe(fs.createWriteStream('input.txt.gz'));
console.log("文件压缩完成。");

//压缩和解压不能同时进行,此处加个延迟
setTimeout(function() {
    var fs = require("fs");
    var zlib = require('zlib');
    //解压 input.txt.gz 文件为 input.txt
    fs.createReadStream('input.txt.gz')
        .pipe(zlib.createGunzip())
        .pipe(fs.createWriteStream('input2.txt'));
    console.log("文件解压完成。");
}, 2000);
