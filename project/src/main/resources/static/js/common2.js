// ------------------------------------
// 개발 중에만 에러 정보 안내 메시지를 표현하기 위한 변수
// ------------------------------------
const DEVELOPING = true;

// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// JQuery 객체 오브젝트가 비어 있는지 확인하는 함수 선언
// 선택자를 잘못 입력하여 객체 생성시 length 값 0을 활용
// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function isEmptyObject(tagObj) {
    return (tagObj.length <= 0);
}

// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// 개발자 메시지와 사용자 메시지를 구분하여 alert 표시한다
// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function alertDebugOrUser(dev_msg, user_msg) {
    if (DEVELOPING) {
        alert(dev_msg);
    } 
    else {
        if ( user_msg != undefined){
            alert(user_msg);
        }        
    }
}

// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// 입력양식 태그에 입력된 문자열의 유효성 체크 함수 선언
// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function checkVal (
        tagObj          // 입력양식 태그를 관리하는 JQuery 객체 메위주
    ,   regExpObj       // 문자열의 패턴을 검사하는 regExp 객체 메위주
    ,   msg             // 경고 문구
    ) 
{
    try {
        // ----------------------------------------------
        // 입력양식 태그를 관리하는 JQuery 객체가 
        // 관리하는 태그가 0 개면 경고하고 함수 중단하기
        // ----------------------------------------------
        if ( isEmptyObject( tagObj ) ) {
            alertDebugOrUser("checkVal 함수 호출 시 1번째 매개변수로 들어오는 JQuery 객체가 관리하는 태그가 없습니다.");
            return false;
        }

        // ----------------------------------------------
        // JQuery 객체가 
        // 관리하는 태그의 입력값을 읽어 변수 value 에 저장하기
        // ----------------------------------------------
        var value = tagObj.val();
        // ----------------------------------------------
        // 입력값이 regExp 객체가 관리하는 패턴에 맞지 않으면 경고하기
        // ----------------------------------------------
        var check = regExpObj.test(value);
        if (check == false) {
            alert(msg);
        }

        // ----------------------------------------------
        // true 나 false 값 리턴하기
        // ----------------------------------------------
        return check;
    }
    catch (e) {
        alertDebugOrUser("checkVal 함수 예외발생!" + e.message, "관리자에게 문의 바랍니다.");
        return false;
    }
}

// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// 체크 입력양식 태그의 체크 개수 유효성 체크 함수 선언
// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function checkChecked(
        tagObj              // 체크 입력양식 태그를 관리하는 JQuery 객체 메위주
    ,   minCheckedCnt       // 최소 체크 개수
    ,   msg                 // 경고 문구
    ) 
{
    try {
        if ( isEmptyObject( tagObj ) ) {
            alertDebugOrUser("checkChecked 함수 호출 시 1번째 매개변수로 들어오는 JQuery 객체가 관리하는 태그가 없습니다.");
            return false;
        }

        // ------------------------------------------------------
        // 체크 입력양식 태그 중에 체크 된 놈의 개수를 변수 checkedCnt 에 저장하기
        // ------------------------------------------------------
        var checkedCnt = tagObj.filter(":checked").length;
        // ------------------------------------------------------
        // 만약에 체크된 놈의 개수가 최소 체크 개수 보다 작으면 경고하고 함수 중단하기
        // ------------------------------------------------------
        if (checkedCnt < minCheckedCnt) {
            alert(msg);
            return false;
        }

        // ------------------------------------------------------
        // true 값 리턴하기
        // ------------------------------------------------------
        return true;
    }
    catch (e) {
        alertDebugOrUser("checkChecked 함수 예외발생!" + e.message, "관리자에게 문의 바랍니다.");
        return false;
    }
}

// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// 7자리 주민번호 유효성 체크 함수 선언.
// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function checkJumin_num7(tagObj) {
    try {
        if ( isEmptyObject( tagObj ) ) {
            alertDebugOrUser("checkJumin_num7 함수 호출 시 1번째 매개변수로 들어오는 JQuery 객체가 관리하는 태그가 없습니다.");
            return false;
        }

        // -----------------------------------------
        // 주민번호 7개를 읽어와서 변수 jumin_num7 에 저장하기
        // -----------------------------------------
        var jumin_num7 = tagObj.val();

        // -----------------------------------------
        // 주민번호 7자리가 모두 숫자인지 확인
        // -----------------------------------------
        var regExp = new RegExp(/^[0-9]{7}$/);
        var result = regExp.test(jumin_num7);

        if (result == false) {
            alert("주민번호는 숫자 7자리입니다.");
            tagObj.val("");
            return false;
        }

        // -----------------------------------------
        // 주민번호 7번째 자리가 1~4 인지 확인
        // -----------------------------------------
        regExp = new RegExp(/[1234]$/);
        result = regExp.test(jumin_num7);

        if (result == false) {
            alert("주민번호 7번째 자리는 1~4 사이어야 합니다.");
            return false;
        }

        // -----------------------------------------
        // 주민번호 7자리에 년월일의 존재 여부 확인
        // -----------------------------------------
        var num7 = jumin_num7.substr(6, 1);
        var year = jumin_num7.substr(0, 2);
        var month = jumin_num7.substr(2, 2);
        var date = jumin_num7.substr(4, 2);

        if (num7 == "1" || num7 == "2") {
            year = "19" + year;
        }
        else {
            year = "20" + year;
        }

        year = parseInt(year, 10);
        month = parseInt(month, 10);
        date = parseInt(date, 10);

        var dateObj = new Date(year, month - 1, date);

        if ( isValidDate(year, month, date) == false ) {
            alert("주민번호 7자리에 존재하지 않는 년월일이 있습니다.");
            //tagObj.val("");
            return false;
        }

        // -----------------------------------------
        // 주민번호 7자리에 년월일이 미래인지 확인
        // -----------------------------------------
        var birthDateObj = new Date(year, month - 1, date);
        var nowDateObj = new Date();

        if ( ( birthDateObj.getTime() - nowDateObj.getTime() ) > 0 ) {
            alert("주민번호 7자리에 년월일이 미래입니다. 다시 입력바람.");
            //tagObj.val("");
            return false;
        }

        // -----------------------------------------
        // 주민번호 7자리에 20세가 넘었는지 확인
        // -----------------------------------------
        if ( ( nowDateObj.getFullYear() - birthDateObj.getFullYear() ) < 20 ) {
            alert("20세 미만은 가입이 불가능합니다.");
            //tagObj.val("");
            return false;
        }

        return true;
    }
    catch (e) {
        alertDebugOrUser("checkJumin_num7 함수 예외발생!" + e.message, "관리자에게 문의 바랍니다.");
        return false;
    }    
}

// Valid == 합당한, 타당한
// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// 매개변수로 들어오는 [년월일] 이 존재하는 [년월일]이면 true 를 리턴하는 함수 선언
// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function isValidDate(year, month, date) {
    try {
        year = parseInt(year, 10);
        month = parseInt(month, 10);
        date = parseInt(date, 10);
        var dateObj = new Date(year, month - 1, date);

        return dateObj.getFullYear() == year
            && dateObj.getMonth() + 1 == month
            && dateObj.getDate() == date;
    }
    catch (e) {
        alertDebugOrUser("isValidDate 함수 호출 시 예외 발생!" + e.message);
        return false;
    }
}

