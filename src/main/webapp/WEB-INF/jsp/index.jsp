<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    
    <title>Nhom 14- Sang Thu 7</title>
    
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
     <link href="static/css/style.css" rel="stylesheet">
    <!-- include summernote css/js-->
<link
	href="static/summernote-0.8.3-dist/dist/summernote.css"
	rel="stylesheet">

    <!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>
<body style="background: #b9c4ea">

	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div id="homeDiv">
				<div class="jumbotron text-center" style="height: 500px;background: #1d236d; color: white;">
					<h1 style="margin-top: 330px; font-size: 70px;">Welcome!</h1>
				</div>
				<div class="row">
					<div class="col-md-offset-4" style="text-align: center;">
						<a class="col-md-3" href="new-task"><button class="btn btn-warning form-control" style="height: 50px;font-size: 20px" >Post</button></a>
						<a class="col-md-3" href="all-tasks"><button class="form-control btn btn-success" style="height: 50px;font-size: 20px">My Post</button></a>
					</div>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_TASKS'}">
			<div class="container text-center" id="tasksDiv">
				<h2>I think so!!!</h2>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left" style="background: white;">
						<thead>
							<tr>
								<th>Id</th>
								<th>Title</th>
								<th>Content</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td>${task.id}</td>
									<td>${task.title}</td>
									<td>${task.content}</td>
									<td><a href="update-task?id=${task.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-task?id=${task.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>					
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
								<div class="col-md-offset-4" style="text-align: center;">
									<a class="col-md-3" href="/"><button class="form-control btn btn btn-danger" style="height: 40px;font-size: 18px">Welcome</button></a>
									<a class="col-md-3" href="new-task"><button class="form-control btn btn-warning" style="height: 40px;font-size: 18px" >Post</button></a>
								</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h2>What do you think?</h2>
				<hr>
				<form class="form-horizontal" method="POST" action="save-task">
					<input type="hidden" name="id" value="${task.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Title</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="title" value="${task.title}"/>
						</div>	
					</div>
			
					<div class="form-group">
						<label class="control-label col-md-3">Content</label>
						<div class="col-md-7">
							<textarea id="input-content" class="form-control"  name="content" >${task.content}</textarea>
						</div>				
					</div>
					<div class="form-group" style="margin-left: 300px">
						<input class="form-group" type="file" name="file" />					
					</div>			
					<div class="form-group" style="margin-left: 80px">
					<div class="row">
							<div>
									<a href="/"><input style="width: 100px" class="btn btn-danger"  value="Welcome"/></a>
									<a href="all-tasks"><input style="width: 100px" class="btn btn-success" value="My Post"/></a>						
								<input type="submit" style="width: 100px; margin-left: 350px" class="btn btn-primary" value="Save"/></div>							
							</div>
						
					</div>
				</form>
			</div>
		</c:when>		
	</c:choose>
	<script src="static/js/jquery-1.11.1.min.js"></script>    
    <script src="static/js/bootstrap.min.js"></script>
    <script
	src="static/summernote-0.8.3-dist/dist/summernote.js"></script>
    <script>
		$(document).ready(function() {
			$('#input-content').summernote({
				  height: 200,                 // set editor height
				  minHeight: null,             // set minimum height of editor
				  maxHeight: null,             // set maximum height of editor
				  focus: false                  // set focus to editable area after initializing summe
			});
		});
	</script>
</body>
</html>
