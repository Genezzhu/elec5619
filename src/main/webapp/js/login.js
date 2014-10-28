$('#loginEntrance').click(function(){
    $('#myModal').on('shown.bs.modal', function(){
        $('#loginUserName').focus();
    });
    $('#myModal').modal('show');
});

$('#navPanel li').click(function (e) {
    var currentNode = $(e.currentTarget);
    $('.banner').slideUp();
    $('.slide-panel').hide();
    $('#' + currentNode.find('a').eq(0).attr('panel')).show(function () {
        $('.banner').slideDown();
    });

    $('#navPanel li').removeClass('active');
    currentNode.addClass('active');
});

$('#loginBtn').click(function () {
    var loginUserName = $('#loginUserName');
    var loginPasswd =  $('#loginPasswd');

    if( loginUserName.val() == ""){
        alert("please input your username");
        loginUserName.focus();
        return;
    }
    if(loginPasswd.val() == ""){
        alert("please input your passwd");
        loginPasswd.focus();
        return;
    }

    $.ajax({
        url: '../user/login',
        dataType: 'json',
        type: 'POST',
        data: {
            userName : loginUserName.val(),
            passwd : loginPasswd.val()
        },
        success: function(data){
            if(data.success){
                alert('Successfully logon');
                window.location.reload();
            }else{
                alert("UserName/Passwd doesn't match or userName doesn't exist!");
                loginPasswd.focus();
            }
        }
    })
});

$('#registerBtn').click(function () {
    var userName = $('#userName');
    var passwd =  $('#passwd');
    var repeatPasswd = $('#repeatPasswd');
    var telephone = $('#telephone');
    var address = $('#address');
    var sex = $('#sex');

    if(userName.val() == ""){
        alert("please input your username");
        userName.focus();
        return;
    }
    if(passwd.val() == ""){
        alert("please input your passwd");
        passwd.focus();
        return;
    }
    if(repeatPasswd.val() != passwd.val()){
        alert("Passwd doesn't match");
        repeatPasswd.focus();
        return;
    }

    $.ajax({
        url: '../user/register',
        dataType: 'json',
        type: 'POST',
        data: {
            userName : userName.val(),
            passwd : passwd.val(),
            telephone : telephone.val(),
            address : address.val(),
            sex : sex.val()
        },
        success: function(data){
            if(data.success){
                alert('Successfully register User ' + userName.val());
                $('#navPanel li').eq(0).trigger('click');
                $('#loginUserName').focus();
            }else{
                alert("Something went wrong, try again");
            }
        }
    })
});

$('#updateBtn').click(function () {
    var passwd =  $('#updatePasswd');
    var repeatPasswd = $('#updateRepeatPasswd');
    var telephone = $('#updateTelephone');
    var address = $('#updateAddress');
    var sex = $('#updateSex');

    if(passwd.val() == ""){
        alert("please input your passwd");
        passwd.focus();
        return;
    }
    if(repeatPasswd.val() != passwd.val()){
        alert("Passwd doesn't match");
        repeatPasswd.focus();
        return;
    }

    $.ajax({
        url: '../user/update',
        dataType: 'json',
        type: 'POST',
        data: {
            userName : $('#updateUserName').val(),
            passwd : passwd.val(),
            telephone : telephone.val(),
            address : address.val(),
            sex : sex.val()
        },
        success: function(data){
            if(data.success){
                alert('Successfully register User ' + $('#updateusername').val());
                $('#navPanel li').eq(0).trigger('click');
                $('#loginUserName').focus();
            }else{
                alert("Something went wrong, try again");
            }
        }
    })
});

$('#updateUserInfoRole').click(function(){
    $('#updateModel').on('shown.bs.modal', function(){
        $('#updateUserName').focus();
    });
    $('#updateModel').modal('show');
});

$('#logoutInfoRole').click(function(){
    $.ajax({
        url: '../user/logout',
        dataType: 'json',
        type: 'POST',
        success: function(data){
            if(data.success){
                window.location.reload();
            }else{
            }
        }
    })
});