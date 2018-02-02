<@com.head title="">
    <base id="base" href="${basePath!}">
    <link href="${basePath!}/static/plugins/layui/css/layui.css" type="text/css" media="screen" rel="stylesheet"/>
    <script src="${basePath!}/static/plugins/layui/layui.js" type="text/javascript"></script>

<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form','table'], function(){
        var layer = layui.layer
            ,form = layui.form
            ,$ = layui.$
            ,laytpl = layui.laytpl
            ,table = layui.table;

        var tableTClass =table.render({
            id: 'idTClass'
            ,elem: '#TClass'
            ,height: 315
            ,url: '${basePath!}/tclass/queryTClassList' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {type:'numbers', title: '序号', width:80,sort: true}
                ,{field: 'id', title: 'ID', width:300, unresize:true}
                ,{field: 'name', title: '班级名称', width:200,unresize:true}
                ,{fixed: 'right', width:150, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]],
            method: 'post',
            request: {
                pageName: 'page' //页码的参数名称，默认：page
                ,limitName: 'rows' //每页数据量的参数名，默认：limit
            },
            response: {
                statusName: 'code'
                ,statusCode: 0
                ,countName: 'total' //数据总数的字段名称，默认：count
                ,dataName: 'list' //数据列表的字段名称，默认：data
            },
            skin: 'line' //行边框风格
        });

        var TClassInsertLayerIndex;

        //新建
        $("#TClassInsert").click(function(){
            //置空表单
            $("#TClassInsertForm").find(":input[name='name']").val("");
            $("#TClassInsertForm").find(":input[name='id']").val("");
            TClassInsertLayerIndex = layer.open({
                title:"新建",
                type: 1,
                content: $('#TClassInsertDiv')
            });
        });

        form.on('submit(TClassInsertFormSubmit)', function(data){
            $.ajax({
                type: "POST",
                url: "${basePath!}/tclass/saveOrUpdateTClass",
                data: $("#TClassInsertForm").serialize(),
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                    return false;
                },
                success: function (data) {
                    if (data.state == 'fail') {
                        layer.alert(data.message);
                        layer.close(TClassInsertLayerIndex);
                        return false;
                    }else if(data.state == 'success'){
                        layer.alert(data.message);
                        layer.close(TClassInsertLayerIndex);
                        tableTClass.reload({
                            where: { //设定异步数据接口的额外参数，任意设
                                /*aaaaaa: 'xxx'
                                ,bbb: 'yyy'*/
                                //…
                            }
                            ,page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        });
                    }
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });


        //监听工具条
        table.on('tool(TClass)', function(obj){ //注：tool是工具条事件名，TClass是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if(layEvent === 'detail'){ //查看
                //do somehing
            } else if(layEvent === 'del'){ //删除
                layer.confirm('真的删除该行数据吗', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        type: "POST",
                        url: "${basePath!}/tclass/deleteTClass",
                        data: {id:data.id},
                        async: false,
                        error: function (request) {
                            layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                            return false;
                        },
                        success: function (data) {
                            if (data.state == 'fail') {
                                layer.alert(data.message);
                                return false;
                            }else if(data.state == 'success'){
                            }
                        }
                    });
                });
            } else if(layEvent === 'edit'){ //编辑
                //do something
                //置空表单
                $("#TClassInsertForm").find(":input[name='name']").val("");
                $("#TClassInsertForm").find(":input[name='id']").val("");
                //添加值
                $("#TClassInsertForm").find(":input[name='name']").val(data.name);
                $("#TClassInsertForm").find(":input[name='id']").val(data.id);
                TClassInsertLayerIndex = layer.open({
                    title:"编辑",
                    type: 1,
                    content: $('#TClassInsertDiv')
                });
            }
        });




        //----------------------------------------



        var tableTeacher =table.render({
            id: 'idTeacher'
            ,elem: '#Teacher'
            ,height: 315
            ,url: '${basePath!}/teacher/queryTeacherList' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {type:'numbers', title: '序号', width:80,sort: true}
                ,{field: 'id', title: 'ID', width:300, unresize:true}
                ,{field: 'name', title: '班级名称', width:200,unresize:true}
                ,{fixed: 'right', width:150, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]],
            method: 'post',
            request: {
                pageName: 'page' //页码的参数名称，默认：page
                ,limitName: 'rows' //每页数据量的参数名，默认：limit
            },
            response: {
                statusName: 'code'
                ,statusCode: 0
                ,countName: 'total' //数据总数的字段名称，默认：count
                ,dataName: 'list' //数据列表的字段名称，默认：data
            },
            skin: 'line' //行边框风格
        });

        var TeacherInsertLayerIndex;

        //新建
        $("#TeacherInsert").click(function(){
            //置空表单
            $("#TeacherInsertForm").find(":input[name='name']").val("");
            $("#TeacherInsertForm").find(":input[name='id']").val("");
            TeacherInsertLayerIndex = layer.open({
                title:"新建",
                type: 1,
                content: $('#TeacherInsertDiv')
            });
        });

        form.on('submit(TeacherInsertFormSubmit)', function(data){
            $.ajax({
                type: "POST",
                url: "${basePath!}/teacher/saveOrUpdateTeacher",
                data: $("#TeacherInsertForm").serialize(),
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                    return false;
                },
                success: function (data) {
                    if (data.state == 'fail') {
                        layer.alert(data.message);
                        layer.close(TeacherInsertLayerIndex);
                        return false;
                    }else if(data.state == 'success'){
                        layer.alert(data.message);
                        layer.close(TeacherInsertLayerIndex);
                        tableTeacher.reload({
                            where: { //设定异步数据接口的额外参数，任意设
                                /*aaaaaa: 'xxx'
                                ,bbb: 'yyy'*/
                                //…
                            }
                            ,page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        });
                    }
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });


        //监听工具条
        table.on('tool(Teacher)', function(obj){ //注：tool是工具条事件名，TClass是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if(layEvent === 'detail'){ //查看
                //do somehing
            } else if(layEvent === 'del'){ //删除
                layer.confirm('真的删除该行数据吗', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        type: "POST",
                        url: "${basePath!}/teacher/deleteTeacher",
                        data: {id:data.id},
                        async: false,
                        error: function (request) {
                            layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                            return false;
                        },
                        success: function (data) {
                            if (data.state == 'fail') {
                                layer.alert(data.message);
                                return false;
                            }else if(data.state == 'success'){
                            }
                        }
                    });
                });
            } else if(layEvent === 'edit'){ //编辑
                //do something
                //置空表单
                $("#TeacherInsertForm").find(":input[name='name']").val("");
                $("#TeacherInsertForm").find(":input[name='id']").val("");
                //添加值
                $("#TeacherInsertForm").find(":input[name='name']").val(data.name);
                $("#TeacherInsertForm").find(":input[name='id']").val(data.id);
                TeacherInsertLayerIndex = layer.open({
                    title:"编辑",
                    type: 1,
                    content: $('#TeacherInsertDiv')
                });
            }
        });




        //分布式事务测试
        $("#JTATest").click(function(){
            $.ajax({
                type: "POST",
                url: "${basePath!}/jtaTest/test01",
                data: {}    ,
                async: false,
                error: function (request) {
                    layer.alert("与服务器连接失败/(ㄒoㄒ)/~~");
                    return false;
                },
                success: function (data) {
                    if (data.state == 'fail') {
                        layer.alert(data.message);
                        return false;
                    }else if(data.state == 'success'){
                        layer.alert(data.message);
                    }
                }
            });
        });




    });
