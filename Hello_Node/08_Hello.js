/**
 * Created by weichanglu on 2017/2/17.
 */

exports.world = function(){
    console.log('helloworld!!!');
};

function Hello2(){
    var name;
    this.setName = function(thyName){
        name = thyName;
    };
    this.sayHello = function(){
        console.log('HELLO  ' + name);
    };
};
module.exports = Hello2;