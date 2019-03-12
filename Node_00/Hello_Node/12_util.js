/**
 * Created by weichanglu on 2017/2/17.
 */

/**util 是一个Node.js 核心模块，提供常用函数的集合，用于弥补核心JavaScript 的功能 过于精简的不足。
util.inherits(constructor, superConstructor)是一个实现对象间原型继承 的函数。*/

var util = require('util');
function Base() {
    this.name = 'base';
    this.base = 1993;
    this.sayHello = function(){
        console.log('Hello '+this.name);
    }
}
Base.prototype.showName = function(){
    console.log(this.name);
};
function Sub() {
    this.name = 'sub';
}

util.inherits(Sub, Base);
console.log('\n'+util.inspect('-------------Base-------------',true,null,true));
var objBase = new Base();
objBase.showName();
objBase.sayHello();
console.log(objBase);


console.log('\n'+util.inspect('-------------Sub-------------',true,null,true));
var objSub = new Sub();
objSub.showName();
//objSub.sayHello();
console.log(objSub);
//注意：Sub 仅仅继承了Base 在原型中定义的函数，而构造函数内部创造的 base 属 性和 sayHello 函数都没有被 Sub 继承。
//同时，在原型中定义的属性不会被console.log 作为对象的属性输出。

console.log('\n'+util.inspect('--------util.inspect----------',true,null,true));
//util.inspect(object,[showHidden],[depth],[colors])是一个将任意对象转换 为字符串的方法，通常用于调试和错误输出。
// 它至少接受一个参数 object，即要转换的对象
//showHidden 是一个可选参数，如果值为 true，将会输出更多隐藏信息。
//depth 表示最大递归的层数，如果对象很复杂，你可以指定层数以控制输出信息的多 少。
// 如果不指定depth，默认会递归2层，指定为 null 表示将不限递归层数完整遍历对象。
// 如果color 值为 true，输出格式将会以ANSI 颜色编码，通常用于在终端显示更漂亮 的效果。
//特别要指出的是，util.inspect 并不会简单地直接把对象转换为字符串，即使该对 象定义了toString 方法也不会调用。
function Person() {
    this.name = '张三';
    this.toString = function() {
        return this.name;
    }
}
var objPerson = new Person();
console.log(util.inspect(objPerson));
console.log(util.inspect(objPerson, true));
console.log(util.inspect(objPerson,true, null, true));


console.log('\n'+util.inspect('util.isArray(object)如果给定的参数 "object" 是一个数组返回true，否则返回false。',true,null,true));
console.log(util.isArray([]));// true
console.log(util.isArray(new Array));// true
console.log(util.isArray({}));// false

console.log('\n'+util.inspect('util.isRegExp(object)如果给定的参数 "object" 是一个正则表达式返回true，否则返回false。',true,null,true));
console.log(util.isRegExp(/some regexp/));// true
console.log(util.isRegExp(new RegExp('another regexp')));// true
console.log(util.isRegExp({}));//false

console.log('\n'+util.inspect('util.isDate(object)如果给定的参数 "object" 是一个日期返回true，否则返回false.',true,null,true));
console.log(new Date());
console.log(util.isDate(new Date()));
console.log(Date());
console.log(util.isDate(Date()));//false (without 'new' returns a String)
console.log(util.isDate({}));// false

console.log('\n'+util.inspect('util.isError(object)如果给定的参数 "object" 是一个错误对象返回true，否则返回false。',true,null,true));
console.log(util.isError(new Error()));// true
console.log(util.isError(new TypeError()));// true
console.log(util.isError({ name: 'Error', message: 'an error occurred' }));// false
