


function login(login, password, callback_success, callback_failed){

    var xhr = new XMLHttpRequest();

    xhr.open('GET', 'http://testinger.loc/api/?action=login&login=' + login + '&password=' + password, true);

    xhr.onreadystatechange = function(){
        if(xhr.readyState === XMLHttpRequest.DONE && xhr.status == 200 && JSON.parse(xhr.responseText).result){
            console.log(JSON.parse(xhr.responseText).result);
            callback_success();
        }
        else
            callback_failed();

    }

    xhr.send();
}


function registrer(){

}
