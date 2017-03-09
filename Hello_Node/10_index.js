/**
 * Created by weichanglu on 2017/2/17.
 */

var server = require("./10_server");
var router = require("./10_router");
server.start(router.route);
//server.start();
