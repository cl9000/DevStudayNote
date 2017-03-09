/**
 * Created by weichanglu on 2017/2/16.
 */
//Node Buffer 类可以通过多种方式来创建
//方法一:创建长度为10字节的buffe实例
    var buf0 = new Buffer(10);
console.log(buf0);

//方法二:通过给定数组创建buffer
    var buf1 = new Buffer([10,11,12,40,50]);
console.log(buf1);
//方法三:通过一个字符串创建实例
    var buf2 = new Buffer('buffer');
console.log(buf2);

//写入缓冲区
len = buf0.write('helloworld您好,世界- www.cl9000.github.io');
console.log("写入字节数: "+ len);

console.log("读取buffer: "+ buf0.toString());

var buf3 = new Buffer(26);
for(var i=0; i<26; i++){
    buf3[i] = i+65;
}
console.log( buf3.toString('ascii'));       // 输出: abcdefghijklmnopqrstuvwxyz
console.log( buf3.toString('ascii',0,5));   // 输出: abcde
console.log( buf3.toString('utf8',0,5));    // 输出: abcde
console.log( buf3.toString(undefined,0,5)); // 使用 'utf8' 编码, 并输出: abcde

//buf转换为JSON对象
var buf = new Buffer('helloWorld-abcd');
var json = buf2.toJSON(buf2);
console.log(json);
console.log("buf2转为JSON: "+ JSON.stringify(json));

//buffer 的合并
var buffer1 = new Buffer('HELLO');
var buffer2 = new Buffer('您好');
var buffer3 = Buffer.concat([buffer1, buffer2]);
console.log("合并后为: "+ buffer3.toString());

//buffer 的比较
var buffer4 = new Buffer('ad');
var buffer5 = new Buffer('abcd');
var result = buffer4.compare(buffer5);
console.log('相同:0  不同:-1,1;结果为: '+result);
if (result < 0){
    console.log('不同 '+result);
}else if(result == 0){
    console.log('相同 ');
}else {
    console.log('不同 '+result);
}

//buffer拷贝
var buffer6 = new Buffer('ABCDEF');
var buffer7 = new Buffer(8);
buffer6.copy(buffer7);
console.log('拷贝到buffer7中的内容:'+buffer7.toString());

//buffer 裁剪
var buffer8 = buffer6.slice(1,3);//第一个参数为开始下标 第二个参数为截取的下标(不包含当前)
console.log('裁剪后的buffer8为: '+buffer8.toString());
var buffer9 = buffer6.slice(0,-5);//第一个参数为开始下标 第二个参数为截取的下标(不包含当前)
console.log('裁剪后的buffer9为: '+buffer9.toString());

//缓冲区长度 .length
//返回 Buffer 对象所占据的内存长度
console.log(buffer6.length);