// 아래는 테이블 관련 함수 -----------------------------------------------------------
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// 테이블의 헤더/홀수/짝수 tr 의 배경색 삽입하는 함수 선언
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function addTrBgColor(
        tableClassVal           // table 태그의 클래스 값
    ,   headerTrBgColor         // 헤더 tr 의 배경색
    ,   oddTrBgColor            // 인덱스번호로 홀수 tr 의 배경색
    ,   evenTrBgColor           // 인덱스번호로 짝수 tr 의 배경색
    ) 
{
    try {
        // -----------------------------------------------
        // class=변수tableClassVal값을 가진 태그를 관리하는
        // JQuery 객체 메위주를 변수 tableObj 에 저장하기
        // -----------------------------------------------
        var tableObj = $("." + tableClassVal);

        if ( isEmptyObject( tableObj ) ) {
            alertDebugOrUser("addTrBgColor 함수 호출 시 1번째 매개변수로 들어오는 JQuery 객체가 관리하는 태그가 없습니다.");
            return false;
        }

        // -----------------------------------------------
        // class=변수tableClassVal값을 가진 태그를 관리하는
        // JQuery 객체의 find 메소드를 호출하여
        // 후손 중에 tr 태그를 골라 관리하는
        // JQuery 객체 메위주를 변수 trsObj 에 저장하기
        // -----------------------------------------------
        var trsObj = tableObj.find("tr");

        // -----------------------------------------------
        // class=변수tableClassVal값을 가진 태그의
        // 후손 tr 중 첫째 tr 태그에 bgColor = 변수headerTrBgColor값 삽입하기
        // -----------------------------------------------
        // 즉 첫번째 tr 의 배경색을 지정하기
        // -----------------------------------------------
        trsObj.first().attr("bgColor", headerTrBgColor);
        // -----------------------------------------------
        // class=변수tableClassVal값을 가진 태그의
        // 후손 tr 중 첫째 tr 태그가 아닌 tr 태그 중에 인덱스번호가 홀수인 놈에
        // bgColor = 변수oddTrBgColor값 삽입하기
        // -----------------------------------------------
        // 즉 첫번째 tr 이 아닌 나머지 tr 중에 인덱스번호가 홀수인 놈의 배경색을 지정하기
        // -----------------------------------------------
        trsObj.not(":first").filter(":odd").attr("bgColor", oddTrBgColor);

        // -----------------------------------------------
        // 만약에 매개변수 evenTrBgColor 가 null 이 아닐때
        // -----------------------------------------------
        if (evenTrBgColor != null) {
            // -----------------------------------------------
            // class=변수tableClassVal값을 가진 태그의
            // 후손 tr 중 첫째 tr 태그가 아닌 tr 태그 중에 인덱스번호가 짝수인 놈에
            // bgColor = 변수evenTrBgColor값 삽입하기
            // -----------------------------------------------
            // 즉 첫번째 tr 이 아닌 나머지 tr 중에 인덱스번호가 짝수인 놈의 배경색을 지정하기
            // -----------------------------------------------
            trsObj.not(":first").filter(":even").attr("bgColor", evenTrBgColor);
        }
    }
    catch (e) {
        alertDebugOrUser("addTrBgColor 함수 예외발생!" + e.message, "관리자에게 문의 바랍니다.");
        return false;
    }
}

//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// 테이블안에 일련번호가 있는 1열을 삽입하는 함수 선언
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function addSerialNoColumn(
        tableClassVal               // table 태그의 클래스 값
    ,   asc_desc                    //  "asc" 가 들어오면 정순일련번호 컬럼 삽입 or "desc" 가 들어오면 역순일련번호 컬럼 삽입
    ) 
{
    try {
        // ----------------------------------
        // class=변수tableClassVal값 을 가진 태그를 관리하는 
        // JQuery 객체 메위주를 변수 tableObj 에 저장하기
        // ----------------------------------
        var tableObj = $("." + tableClassVal);

        if ( isEmptyObject( tableObj ) ) {
            alertDebugOrUser("addSerialNoColumn 함수 호출 시 1번째 매개변수로 들어오는 JQuery 객체가 관리하는 태그가 없습니다.");
            return false;
        }

        // ----------------------------------
        // class=변수tableClassVal값  가진 태그를 관리하는 
        // JQuery 객체의 find 메소드를 호출하여
        // 후손 중에 tr 태그를 골라 관리하는 
        // JQuery 객체 메위주를 변수 trsObj 에 저장하기
        // ----------------------------------
        var trsObj = tableObj.find("tr");
        // ----------------------------------
        // tr 태그의 개수를 변수 trsCnt 에 저장하기
        // ----------------------------------
        var trsCnt = trsObj.length;

        // -----------------------------------------------
        // 각각의 tr 태그를 관리하는 JQuery 객체 메위주를 저장할 변수 trObj 선언하기
        // -----------------------------------------------    
        var trObj = null;   // null은 참조형이기에 추후에 객체 메위주가 들어갈거라는 걸 내포한다.
        // -----------------------------------------------
        // 시작 일련번호를 저장한 변수 serialNo_asc 에 1 저장하기
        // -----------------------------------------------
        var serialNo_asc = 1;
        // -----------------------------------------------
        // 시작 역순일련번호를 저장한 변수 serialNo_desc 에 trsCnt - 1 저장하기
        // -----------------------------------------------
        var serialNo_desc = trsCnt - 1;

        // -----------------------------------------------
        // table 태그 내부에 각 tr 태그의 첫번째 자식으로
        // <th>번호</th> 또는 <td>정순일련번호</td> 또는 <td>역순일련번호</td> 삽입하기
        // -----------------------------------------------
        trsObj.each(function (i) {
            // ------------------------------
            // each 메소드가 잡은 태그를 관리하는 JQuery 객체 메위주를 얻어 변수 trObj 에 저장하기
            // ------------------------------
            trObj = $(this);
            // ------------------------------
            // 만약에 i 가 0 이면 (=익명 함수가 처음 호출되었을 때)
            // ------------------------------
            if (i == 0) {
                trObj.prepend("<th>번호</th>");
                trObj.attr("bgColor", "gray");
            }
            // ------------------------------
            // 아니면, i 가 0 이 아니면 (=익명 함수가 두번째 부터 호출되었을 때)
            // ------------------------------
            else {
                //-----------------------------------------------
                // 만약에 매개변수 asc_desc 에  "asc" 가 있으면
                //-----------------------------------------------
                if (asc_desc == "asc") {
                    // ---------------------------------
                    // <td>정순일련번호</td> 를 삽입하기
                    // ---------------------------------
                    trObj.prepend("<td>" + (serialNo_asc++) + "</td>");
                }
                //-----------------------------------------------
                // 아니면, 매개변수 asc_desc 에  "desc" 가 있으면
                //-----------------------------------------------
                else {
                    // ---------------------------------
                    // <td>역순일련번호</td> 를 삽입하기
                    // ---------------------------------
                    trObj.prepend("<td>" + (serialNo_desc--) + "</td>");
                }
            }
        });
    }
    catch (e) {
        alertDebugOrUser("addSerialNoColumn 함수 예외발생!" + e.message, "관리자에게 문의 바랍니다.");
        return false;
    }    
}

