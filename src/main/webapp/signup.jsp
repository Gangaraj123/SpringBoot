<div style="height: 40px;"></div>
<div class="main container my-5" style="height: 420px;">
    <div>
        <form action="/" id="signupform"
            onsubmit="event.preventDefault(); SignupSubmit();">
            <label class="authlabel" for="chk" aria-hidden="true">Sign
                up</label>
            <div style="height: 30px;justify-content: center;display: flex;">
                <strong id="errormsg" style="color: red;"></strong>
            </div>
            <input class="auth-input" style="margin-top: 0;" type="text"
                name="name" placeholder="User name" required="">
            <input class="auth-input" type="email" name="email"
                placeholder="Email" required="">

            <input class="auth-input" type="password" name="password"
                placeholder="Password" required="">
            <button type="submit"
                class="authbutton d-flex justify-content-center">
                <span id="loader" style="display:none;margin-top: 8px;"
                    class="spinner-border spinner-border-sm text-light"
                    role="status">
                </span>
                <span id="verifybtn" class="my-1">Sign
                    up</span>
            </button>
            <p class="d-flex justify-content-center my-3">
                Already
                registered?
                <a style="color: #4CAF50;" href="/login">Log
                    in</a>
            </p>
        </form>
    </div>
</div>