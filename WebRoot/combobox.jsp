<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglibs.jsp" %>
<html>
<head>
    <title></title>
    <script>

        $(function(){
            $('#sel').combobox({
                //url:urlStr,
                valueField:'name',
                textField:'name',
                onChange:function (newValue, oldValue){
                    if(newValue !=null){
                        var urlStr ="resource/getHotel?name=" + newValue;
                        $("#sel").combobox("reload",urlStr);
                    }
                },
                onSelect:function(record){
                    $("#resourceId").val(record.id);
                    alert($("#resourceId").val());
                }
            });
        });
    </script>

    <link rel="stylesheet" href="js/kalendae/kalendae.css" type="text/css" charset="utf-8">
    <!-- <script src="src/moment.js" type="text/javascript" charset="utf-8"></script>
        <script src="build/kalendae.js" type="text/javascript" charset="utf-8"></script> -->
    <script src="js/kalendae/kalendae.standalone.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css" media="screen">
        .kalendae .k-days span.closed {
            background:red;
        }
    </style>

</head>
<body>
<select id="sel" name="memberName" class="easyui-combobox" style="width:200px;" data-options="required:true">
</select>

<input type="hidden" id="resourceId" value= "" />

<input type="text" value="" id="input1">
<script type="text/javascript" charset="utf-8">
    var k4 = new Kalendae.Input('input1', {
        months:2 ,
        mode:'multiple',
        format:'YYYY-MM-DD',
        multipleDelimiter:','
    });
</script>
</body>
</html>