//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// 테이블안에 댄 tr 에 배경색 바꾸는 함수 선언
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function addMouseOnTrBgColor(
	    tableClassVal       // table 태그의 클래스 값
	,   mouseOnTrClassVal   // 마우스를 댄 tr 에 삽입할 클래스 값
)
{
    try {
        //----------------------------------
        // class=변수tableClassVal값   가진 태그를 관리하는 
        // JQuery 객체 메위주를 변수 tableObj 에 저장하기
        //----------------------------------
        var tableObj      = $("." + tableClassVal );

        if ( isJQObj(tableObj, "addMouseOnTrBgColor") == false ) {
            return false;
        }

        //----------------------------------
        // class=변수tableClassVal값  가진 태그를 관리하는 
        // JQuery 객체의 find 메소드를 호출하여
        // 후손 중에 tr 태그를 골라 관리하는 
        // JQuery 객체 메위주를 변수 trsObj 에 저장하기
        //----------------------------------
        var trsObj        = tableObj.find("tr");

        //-----------------------------------------------
        // tr 태그에 
        //      마우스를 대면  class=변수mouseOnTrClassVal값   을 삽입하기
        //      마우스를 빼면  class=변수mouseOnTrClassVal값   을 삭제하기
        //-----------------------------------------------
        trsObj.not(":first").hover( 
            function(){
                // -----------------------------------------------
                // 마우스를 댄 tr 태그의 class=변수mouseOnTrClassVal값   을 삽입하기
                // this 는 마우스를 갖다댄 tr 태그를 지칭하는 선택자가 저장된
                // 키워드성 지역변수이다.
                // -----------------------------------------------
                $(this).addClass(mouseOnTrClassVal);
            }
            , function(){
                // -----------------------------------------------
                // 마우스를 뺀 tr 태그의 class=변수mouseOnTrClassVal값   을 삽입하기
                // this 는 마우스를 뺀 tr 태그를 지칭하는 선택자가 저장된
                // 키워드성 지역변수이다.
                // -----------------------------------------------
                $(this).removeClass(mouseOnTrClassVal);
            } 
        );
    }
    catch (e) {
        alertDebugOrUser("addMouseOnTrBgColor 함수 예외발생!" + e.message, "관리자에게 문의 바랍니다.");
        return false;
    }
    
}

//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// JQuery 객체의 존재 여부를 true 또는 false 로 리턴하기 함수 선언
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function isJQObj(
        jqObj       // JQuery 객체 메위주
    ,   funcName    // 함수명
)
{
    if (jqObj.length == 0 ) {
        alert(funcName + " 함수에서 태그를 관리하지 않는 JQuery 객체 생성됐습니다.");
        return false;
    }
    return true;
}