// curl https://raw.githubusercontent.com/cillianreilly/qtools/master/utl.q >> $QHOME/utl.q
\l utl.q

\d .btc
\l api.q

utl.query:{
	d:.j.j(!). flip(
		(`method;x);
		(`params;$[y~(::);();$[not type y;::;enlist]y])
		);

	ct:"content-type: text/plain";
	cl:"Content-Length: ",string count d;
	a:"Authorization: Basic ",.utl.enc.base64":"sv api`rpcuser`rpcpassword;
	h:"\r\n"sv(ct;cl;a);

	r:.utl.http.jk .utl.http.post[api.url;"/";h;d];
	if[99h=type r`error;'r[`error;`message]];
	$[10=type r:r`result;"\n"vs r;r]
	}

utl.init:{
	h:@[utl.query[`help];[];{-1"Error querying bitcoin node on init: ",x;exit 1}];
	h:`$(h?'" ")#'h:h where h[;0]in .Q.a;
	@[`.;h;:;]utl.query@'h;
	}

\d .

.btc.utl.init[]
