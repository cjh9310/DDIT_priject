<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function rendering() {
		
		var checkPwd = $('#password').val();
		
		var ajaxOption = {
			url : '<%=request.getContextPath()%>/comember/mypage/checkInfo.do',
			async : true,
			type : "POST",
			data : {'checkPwd' : checkPwd},
			dataType : "html",
			cache : false
		};
		
		$.ajax(ajaxOption).done(function(data) {
			$('#auth_check').children().remove();
			$('#auth_check').html(data); 
		});
	}
</script>
<script>
	function nonCheck_reload() {
		var ajaxOption = {
			url : '<%=request.getContextPath()%>/comember/mypage/nonCheckInfo.do',
			async : true,
			type : "GET",
			dataType : "html",
			cache : false
		};
		
		$.ajax(ajaxOption).done(function(data) {
			$('#auth_check').children().remove();
			$('#auth_check').html(data); 
		});
	}
</script>
<script>
	function manage_rendering(parameter) {
		
		var selector = '#' + parameter.substr(0,3) + 'Manage';
	
		var ajaxOption = {
				url : '<%=request.getContextPath()%>/comember/mypage/manage.do?parameter=' + parameter,
				async : true,
				type : "GET",
				dataType : "html",
				cache : false
			};
	
			$.ajax(ajaxOption).done(function(data) {
				$(selector).children().remove();
				$(selector).html(data); 
			});
	}
</script>
<script>
	function registForm_load(parameter) {
		
		var selector = '#' + parameter.substr(0,3) + 'Form_section';
		
		var ajaxOption = {
				url : '<%=request.getContextPath()%>/comember/mypage/registForm.do?parameter=' + parameter,
				async : true,
				type : "GET",
				dataType : "html",
				cache : false
			};
	
			$.ajax(ajaxOption).done(function(data) {
				$(selector).children().remove();
				$(selector).html(data);  
			});
	}
</script>
<script>
	$(document).ready(function() {
		
		$('.regist_load').click(function() {
			var parameter = $(this).attr("name");
			var form = null;
			
			if(parameter == "eduForm") {
				form = $('#eduForm').serialize();
			} else if(parameter == "crrForm") {
				form = $('#crrForm').serialize();
			} else if(parameter == "cerForm") {
				form = $('#cerForm').serialize();
			}
			
			form = form.replaceAll('-','/');
			/* 날짜 형식 포맷 */
			$.ajax({
				type : "post",
				url : "<%=request.getContextPath()%>/comember/mypage/regist.do",
				data : form,
				dataType : 'text',
				success : function() {
					nonCheck_reload();
				},
				error : function(request, status, error) {
					console.log(request, status, error);
				}
			});  
		});
		
		$('.modifyForm_load').click(function() {
			
			var pkey = $(this).val();
			var parameter = $(this).attr("name");
			var selector = '#' + parameter.substr(0,3) + 'Form_section';
			
			var ajaxOption = {
					url : '<%=request.getContextPath()%>/comember/mypage/modifyForm.do?parameter=' + parameter + '&pkey=' + pkey,
					async : true,
					type : "GET",
					dataType : "html",
					cache : false
				};
		
				$.ajax(ajaxOption).done(function(data) {
					$(selector).children().remove();
					$(selector).html(data);  
				});
									
		});
		
		$('.remove_load').click(function() {
			
			var pkey = $(this).val();
			var parameter = $(this).attr("name");
			
			$.ajax({
				type : "get",
				url : "<%=request.getContextPath()%>/comember/mypage/remove.do?pkey=" + pkey + "&parameter=" + parameter,
				success : function() {
					manage_rendering(parameter); /* education일 경우 -> eduManage */
				},
				error : function(request, status, error) {
					console.log(request, status, error);
				}
			});  			
		});
		
	});
</script>
<script>
	function modify_submit(parameter) {
		var form = null;
		if(parameter == "eduForm") {
			form = $('#eduForm').serialize();
		} else if(parameter == "crrForm") {
			form = $('#crrForm').serialize();
		} else if(parameter == "cerForm") {
			form = $('#cerForm').serialize();
		}
		
		form = form.replaceAll('-','/');
		/* 날짜 형식 포맷 */
		
		$.ajax({
			type : "post",
			url : "<%=request.getContextPath()%>/comember/mypage/modify.do",
			data : form,
			dataType : 'text',
			success : function() {
				nonCheck_reload();
			},
			error : function(request, status, error) {
				console.log(request, status, error);
			}
		});  
	}
</script>
<!-- 기업정보 수정 -->
<script>
$('#comembermodifyBtn').on('click', function() {
	var v_comembermodifyForm = $('#comembermodifyForm').serialize();
	/* console.log(v_comembermodifyForm); */
	
	$.ajax({
		url : 'comembermodify',
		type : 'post',
		data : v_comembermodifyForm,
		success : function(data) {
			nonCheck_reload();
		}, 
		error : function(xhr,status) {
			
		}
	});
});

</script>
<script>
	function licenceFileUpload() {
		var formData = new FormData($("#licenceFileForm")[0]);
		console.log($('#licenceFile')[0].files[0]);
		formData.append("file",$('#licenceFile')[0].files[0]);
		
		$.ajax({
			type : "post",
			url : '<%=request.getContextPath()%>/comember/mypage/licenceFileUpload',
			data : formData,
			contentType : false,
		    processData : false,
			dataType : 'text',
			success : function(data) {
				ai12_submit();
			},
			error : function(request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>
<script>
	function ai12_submit() {
		var id = '${loginUser.id}';
		
		$.ajax({
			type : "get",
			url : "http://127.0.0.1:5000/licence?id="+id,
			dataType : 'text',
			success : function(data) {
				nonCheck_reload();
				console.log(data);
			},
			error : function(request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>
