<div style="height: 40px;"></div>
<div class="main container my-5" style="height:350px">
    <div>
        <form action="/" id="loginform"
            onsubmit="event.preventDefault(); LoginSubmit();">
            <label class="authlabel" style="margin-top: 20px;" for="chk"
                aria-hidden="true">Login</label>
            <div style="height:30px;display: flex;justify-content: center;">
                <strong id="errormsg" style="color:red"></strong>
            </div>
            <input style="margin-top: 0;" class="auth-input" type="email"
                name="email" placeholder="Email" required="">

            <input class="auth-input" type="password" name="password"
                placeholder="Password" required="">
            <button type="submit"
                class="authbutton d-flex justify-content-center">
                <span id="loader" style="display:none;margin-top: 8px;"
                    class="spinner-border spinner-border-sm text-light"
                    role="status">
                </span>
                <span id="verifybtn" class="my-1">Log in</span>
            </button>
            <p class="d-flex justify-content-center my-3">
                Not
                registered?
                <a style="color: #4CAF50;" href="/signup">Create
                    an
                    account</a>
            </p>
        </form>
    </div>
</div>