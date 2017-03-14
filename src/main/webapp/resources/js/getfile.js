$(function () {
    $('input[name="departmentOptions"]').each(function (index) {
        var department = $(this).attr('value');
        var url = "<%=request.getContextPath()%>/ajax/course/"+department;
        $(this).on('click', function () {
            $('#courses').empty();
            $.ajax({
                method: "Get",
                url: url,
                success:function (data) {
                    var courses = data;
                    for(var i = 0; i < courses.length; i++) {
                        var course = courses[i];
                        var labelObj = $("label",$("#courseTemplate")).clone();
                        var radioObj = $('input[name="courseOptions"]',labelObj);
                        var spanObj = $('.course-span',labelObj);
                        radioObj.attr("id", "courseOption" + (i + 1));
                        radioObj.attr("value", course.courseId);
                        spanObj.text(course.courseName);
                        labelObj.appendTo("#courses")
                    }
                    var btn=$("<button class='btn btn-success'type='button' id='submit-button' style='margin-left: 25px'>查找文件</button>");
                    $("#courses").append(btn);
                    addBtnEvent();
                }
            });
        });
    });
});
function addBtnEvent() {
    var func = showTabelData;
    $("#submit-button").on('click', function () {
        var courseid = $("input[name='courseOptions']:checked").val();
        var url = "<%=request.getContextPath()%>/ajax/file/"+courseid;
        $("#table-body").empty();
        $.ajax({
            method: "Get",
            url : url,
            success: func
        });
    });
}
function showTabelData(data) {
    var files = data;
    if(files.length == 0) {
        alert("没有符合要求的文件！")
    }
    for(var i = 0; i < files.length; i++) {
        var file = files[i];
        var trObj = $("tr",$("#tableElementTemplate")).clone();
        $('th[name="listId"]',trObj).text(i+1);
        $('a[name="fileName"]',trObj).text(file.fileName);
        $('a[name="fileName"]',trObj).attr('href',file.fileId);
        $('td[name="size"]',trObj).text(file.size + "MB");
        $('td[name="courseName"]',trObj).text(file.course.courseName);
        $('td[name="department"]',trObj).text(file.course.department);
        $('a[name="download"]',trObj).attr("href", "/getfile/download/" + file.fileId);
        trObj.appendTo("#table-body");
    }
}