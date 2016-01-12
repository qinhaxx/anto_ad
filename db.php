<?php
	class DB{
	public $conne;
	//使用构造函数去连接数据库
	public function __construct($localhost='192.168.0.6',$user='root',$password='',$dbname='anto_ad'){
@		$this->conne=mysql_connect($localhost,$user,$password);

mysql_query("SET NAMES UTF8");
//mysql_query("set character_set_client=latin1");
//mysql_query("set character_set_results=latin1");
		if($this->conne){
			mysql_select_db($dbname);			
		}else{
			exit('数据库连接失败，请检查');	
		}

	}


//执行sql语句的通用方法

	public function execute($sql){
		$res=mysql_query($sql);
		
		if(!$res){
			exit('SQL语句执行失败！');
		}else{
			$check=preg_match("/select/i",$sql);
			if(isset($check)){
				if($check){
					while(@$data=mysql_fetch_assoc($res)){
						$result[]=$data;
					}
					return @$result;
				}else{
					return true;
				}
			}
		}
	}

}
?>