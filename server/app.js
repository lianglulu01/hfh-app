//功能:服务器程序
//1:引入四个模块
const express = require("express"); //web服务器模块
const mysql = require("mysql");//mysql模块
const session = require("express-session");//session模块
const cors = require("cors");//跨域
const bodyParser = require('body-parser')  //中间件 获取post提交的数据

//2:创建连接池
var pool = mysql.createPool({
    host:"127.0.0.1",
    user:"root",
    password:"",
    database:"hfh",
    port:3306,
    connectionLimit:15
})
//3:创建web服务器
var server = express();
//4:配置跨域模块
//4.1:允许程序列表 脚手架
//4.2:每次请求验证
server.use(cors({
    origin:["http://127.0.0.1:8080","http://localhost:8080"],
    credentials:true 
}))
// 配置bodyParser中间件
var urlParser = bodyParser.urlencoded({extended:false})
//5:指定静态资源目录 public
server.use(express.static("public"));
//6:配置session对象 !!!
server.use(session({
    secret:"128位安全字符串",  //加密的字符串
    resave:true,        //每次请求都更新数据
    saveUninitialized:true,    //保存初始化数据
}));

//7:为服务器绑定监听端口 4000
server.listen(4000);
console.log("服务器启动...")

// 0:用户注册
server.post('/register',urlParser,(req,res)=>{
    // 这里是post请求 无法以req.query.xxx;方式获取
    var uname=req.body.uname
    var upwd=req.body.upwd
    console.log(uname+' _ '+upwd)
    // 因为用户名应该是唯一的 所以注册前检测用户名是否已存在  不存在插入 存在产生合理错误
    var sql = 'SELECT COUNT(id) AS count FROM hfh_user WHERE uname=?'
    pool.query(sql,uname,(err,result)=>{
        if(err) throw err;
        console.log(result[0].count)
        if(!result[0].count){
            var sql = "INSERT INTO hfh_user(uname,upwd) VALUE(?,MD5(?))"
            pool.query(sql,[uname,upwd],(err,result)=>{
                if(err) throw err;
                // console.log(result)
                res.send({code:1,message:'注册成功'});
            })
        }else{
            res.send({code:0,message:'用户名已存在'})
        }
    })
})

//功能一:用户登录验证
server.get("/login",(req,res)=>{
  //1:获取脚手架传递用户名和密码
  var u = req.query.uname;
  var p = req.query.upwd;
  //2:创建sql语法并且将用户名和密码加入
  var sql = "SELECT id FROM hfh_login WHERE uname=? AND upwd=md5(?)";
  //3:执行sql语法并且获取返回结果
  pool.query(sql,[u,p],(err,result)=>{
     //3.1:如果出现严重错误抛出  
     if(err)throw err;
     //3.2如果result.length长度为0，表示登录失败
     if(result.length==0){
         res.send({code:-1,msg:"用户名或密码有误"});
     }else{
         //登录成功
         //登录成功后  创建session对象 并且将登录凭证uid保存在对象中
         //将当前登录的用户id(result=[{id:1}])保存在session对象中作为登录凭证
        req.session.uid = result[0].id;
        res.send({code:1,msg:"登录成功"})
     }
  });
})
//测试启动服务器  node app.js
//打开浏览器在地址栏输入
//      http://127.0.0.1:4000/login?uname=tom&upwd=123

// 功能二：显示商品列表（分页）
// 1.GET /product
server.get("/product",(req,res)=>{
    // 2.接收参数 页码 一页几行
    var pno = req.query.pno
    var ps = req.query.pageSize
    // 3.为参数设置默认值 1  20
    if(!pno){pno=1}
    if(!ps){ps=6}
    // 4.创建sql语句分页查询商品列表
    var sql="SELECT lid,lname,price,pic FROM hfh_laptop LIMIT ?,?";
    var offset = (pno-1)*ps
    ps = parseInt(ps)
    // 5.执行sql语句并且将结果发送给脚手架
    pool.query(sql,[offset,ps],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result})
    })
})
//http://127.0.0.1:4000/product
//http://127.0.0.1:4000/product?pno=3
//http://127.0.0.1:4000/01.jpeg
//http://127.0.0.1:4000/02.jpeg


// 功能三：将商品添加至购物车
server.get("/addcart",(req,res)=>{
    // 1.获取当前登录用户的凭证
    var uid = req.session.uid;
    // 2.如果当前客户没有登录 输出请登录
    if(!uid){
        res.send({code:-2,msg:"请登录"});
        return;
    }
    // 3.获取脚手架传递的数据 lid，lname，price
    var lid = req.query.lid;
    var lname = req.query.lname;
    var price = req.query.price;
    // 4.创建sql语句 查询当前用户是否添加过此商品
    var sql = "SELECT id FROM hfh_cart WHERE uid=? AND lid=?";
    // 5.执行sql语句
    pool.query(sql,[uid,lid],(err,result)=>{
        // 6.在回调函数（钩子函数）
        if(err)throw err;
        // 7.获取查询结果[判断是否添加过此商品]
        if(result.length==0){
            // 8.如果没添加过此商品 创建INSERT SQL
            var sql = `INSERT INTO hfh_cart VALUES(null,${lid},'${lname}',${price},1,${uid})`;
        }else{
            // 9.如果购物车有此商品 创建UPDATE SQL
            var sql = `UPDATE hfh_cart SET count=count+1 WHERE uid=${uid} AND lid=${lid}`;
        }
        // 10.执行sql语句
        // 11.返回结果脚手架
        pool.query(sql,(err,result)=>{
            if(err)throw err;
            res.send({code:1,msg:"添加成功"})
        })
    })//select end
})
//测试
//浏览器地址
//  http://127.0.0.1:4000/addcart?lid=1&price=9&lname=aa
//  http://127.0.0.1:4000/login?uname=tom&upwd=123
//  http://127.0.0.1:4000/addcart?lid=1&price=9&lname=aa
//  http://127.0.0.1:4000/addcart?lid=1&price=9&lname=aa
//  SELECT * FROM hfh_cart;

