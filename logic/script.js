// * 要素 HTML表示
for (let i = 0; i < 10; i++) {
  let tr = $('<tr>');
  for (var j = 0; j < 10; j++) {
    var mathNum = i * 10 + j + 1;
    tr.append($('<td>').text(mathNum));
  }
  $('#table').append(tr);  
}

let recorderBtn = true;
let recordFlag = false;

// * 録画クリックする
const recorderClick = () => {
  if(recorderBtn) {
    recorderBtn = false;
    sessionStorage.clear();
    btnChange("録画中");
  } else {
    recorderBtn = true;
    btnChange("録画");
    sessionStorage.clear();
    isSession();
  }
};

// * ボタンテキスト変える
const btnChange = (value) => {
  document.getElementById("text").innerHTML = value;
}

// * 要素押下後、色を変える
const trigger = document.querySelectorAll('td');
const array = []
for(var i = 0; i < trigger.length ; i++) {
  trigger[i].onclick = (e) => {
    e.path[0].classList.toggle('color')
    console.log(e)
    array.push(e.target.innerHTML)
    if(document.getElementById("text").innerHTML == "録画中") {
      console.log("sessionに保存中")
      sessionStorage.setItem("クリックした値", [array])
    } 
  }
}

// * 再生 ボタン(保存)
const regenerateClick = () => {
  if(sessionStorage.getItem('クリックした値') == null) {
    isSession();
    return false;
  } else {
    const value = sessionStorage.getItem('クリックした値');
    const arraySession = value.split(',')
    interval(arraySession.length, arraySession);
    isSession();
  }
};

// *再現 console
const interval = (times, arraySession) => {
	let timer_id;
  let i = 0;
	timer_id = setInterval((function(){
    demonstrate(arraySession[i])
    i++;
    if (i == times) {
      clearInterval(timer_id);
    }
  }), 1000);
};

// * 再現 template
const demonstrate = (value) => {
  var triggerEnd = document.querySelectorAll('.color');
  console.log(triggerEnd)
  console.log(value)

  for(var i = 0; i < triggerEnd.length ; i++) {
    console.log(triggerEnd[i].innerText)
    if(triggerEnd[i].innerText == value ) {
      console.log("一致するよ！")
      triggerEnd[i].classList.toggle('demo')
    }
  }
}

// * セッションストレージに値が存在するか確認する
const isSession = () => {
  if(sessionStorage.getItem('クリックした値') == null) {
    document.getElementById("alert").innerHTML = "";
  } else {
    document.getElementById("alert").innerHTML = "録画記録あり";
  }
}