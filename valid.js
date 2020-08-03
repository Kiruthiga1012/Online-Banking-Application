function emailcheck(str) {
var at="@"
var dot="."
var lat=str.indexOf(at)
var lstr=str.length
var ldot=str.indexOf(dot)
if (str.indexOf(at)==-1){
alert("The eMail address '@' convention appears to be invalid.")
return false
}
if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
alert("The eMail address '@' convention appears to be invalid.")
return false
}
if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
alert("The eMail address 'dot' convention appears to be invalid.")
return false
}
if (str.indexOf(at,(lat+1))!=-1){
alert("The eMail address '@' convention appears to be invalid.")
return false
}
if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
alert("The eMail address 'dot' convention appears to be invalid.")
return false
}
if (str.indexOf(dot,(lat+2))==-1){
alert("The eMail address 'dot' convention appears to be invalid.")
return false
}
if (str.indexOf(" ")!=-1){
alert("The eMail address spacing convention appears to be invalid.")
return false
}
return true 
  }
  
function validate()
{
	var emailID=document.userform.email;
    if (document.userform.firstName.value == "")
    {
        alert ( "Please enter first name." );
		document.userform.firstName.focus();
        return false;
    }
	 if (document.userform.lastname.value == "")
    {
        alert ( "Please enter last name." );
		document.userform.lastname.focus();
        return false;
    }
	 if (document.userform.userName.value == "")
    {
        alert ( "Please enter username." );
		document.userform.userName.focus();
        return false;
    }
	 if (document.userform.password.value == "")
    {
        alert ( "Please enter password." );
		document.userform.password.focus();
        return false;
    }
	 if (document.userform.confirmPassword.value == "")
    {
        alert ( "Please enter confirm password." );
		document.userform.confirmPassword.focus();
        return false;
    }

	if (document.userform.confirmPassword.value != document.userform.password.value)
    {
        alert ( "Confirm password must be same." );
		document.userform.confirmPassword.focus();
        return false;
    }
    if ((emailID.value==null)||(emailID.value=="")){
	  alert("Please Enter your Email Address")
	  emailID.focus()
	  return false
	  }
	  if (emailcheck(emailID.value)==false){
	  emailID.value=""
	  emailID.focus()
	  return false
	  }

	 if (document.userform.contactNo.value == "")
    {
        alert ( "Please enter contact no." );
		document.userform.contactNo.focus();
        return false;
    }

	 if (document.userform.address.value == "")
    {
        alert ( "Please enter address." );
		document.userform.address.focus();
        return false;
    }
	
	 if (document.userform.countryName.value == "")
    {
        alert ( "Please enter country." );
		document.userform.countryName.focus();
        return false;
    }

	if (document.userform.state.value == "")
    {
        alert ( "Please enter state." );
		document.userform.state.focus();
        return false;
    }
	
	return true;
}


function validLogin()
{

    if (document.loginform.userName.value == "")
    {
        alert ( "Please enter Login Name." );
		document.loginform.userName.focus();
        return false;
    }
	 if (document.loginform.password.value == "")
    {
        alert ( "Please enter password." );
		document.userform.password.focus();
        return false;
    }
	return true;
}

function passValid()
{

 
   if (document.changepassform.oldpassword.value == "")
    {
        alert ( "Please enter Old password." );
		document.changepassform.oldpassword.focus();
        return false;
    }
	if (document.changepassform.newpassword.value == "")
    {
        alert ( "Please enter new password." );
		document.changepassform.newpassword.focus();
        return false;
    }

	 if (document.changepassform.cpassword.value == "")
    {
        alert ( "Please enter confirm password." );
		document.changepassform.cpassword.focus();
        return false;
    }

	if (document.changepassform.cpassword.value != document.changepassform.newpassword.value)
    {
        alert ( "Confirm password must be same." );
		document.changepassform.cpassword.focus();
        return false;
    }
	return true;

}
