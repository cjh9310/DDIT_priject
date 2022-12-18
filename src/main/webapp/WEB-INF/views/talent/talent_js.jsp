<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>


<script type="text/x-handlebars-template" id="talent-edu-template">
<thead>
	<tr>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">학과계열</th>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">학교명</th>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">학과명</th>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">학점</th>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">상태</th>
	</tr>
</thead>
{{#each eduList}}
	<tr>
		<td class="text-center">{{eduDep}}</td>
		<td class="text-center">{{eduName}}</td>
		<td class="text-center">{{eduMajor}}</td>
		<td class="text-center">{{eduScore}}</td>
		<td class="text-center">
				<span class="badge badge-primary">{{strStatus}}</span>
		</td>
	</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template" id="talent-crr-template">
<thead>
	<tr>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">업종</th>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">회사명</th>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">직무</th>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">직책</th>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">입사일</th>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">퇴사일</th>
	</tr>
</thead>
{{#each crrList}}
	<tr>
		<td class="text-center">{{crrSector}}</td>
		<td class="text-center">{{crrCorname}}</td>
		<td class="text-center">{{crrJob}}</td>
		<td class="text-center">{{crrPosition}}</td>
		<td class="text-center">{{crrSdate}}
			</td>
		<td class="text-center">{{crrEdate}}
			</td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="talent-cer-template">
<thead>
	<tr>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">주최기관</th>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">자격증명</th>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">발급일</th>
		<th class="text-center border-top-0 table-scale-border-bottom fw-700">갱신일</th>
	</tr>
</thead>
{{#each cerList}}
	<tr>
		<td class="text-center">{{cerHost}}</td>
		<td class="text-center">{{cerName}}</td>
		<td class="text-center">{{cerSdate }}</td>
		<td class="text-center">
				<span class="badge badge-info">유효기간없음</span>
		</td>
			
	</tr>
{{/each}}
</script>




<script>
function talentDetail(id) {
	$.ajax({
		type : 'POST',
		url : '<%=request.getContextPath()%>/talent/getListByAjax.do',
		data : {'id' : id},
		success : function(result) {
			
			
			var education = result.education;
			var career = result.career;
			var certificate = result.certificate;
			
			printDataByTalent(education, $('#' + id + '-edu-section'), $('#talent-edu-template'));
			printDataByTalent(career, $('#' + id + '-crr-section'), $('#talent-crr-template'));
			printDataByTalent(certificate, $('#' + id + '-cer-section'), $('#talent-cer-template'));
			
			console.log(education);
			console.log(career);
			console.log(certificate);
		},
		error : function() {
			alert("Error");
		}
	}); 
};
</script>

<script>
	function printDataByTalent(dataArr, target, templateObject) {
		console.log("handlebars dataArr : " + dataArr);
		var template = Handlebars.compile(templateObject.html());
		var html = template(dataArr);
		target.html(html);
	}
	
	
</script>
<script>
Handlebars.registerHelper('ifEdu',  function(v1, options) {
	  if(v1 === 2) {
		    return options.fn(this);
		  }
		  return options.inverse(this);
		});


Handlebars.registerHelper({
    eq: (v1, v2) => v1 === v2,
    ne: (v1, v2) => v1 !== v2,
    lt: (v1, v2) => v1 < v2,
    gt: (v1, v2) => v1 > v2,
    lte: (v1, v2) => v1 <= v2,
    gte: (v1, v2) => v1 >= v2,
    and() {
        return Array.prototype.every.call(arguments, Boolean);
    },
    or() {
        return Array.prototype.slice.call(arguments, 0, -1).some(Boolean);
    }
});
</script>
