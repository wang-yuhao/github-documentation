<%Option Explicit%>
<%'On Error Resume Next%>
<%Response.Buffer = True%>
<!--#include file="New_Config.asp"-->
<%'Response.CodePage=65001 %>
<%Response.Charset=New_CharSet%>
<%
Rem /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Rem 程序名称：New Cms
Rem 程序作者：新成
Rem 作者博客：http://zhanxincheng.com/
Rem //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Const New_Conn_Name="ADODB.CONNECTION"
Const New_RS_NAME="ADODB.RECORDSET"
Const New_XHtml_Name="MSXML2.XMLHTTP"
Const New_XHtml2_Name="Msxml2.ServerXMLHTTP"
Const New_Stream_Name = "Adodb.stream"
Const New_Script_file = "scripting.filesystemobject"

Class data
	Public Random,Nowtime,RS,colMatches
	Dim Conn
	Public Function StrConn()
	On Error Resume Next
	Dim Stconn
	Set Conn=server.createobject(New_Conn_Name) 
	select case New_SqlType
		case 1
			Stconn = "provider=sqloledb;data source="&New_Server&";User ID="&New_SQLName&";pwd="&New_SQLpwd&";Initial Catalog="&New_SQLUser&""
			Random="newid()"
			Nowtime="getdate()"
		case 0
			Stconn = "Provider = Microsoft.Jet.OLEDB.4.0;Data Source="&server.mapPath(New_Root&New_Access)
			Random="Rnd({Acc}read.id-timer())"
			Nowtime="Now()"
	end select
	Conn.open Stconn
	If err.number<>0 Then:err.Clear:Conn.close:set Conn=nothing:die New_DataOver:END IF
	End Function
	Sub OverConn():Conn.Close:Set Conn = Nothing:Set exe = Nothing:End Sub
	Public Function StrRS(byval sqlStr,byval sqlType)
		sqlStr = replace(sqlStr,"{Acc}",New_NewAcc)
		SET RS=server.CreateObject(New_RS_NAME)
		select case sqlType
			case "exe"  set RS = Conn.execute(sqlStr)
			case "r1"   RS.open sqlStr,Conn,1,1	
			case "r3"	RS.open sqlStr,Conn,3,3
			case "arr"	RS.open sqlStr,Conn,1,1
			if not RS.eof then StrRS=RS.getRows() 
		end select	
	End Function
	Public Sub OverRS():RS.Close:Set RS = Nothing:End Sub
	Public Sub RegExp(a,b)
	dim re
	Set re = New RegExp
    re.Pattern = a
    re.IgnoreCase = True
    re.Global = True
	re.MultiLine = True
    Set colMatches = re.Execute(b)
	End Sub
End Class
dim exe:set exe=new data:exe.StrConn
%>