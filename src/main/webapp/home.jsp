
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container my-4">
	<div class="row ">
		<c:choose>
			<c:when test="${allblogs.size()>0 }">
				<h1 class="mx-5 modechange"
					style="color: rgb(0, 0, 0); font-weight: 700;">All Blogs</h1>
				<c:forEach items="${allblogs }" var="blog">
					<div class="container col-md-5 my-4 mx-4 " style="max-width: 90%;">

						<div class="card">
							<div class="card-body">
								<div style="float: left;" class="mx-2">
									<img
										style="width: 200px; height: 180px; border-radius: 5px; max-width: 100%;"
										src="data:image/jpg;base64,<c:out value="${blog.getImg() }" />
                      ">
								</div>
								<div class="mx-2" style="min-width: 50%;">

									<h5 class="card-title">
										<c:out value="${blog.getTitle() }" />
									</h5>
									<p class="card-text">
									<c:set var="limit" scope="request" value="${blog.getTitle().length()>60?50:60 }"/>
									<c:set var="size" scope="request" value="${blog.getBody().length() }"/>
									<c:set var="finallimit" scope="request" value="${limit>size?size:limit }" />
										<c:out
											value="${blog.getBody().substring(0,finallimit)}..." />

									</p>
									<p>
										<strong>category:</strong>
										<c:out value="${blog.getCategory() }" />
										<a href="/viewblog?blogid=<c:out value="${blog.getId() }"/> "
											class="btn-sm btn btn-success float-end">View Blog</a>
											
									</p>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="container m-4 modechange text-center">
					<h4>There are No blogs to show.</h4>
					<p>Creat a blog here.</p>
					<a href="/create" class="btn btn-primary"> create a new
						blog </a>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
</div>