</script>

</@com.head>
<@com.body>



<fieldset class="layui-elem-field">
    <legend>班级信息</legend>
    <div class="layui-field-box">
        <div class="layui-fluid">
            <div class="layui-row">
                <button class="layui-btn" id="TClassInsert">新建</button>
            </div>
            <div class="layui-row">
                <table id="TClass" lay-filter="TClass"></table>
            </div>
        </div>
    </div>
</fieldset>


<div id="TClassInsertDiv" style="display: none">
    <form class="layui-form" action="" id="TClassInsertForm">
        <input type="hidden" id="TClassInsertFormId" name="id"/>
        <div class="layui-form-item">
            <label class="layui-form-label">班级名称</label>
            <div class="layui-input-block">
                <input type="text" name="name" required  lay-verify="required" placeholder="请输入班级名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="TClassInsertFormSubmit">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary" id="TClassInsertFormReset">重置</button>
            </div>
        </div>
    </form>
</div>


<#---------------------------------------->


<fieldset class="layui-elem-field">
    <legend>教师信息</legend>
    <div class="layui-field-box">
        <div class="layui-fluid">
            <div class="layui-row">
                <button class="layui-btn" id="TeacherInsert">新建</button>
            </div>
            <div class="layui-row">
                <table id="Teacher" lay-filter="Teacher"></table>
            </div>
        </div>
    </div>
</fieldset>


<div id="TeacherInsertDiv" style="display: none">
    <form class="layui-form" action="" id="TeacherInsertForm">
        <input type="hidden" id="TeacherInsertFormId" name="id"/>
        <div class="layui-form-item">
            <label class="layui-form-label">教师名称</label>
            <div class="layui-input-block">
                <input type="text" name="name" required  lay-verify="required" placeholder="请输入教师名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="TeacherInsertFormSubmit">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary" id="TeacherInsertFormReset">重置</button>
            </div>
        </div>
    </form>
</div>





<#------------------------------------>


<fieldset class="layui-elem-field">
    <legend>分布式事务测试</legend>
    <div class="layui-field-box">
        <div class="layui-fluid">
            <div class="layui-row">
                <button class="layui-btn" id="JTATest">同时向班级和老师表插入名为8888的班级和老师</button>
            </div>
        </div>
    </div>
</fieldset>











<script type="text/html" id="barDemo">
    <#--<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>-->
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<!-- 序号监听事件 -->
<script type="text/html" id="indexTpl">
    {{d.LAY_TABLE_INDEX+1}}
</script>

</@com.body>