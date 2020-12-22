// * 要素 HTML表示
for (let i = 0; i < 10; i++) {
  let tr = $('<tr>'); //10行
  for (var j = 0; j < 10; j++) {
    var mathNum = i * 10 + j + 1; //箱 番号
    tr.append($('<td>').text(mathNum));
  }
  $('#table').append(tr);  
}

let recorderBtn = true;
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
// * 録画ボタン テキスト変換
const btnChange = (value) => {
  document.getElementById("text").innerHTML = value;
}
// * 要素押下後、色を変える
const trigger = document.querySelectorAll('td');
const array = []
for(var i = 0; i < trigger.length ; i++) {
  trigger[i].onclick = (e) => {
    e.path[0].classList.toggle('color') // path: Array(8) [0] == td
    if(document.getElementById("text").innerHTML == "録画中") {
      array.push(e.target.innerHTML)
      console.log("sessionに保存中")
      sessionStorage.setItem("クリックした値", [array])
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

// * 再生 ボタン (保存)
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
  let i = 0;
	const timer_id = setInterval((function(){
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
  console.log(value)
  for(var i = 0; i < triggerEnd.length ; i++) {
    if(triggerEnd[i].innerText == value ) {
      triggerEnd[i].classList.toggle('demo')
    }
  }
}
