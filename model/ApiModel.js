


function login(login, password){

    var xhr = new XMLHttpRequest();
    var result = new String;

    xhr.open('GET', 'http://testinger.loc/api/?action=login&login=' + login + '&password=' + password, false);

    xhr.onreadystatechange = function(){
        if(xhr.readyState === XMLHttpRequest.DONE && xhr.status == 200)
            result = JSON.parse(xhr.responseText);
    }

    xhr.send();

    return result.result;
}

function registrer(){

}
