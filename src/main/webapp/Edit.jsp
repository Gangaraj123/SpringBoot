
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form class="container myform my-5 p-3" id="myUpdateform"
 onsubmit="event.preventDefault();UpdateBlog();"
	action=" /updateblog?blogid=<c:out value="${blog.getId() }"/>" method="post" enctype="multipart/form-data">
	<div class="container row">
		<div class="col-md-8">
			<h1 class="container my-3 " style="text-align: center;">Edit
				Your Blog</h1>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">Title
				</label> <input type="text" class="form-control" name="Title"
					id="exampleFormControlInput1"
					value="<c:out value="${blog.getTitle() }"/>" required> <input
					type="text" class="form-control" name="id" id="secrettoken"
					value="<c:out value="${blog.getId() }"/>"
					style="display: none;">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">Category</label>
				<select id="cat" name="cat" class="form-select" required>
					<option value="Technology"
						<c:if test = "${blog.getCategory()=='Technology'}">
         selected
      </c:if>>Technology
					</option>
					<option value="Health Care"
						<c:if test = "${blog.getCategory()=='Health Care'}">
         selected
      </c:if>>Health
						care</option>
					<option value="Business"
						<c:if test = "${blog.getCategory()=='Business'}">
         selected
      </c:if>>Business
					</option>
					<option value="Movies"
						<c:if test = "${blog.getCategory()=='Movies'}">
         selected
      </c:if>>Movies
					</option>
					<option value="sports"
						<c:if test = "${blog.getCategory()=='sports'}">
         selected
      </c:if>>sports
					</option>
					<option value="Politics"
						<c:if test = "${blog.getCategory()=='Politics'}">
         selected
      </c:if>>Politics
					</option>
					<option value="Nature"
						<c:if test = "${blog.getCategory()=='Nature'}">
         selected
      </c:if>>Nature
					</option>
					<option value="Economics"
						<c:if test = "${blog.getCategory()=='Economics'}">
         selected
      </c:if>>Economics
					</option>
					<option value="General"
						<c:if test = "${blog.getCategory()=='General'}">
         selected
      </c:if>>other
					</option>
				</select>
			</div>
		</div>
		<div
			class="justify-content-center p-2 border border-dark container col-md-3">
			<div class="d-flex justify-content-center">

				<img
					style="width: 225px; height: 210px; border-radius: 5px; max-width: 100%;"
					src="data:image/jpg;base64,
                    <c:out value="${ blog.getImg()}"/>"
					id="imgupload" alt="preview">
			</div>
			<div class="my-1" style="display: flex;">
				<label for="myfile"
					style="width: 50%; margin: auto; min-width: fit-content;">
					<span class="btn " style="background-color: rgb(204, 0, 255)">
						<i class="fas fa-upload"></i> <strong>upload</strong>
				</span>
				</label> <input type="file" id="myfile" name="myfile"
					onchange="showimage(this)" value="" accept="image/*"
					style="display: none;">
			</div>
		</div>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">Body</label>
			<textarea name="Body" class="form-control"
				id="exampleFormControlTextarea1" rows="5" cols="50" required><c:out value="${ blog.getBody()}"/></textarea>
		</div>
		<div class="d-flex justify-content-center">
			<button type="submit" id="mybutton" onclick="start()"
				class="btn btn-primary mx-3">update</button>
		</div>
	</div>
</form>
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content" style="height: 200px;">
			<h3 id="creatingmsg">updating...</h3>
			<div class="cprogress">
				<div class="cprogress-done" id="cprogress-done">50%</div>
			</div>
		</div>
	</div>
</div>
<script>
	document.title = "Edit your blog"
</script>