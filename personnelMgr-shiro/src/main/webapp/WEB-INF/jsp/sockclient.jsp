<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="${ctxPath }/resources/js/layer/layer.js"></script>
<script type="text/javascript" src="${ctxPath }/resources/js/sockjs-1.0.3.min.js"></script>
<script type="text/javascript">
var websocket = new SockJS("${ctxPath}/sockjs/webSocketServer");

websocket.onopen = function (event) {
};
websocket.onmessage = function (event) {
	layer.open({
	    type: 2,
	    title: '消息',
	    closeBtn: 2, //不显示关闭按钮
	    shade: [0],
	    area: '300px', //只定义宽度，高度自适应
	    offset: 'rb', //右下角弹出
	    shift: 2,
	    time: 15000,
	    content: ["${ctxPath}/message?data=" + event.data, 'no'] //iframe的url，no代表不显示滚动条
	});
};
websocket.onerror = function (event) {
};
websocket.onclose = function (event) {
}
</script>