// 功能四：查询指定用户的购物车列表
server.get("/findcart",(req,res)=>{
    // 获取用户的登录凭证uid
    var uid = req.session.uid
    // 没有uid标示此用户为登录 发送登录信息
    if(!uid){
        res.send({code:-2,msg:"请登录",data:[]});
        return;
    }
    // 创建sql语句
    var sql = "SELECT id,lid,lname,price,count FROM hfh_cart WHERE uid=?";
    // 发送sql语句并且将查询结果返回脚手架
    pool.query(sql,[uid],(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"查询成功",data:result})
    })
})
//测试
//浏览器地址
//  http://127.0.0.1:4000/findcart                #请登录
//  http://127.0.0.1:4000/login?uname=tom&upwd=123    
//  http://127.0.0.1:4000/findcart                #查询结果
//  http://127.0.0.1:4000/addcart?lid=1&price=9&lname=aa    #往购物车添加商品
//  http://127.0.0.1:4000/addcart?lid=1&price=9&lname=aa
//  http://127.0.0.1:4000/findcart                #再次查询结果


// 功能五：删除购物车中一条商品信息
server.get("/del",(req,res)=>{
    // 获取用户的登录凭证uid
    var uid = req.session.uid
    // 没有uid标示此用户为登录 发送登录信息
    if(!uid){
        res.send({code:-2,msg:"请登录"});
        return;
    }
    // 获取脚手架传递的数据 id
    var id = req.query.id
    // 创建sql语句 依据id删除数据
    var sql = "DELETE FROM hfh_cart WHERE id = ? AND uid = ?"
    // 执行sql语句获取返回结果
    pool.query(sql,[id,uid],(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"})
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    })
    // 发送sql语句并且将查询结果返回脚手架
})

// http://127.0.0.1:4000/del?id=2
// http://127.0.0.1:4000/login?uname=tom&upwd=123
// http://127.0.0.1:4000/del?id=2
// http://127.0.0.1:4000/del?id=2


// 功能六：删除用户选中的多条记录
// 1.接收强求 /delm
server.get("/delm",(req,res)=>{
    // 2.获取用户的登录凭证uid
    var uid = req.session.uid
    // 3.没有uid标示此用户为登录 发送登录信息
    if(!uid){
        res.send({code:-2,msg:"请登录"});
        return;
    }
    // 4接收参数 id = "2,3"
    var id = req.query.id
    // 5.创建sql语句执行删除多条记录功能
    var sql = `DELETE FROM hfh_cart WHERE id IN (${id})`
    // 6.判断是否成功  并且返回值
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"})
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    })
})

// 确保需要删除的商品id  数据库hfh_cart里存在
// http://127.0.0.1:4000/delm?id=4,5
// http://127.0.0.1:4000/login?uname=tom&upwd=123
// http://127.0.0.1:4000/delm?id=4,5



// 功能七:购物车商品数量加一/减一
server.get("/addcount",(req,res)=>{
    // 1.获取当前登录用户的凭证
    var uid = req.session.uid;
    // 2.如果当前客户没有登录 输出请登录
    if(!uid){
        res.send({code:-2,msg:"请登录"});
        return;
    }
    // 4接收参数 id = "2"
    var id = req.query.id
    // 5.创建sql语句执行+1功能
    var sql = `UPDATE hfh_cart SET count=count+1 WHERE uid=${uid} AND id=${id}`;
    // 5.执行sql语句
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"+1"})
        // console.log(result)
    })
})
// 确保需要+1的商品id  数据库hfh_cart里存在
// http://127.0.0.1:4000/addcount?id=28
// http://127.0.0.1:4000/login?uname=tom&upwd=123
// http://127.0.0.1:4000/addcount?id=28

server.get("/subcount",(req,res)=>{
    // 1.获取当前登录用户的凭证
    var uid = req.session.uid;
    // 2.如果当前客户没有登录 输出请登录
    if(!uid){
        res.send({code:-2,msg:"请登录"});
        return;
    }
    // 4接收参数 id = "2"
    var id = req.query.id
    // 5.创建sql语句执行+1功能
    var sql = `UPDATE hfh_cart SET count=count-1 WHERE uid=${uid} AND id=${id}`;
    // 5.执行sql语句
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send({code:1,msg:"-1"})
        // console.log(result)
    })
})
// 确保需要-1的商品id  数据库hfh_cart里存在
// http://127.0.0.1:4000/subcount?id=28
// http://127.0.0.1:4000/login?uname=tom&upwd=123
// http://127.0.0.1:4000/subcount?id=28