
console.log('资料:http://www.runoob.com/nodejs/nodejs-router.html');

console.log("Hello World");
function say(word) {
    console.log(word);
}
function execute(someFunction, value) {
    someFunction(value);
}
execute(say, "Hello=====");

//匿名函数
function execute(someFunction, value) {
    someFunction(value);
}
execute(function(word){ console.log(word) }, "Hello----");

//http
var http = require("http");
function onRequest(request, response) {
    response.writeHead(200, {"Content-Type": "text/plain"});
    response.write("Hello World+++++");
    response.end();
}
http.createServer(onRequest).listen(8888);
console.log('在浏览器中执行:http://127.0.0.1:8888/');
