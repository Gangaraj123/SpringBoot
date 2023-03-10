<!-- form  for creating new blog -->
<form class="container myform my-5   p-3" style="width: 70%;min-width: auto;"
    onsubmit="event.preventDefault();CreateBlog();" id="createform"
    action="/blog/create" method="post" enctype="multipart/form-data">
    <div class="container row">
        <div class="col-md-8">
            <h1 class="container my-3 " style="text-align: center;">Create your blog</h1>
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Title
                </label>
                <input type="text" class="form-control" name="Title"
                    id="exampleFormControlInput1"
                    placeholder="Enter Title of Blog " required>

            </div>
            <div class="mb-3">
                <label for="exampleFormControlInput1"
                    class="form-label">Category</label>
                <select id="cat" name="cat" class="form-select"
                    aria-label="Default select example" required>
                    <option value="" selected disabled hidden>select
                        category</option>
                    <option value="Technology">Technology</option>
                    <option value="Health Care">Health care</option>
                    <option value="Business">Business</option>
                    <option value="Movies">Movies</option>
                    <option value="sports">sports</option>
                    <option value="Politics">Politics</option>
                    <option value="Nature">Nature</option>
                    <option value="Economics">Economics</option>
                    <option value="General">other</option>
                </select>
            </div>
        </div>
        <div
            class="justify-content-center p-2 border border-dark container col-md-3">
            <div class="d-flex justify-content-center">

                <img style="width: 225px;height: 210px;border-radius: 5px;max-width: 100%;"
                    src="/Preview.png" id="imgupload" alt="preview">
            </div>
            <div style="display: flex;">
                <label for="myfile"
                    style="width: 50%;min-width: fit-content;margin-left: auto;margin-right: auto;margin-top:5px;">
                    <span class="btn "
                        style="background-color: rgb(204, 0, 255)">
                        <i class="fas fa-upload"></i>
                        <input style="height:0.1em;width: 0.1em;opacity: 0;"
                            type="file" id="myfile" name="myfile"
                            onchange="showimage(this)" required
                            accept="image/*">
                        <strong>upload</strong>
                    </span>
                </label>
            </div>
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1"
                class="form-label">Body</label>
            <textarea name="Body" class="form-control"
                placeholder="Enter blog body here"
                id="exampleFormControlTextarea1" rows="5" cols="50"
                required></textarea>
        </div>
        <div class="d-flex justify-content-center">
            <button type="submit" id="mybutton" class="btn btn-primary mx-3">
                create</button>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="height:200px;">
                        <h3  id="creatingmsg">creating...</h3>
                        <div class="cprogress">
                            <div class="cprogress-done" id="cprogress-done">50%
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<div class="container" id="notloggedin" style="display: none;">
      <%@include file="NotLogged.jsp" %>
</div>
<script>
    document.title="create your blog";
    if (!localStorage.getItem('token')) {
        document.getElementById('createform').style.display = 'none';
        document.getElementById('notloggedin').style.display = 'block';
    }
</script>