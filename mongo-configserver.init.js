rs.initiate({_id:'mongo-configserver',configsvr:true,version:1,members:[
{_id:0,host:'mongo-configserver-a:10001'},
{_id:1,host:'mongo-configserver-b:10002'},
{_id:2,host:'mongo-configserver-c:10003'}]})
