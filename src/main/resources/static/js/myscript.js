/**
 * 
 */

 function loginCheck(){
	//로그인 유효성 검사 (아이디, 비밀번호)	
	
	
	 //1.아이디 5~10글자 입력
    let id= document.getElementById("id").value;
    id=id.trim();
    
    if (!(id.length<=10 && id.length>=5)) {
        alert("아이디는 5~10글자 이내로 입력해야 합니다");
        document.getElementById("id").focus();
        return false;
    }

    //3. 5~10글자 입력
    let passwd= document.getElementById("passwd").value;
    passwd=passwd.trim();
    
    if (!(passwd.length<=10 && passwd.length>=5)) {
        alert("비밀번호는 5~10글자 이내로 입력해야 합니다");
        document.getElementById("passwd").focus();
        return false;
    }
    return true;
	
}


function idCheck(){

//window.open("파일명","창이름","옵션들");	
window.open("idCheckForm","idwin","width=400,height=350");		
}

function emailCheck(){

//window.open("파일명","창이름","옵션들");	
window.open("emailCheckForm","emailwin","width=400,height=350");		
}

function memberCheck(){
	//1)아이디 5~10글자 인지?
	let id= document.getElementById("id").value;
    id=id.trim();
    
    if (!(id.length<=10 && id.length>=5)) {
        alert("아이디는 5~10글자 이내로 입력해야 합니다");
        document.getElementById("id").focus();
        return false;
    }
    //2)비밀번호 5~10글자 인지?
	 let passwd= document.getElementById("passwd").value;
    passwd=passwd.trim();
    
    if (!(passwd.length<=10 && passwd.length>=5)) {
        alert("비밀번호는 5~10글자 이내로 입력해야 합니다");
        document.getElementById("passwd").focus();
        return false;
    }
    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
	let passwd1= document.getElementById("passwd1").value;
    passwd1=passwd1.trim();
	if (!(passwd==passwd1)) {
        alert("비밀번호가 다릅니다 확인해주십시오");
        document.getElementById("passwd1").focus();
        return false;
    }
	
    //4)이름 두글자 이상 인지?
	let mname= document.getElementById("mname").value;
    mname=mname.trim();
    
    if (mname.length<2) {
        alert("이름은 2글자 이상 입력해야 합니다");
        document.getElementById("mname").focus();
        return false;
    }
    
    //5)이메일 5글자 인지?
	let email= document.getElementById("email").value;
    email=email.trim();
    
    if (email.length<2) {
        alert("이메일은  5글자 이상 입력해야 합니다");
        return false;
    }
			
   return true; 
}

function pwCheck(){
	let passwd= document.getElementById("passwd").value;
    passwd=passwd.trim();
    if (passwd.length<4 || isNaN(passwd)) {
        alert("비밀번호는 4글자 이상 숫자로 입력하세요");
        document.getElementById("passwd").focus();
        return false;
}

let message="탈퇴한 아이디로 재가입이 불가능 합니다.\n 계속 진행할까요?"
if(confirm(message)){
	//확인 true 취소 false
	return true;
}else{
	return false;
}
}



function findCheck(){
let mname= document.getElementById("mname").value;
    mname=mname.trim();
    
    if (mname.length<2) {
        alert("이름은 두글자 이상 입력");
        document.getElementById("mname").focus();
        return false;
    }
	let email = document.getElementById("email").value;
		email = email.trim();
		if (email.length< 5) {
			alert(" 이메일은 5글자 이상 입력해 주세요");
			return false;
		}
return true;
}
/* partner  유효성 검사*/

function partneridCheck(){

//window.open("파일명","창이름","옵션들");	
window.open("partneridCheckForm","idwin","width=400,height=350");		
}

function partneremailCheck(){

//window.open("파일명","창이름","옵션들");	
window.open("partneremailCheckForm","emailwin","width=400,height=350");		
}

function partnerCheck(){
	//1)아이디 5~10글자 인지?
	let p_id= document.getElementById("p_id").value;
    p_id=p_id.trim();
    
    if (!(p_id.length<=10 && p_id.length>=5)) {
        alert("아이디는 5~10글자 이내로 입력해야 합니다");
        document.getElementById("p_id").focus();
        return false;
    }
    //2)비밀번호 5~10글자 인지?
	 let p_passwd= document.getElementById("p_passwd").value;
     p_passwd=p_passwd.trim();
    
    if (!(p_passwd.length<=10 && p_passwd.length>=5)) {
        alert("비밀번호는 5~10글자 이내로 입력해야 합니다");
        document.getElementById("p_passwd").focus();
        return false;
    }
    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
	let p_passwd1= document.getElementById("p_passwd1").value;
    p_passwd1=p_passwd1.trim();
	if (!(p_passwd==p_passwd1)) {
        alert("비밀번호가 다릅니다 확인해주십시오");
        document.getElementById("p_passwd1").focus();
        return false;
    }
	
    //4)이름 두글자 이상 인지?
	let p_name= document.getElementById("p_name").value;
    p_name=p_name.trim();
    
    if (p_name.length<2) {
        alert("이름은 2글자 이상 입력해야 합니다");
        document.getElementById("p_name").focus();
        return false;
    }
    
    //5)이메일 5글자 인지?
	let p_email= document.getElementById("p_email").value;
    p_email=p_email.trim();
    
    if (p_email.length<2) {
        alert("이메일은  5글자 이상 입력해야 합니다");
        return false;
    }
			
	let p_level=dcocument.getElementById("p_level").value;
	p_level=p_level.trim();
	if(p_level="none"){
		alert("판매하시는 품목을 선택해주세요!");
		return false;
	}	
   return true; 
}

function partnerloginCheck(){
	//로그인 유효성 검사 (아이디, 비밀번호)	
	
	
	 //1.아이디 5~10글자 입력
    let p_id= document.getElementById("p_id").value;
    p_id=p_id.trim();
    
    if (!(p_id.length<=10 && p_id.length>=5)) {
        alert("아이디는 5~10글자 이내로 입력해야 합니다");
        document.getElementById("p_id").focus();
        return false;
    }

    //3. 5~10글자 입력
    let p_passwd= document.getElementById("p_passwd").value;
    p_passwd=p_passwd.trim();
    
    if (!(p_passwd.length<=10 && p_passwd.length>=5)) {
        alert("비밀번호는 5~10글자 이내로 입력해야 합니다");
        document.getElementById("p_passwd").focus();
        return false;
    }
    return true;
	
}


function partnerfindCheck(){
let p_name= document.getElementById("p_name").value;
    p_name=p_name.trim();
    
    if (p_name.length<2) {
        alert("이름은 두글자 이상 입력");
        document.getElementById("p_name").focus();
        return false;
    }
    
	let p_email = document.getElementById("p_email").value;
		p_email = p_email.trim();
		if (p_email.length< 5) {
			alert(" 이메일은 5글자 이상 입력해 주세요");
			return false;
		}
return true;
}

function ppwCheck(){
	let p_passwd= document.getElementById("p_passwd").value;
    p_passwd=p_passwd.trim();
    if (p_passwd.length<4 || isNaN(p_passwd)) {
        alert("비밀번호는 4글자 이상 숫자로 입력하세요");
        document.getElementById("p_passwd").focus();
        return false;
}

let message="등록한 상품도 모두 삭제 됩니다.\n 계속 진행할까요?"
if(confirm(message)){
	//확인 true 취소 false
	return true;
}else{
	return false;
}
}



