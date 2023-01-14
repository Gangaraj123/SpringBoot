<!-- Navigation bar -->
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/">
            <span>
                <img src="/blogicon.png" style="width: 50px;border-radius: 25px;" alt=" ">
            </span>Blogger</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
                <li class="nav-item"
                    onMouseOut="this.style.backgroundcolor='#00F'">
                    <a class="nav-link active <c:if test="${page=='home' }">active</c:if>"
                              href="/">
                        Home
                    </a>
                    
                </li>
                <li class="nav-item ">
                    <a class="nav-link <c:if test="${page=='create' }">active</c:if>"  href="/create">Create blog</a>
                </li>
                <li class="nav-item " id="yourblog" style="display: none;">
                    <a class="nav-link 
                    <c:if test="${page=='yourblogs' }">active</c:if>
                    " style="cursor: pointer;" onclick="check()"
                    
                    >Your blogs</a>
                </li>
            </ul>
        </div>
        <!-- Login and logout buttons -->
        <button class="btn btn-dark" onclick="flipicon()" style="transform:scaleX(-1)">
            <i class="fas fa-adjust" id="night"></i>
        </button>
        <div id="inbtns">
            <a href="/signup">
                <button class=" mx-1 btn btn-sm signbutton">
                    sign up
                </button>
            </a>
            <a href="/login">
                <button class="mx-1 btn btn-sm signbutton">
                    Log in
                </button>
            </a>
        </div>
        <div id="outbtns" style="display: none;">

            <button class=" mx-1 btn btn-sm signbutton" onclick="logout()">
                <i class="fa fa-sign-out" aria-hidden="true"></i>
                logout
            </button>

        </div>
    </div>
</nav>
<script>
    let mode = 'light';
    if (localStorage.getItem('token')) {
        document.getElementById('outbtns').style.display = "block";
        document.getElementById('inbtns').style.display = "none";
        document.getElementById('yourblog').style.display="block";
    }
    else {
        document.getElementById('outbtns').style.display = "none";
        document.getElementById('inbtns').style.display = "block";

    }
    function logout() {
        localStorage.clear();
        window.location.replace(`${host}`);
    }
    function flipicon() {
        const elements=document.getElementsByClassName('modechange');
        if (mode === "night") {
            mode = 'light'
            document.body.style.backgroundColor = "rgb(241 241 241)";
            document.getElementById('night').style.transform = 'scaleX(1)';
            for(let i=0;i<elements.length;i++)
            elements[i].style.color="black";
            
            
        }
        else {
            mode = 'night';
            document.body.style.backgroundColor = "black";
            document.getElementById('night').style.transform = 'scaleX(-1)';
            for(let i=0;i<elements.length;i++)
            elements[i].style.color="white";
        }
        console.log("clicked")
    }
    async function check() {
        const authtoken = localStorage.getItem('token');
        let response = await fetch(`${host}/auth/getuserid`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer '+authtoken
            }
        });
        let json = await response.json();
   		let url=`${host}/yourblogs?uid=`+json.id;
   		console.log(url);
        window.location.replace(url);
    }
    
</script>