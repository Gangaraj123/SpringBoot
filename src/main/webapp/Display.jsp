 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <div class="container my-4 "
    style="background-color: white;width: 90%;border-radius: 20px;box-shadow:0 4px 8px 0 rgb(0 0 0 / 20%), 0 6px 20px 0 rgb(0 0 0 / 19%)">
    <div class=" p-5" >
         <h1 class="my-1" id="doctitle" style="color: red;">
        <c:out value="${blog.getTitle() }" />
        </h1>
        <div class=" my-2">
            <h6><strong>
                    category:
                </strong>
                <span>
        <c:out value="${blog.getCategory() }" />
                </span>
            </h6>
            <h6>
                <strong>created:</strong>
                <span>
				        <c:out value="${blog.getDate() }" />
                </span>
            </h6>

                <h6>
                    <strong>created by :</strong>
                    <span>
                                <c:out value="${blog.getAuthor() }" />

                    </span>
                </h6>

        </div>
        <div style="border-radius: 10px;" class="my-3" >

            <img style="width:75%;height:75%;margin: auto;display: block;border-radius: 10px;" src="data:image/;base64,
            <c:out value="${blog.getImg() }" />">
        </div>

        <p>
            <c:out value="${blog.getBody()}" /> 
        </p>
      
 <div class="d-flex justify-content-center">
            <a href="/editblog?blogid=<c:out value="${blog.getId() }"/>" id="editbtn" style="display:none">
                <button class="btn btn-warning mx-1">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16"
                        height="16" fill="currentColor"
                        class="bi bi-pencil-square" viewBox="0 0 16 16">
                        <path
                            d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                        <path fill-rule="evenodd"
                            d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                    </svg> Edit
                </button>
            </a>
            <button class="btn btn-danger mx-1" id="deletebtn" style="display: none;" type="button"
                data-bs-toggle="modal" data-bs-target="#exampleModal2"><svg
                    xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                    fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                    <path
                        d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                    <path fill-rule="evenodd"
                        d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                </svg> Delete</button>
            <div class="modal fade" id="exampleModal2" tabindex="-1"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Are
                                you Sure?</h5>
                            <button type="button" class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>This blog will be deleted permanently</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                data-bs-dismiss="modal">Close</button>
                            <a href="/deleteblog?blogid=<c:out value="${blog.getId() }"/>">
                                <button type="button" onclick="start()"
                                    class="btn btn-danger" data-bs-dismiss="modal"
                                    aria-label="Close">confirm</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</div>
<div class="modal fade" id="exampleModal" tabindex="-1"
aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="height:200px;">
            <h3  id="creatingmsg">Deleting...</h3>
            <div class="cprogress">
                <div class="cprogress-done" id="cprogress-done">50%
                </div>
        </div>
    </div>
</div>
</div>
<div class="container">
    
</div>
<script>
document.title=document.getElementById('doctitle').innerHTML;
 	
async function authorize(token) {
    const response = await fetch('${host}/auth/getuserid', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
             'Authorization':'Bearer '+token
        }
    });
    let json = await response.json();
    console.log(json)
    if (json.success && json.id=="<c:out value="${blog.getUserid()}"/>") {
     document.getElementById('editbtn').style.display="block";
     document.getElementById('deletebtn').style.display="block"
    }
}
if(localStorage.getItem('token'))
authorize(localStorage.getItem('token'));
</script>