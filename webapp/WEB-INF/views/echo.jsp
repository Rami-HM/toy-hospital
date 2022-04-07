<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>실시간 1:1상담</title>
	<style>
		fieldset{
			border : 0px;
			width : 280px;
			height: 500px;
		}
		textarea
		{
			width : 250px;
			height: 450px;
			resize: none;
		}
	</style>
</head>
<body onLoad = "self.focus(); window.onblur=function(){window.focus()}">
    <fieldset>
        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
        <br/>
        <input id="inputMessage" type="text"/>
        <input type="submit" value="send" onclick="send()" />
    </fieldset>
</body>
    <script type="text/javascript">
    var textarea = document.getElementById("messageWindow");
 
    //프로젝트명 밑의 자바파일 @ServerEndpoint(/boradcasting )으로 간다.
    var webSocket = new WebSocket('ws://192.168.1.169:9090/broadcasting');
    var inputMessage = document.getElementById('inputMessage');
 
    webSocket.onerror = function(event) {
      onError(event)
    };
 
    webSocket.onopen = function(event) {
      onOpen(event)
    };
 
    //채팅 텍스트를 상대로부터 받음
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
 
    webSocket.onClose = function(event)
    {
    	onClose(event)
    }
    
    //받은 메세지를 화면에 출력
    function onMessage(event) {
        textarea.value += "상대방 : " + event.data + "\n";
    }
 
    function onOpen(event) {
        textarea.value += "접속 되었습니다.\n";
    }
 
    function onError(event) {
      alert(event.data);
    }
    
    function onClose(event) {
		textarea.value = "접속이 종료 되었습니다.\n";
	}
 
    //채팅 텍스트를 상대에게 보냄
    function send() {
        textarea.value += "나 : " + inputMessage.value + "\n";
        webSocket.send(inputMessage.value);
        inputMessage.value = "";
    }
  </script>
</html>