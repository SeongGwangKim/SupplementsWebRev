function addEventListenerToButton() {
    const loginButton = document.getElementById("loginButton");
            loginButton.onclick = function() {
                window.location.href = 'https://kauth.kakao.com/oauth/authorize?' +
                    'client_id=5c2d0f358423371eec07abdbc5143497&' +
                    'redirect_uri=wYcGDUpe0nKj3TubMCKZmBX5Ed9SdcI1' +
                    'response_type=code';
            }
}