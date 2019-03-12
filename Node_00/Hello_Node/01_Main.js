var fs = require("fs");

var data = fs.readFileSync('input.txt');
console.log(data.toString());
console.log("阻塞代码程序执行结束1");

console.log("=============分割线0============");
var fs0 = require("fs");

fs0.readFile('input.txt', function (err, data0) {
	if (err) return console.error(err);
	console.log(data0.toString());
});
console.log("非阻塞程序执行结束2");

console.log('\n-----------分割线01-----------');
var fs2 = require("fs");
fs2.readFile('input.txt', function (err, data) {
	if (err){
		console.log(err.stack);
		return;
	}
	console.log(data.toString());
});
console.log("程序执行完毕");

