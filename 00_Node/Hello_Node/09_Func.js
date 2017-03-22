/**
 * Created by weichanglu on 2017/2/17.
 */
//一个函数可以作为另一个函数的一个参数
function say(world){
    console.log('hello-hello '+ world);
};
function execute(someFunction, value){
    someFunction(value);
}
execute(say, 'World!!!');

//匿名函数
//直接在另一个函数的括号中定义和传递这个函数
execute(function(world){console.log('您好,'+world)}, 'WORLD');

//函数传递是如何让HTTP服务器工作的
var http = require('http');

http.createServer(function(request,response){
    response.writeHead(200, {'Content-Type':'text/plain'});
    response.write('响应数据 ->data');
    response.end();
}).listen(8080);
console.log('浏览器1 : http://localhost:8080');

function onRequest(request, response){
    response.writeHead(200, {'Content-Type':'text/plain'});
    response.write('data <-响应数据');
    response.end();
}
http.createServer(onRequest).listen(8888);
console.log('浏览器2 : http://localhost:8888');
