// * 要素 HTML表示
for (let i = 0; i < 10; i++) {
  let tr = $('<tr>');
  for (var j = 0; j < 10; j++) {
    var mathNum = i * 10 + j + 1;
    tr.append($('<td>').text(mathNum));
  }
  $('#table').append(tr);  
}

// ! jquery
// $(function() {
//   $('td').click(function() {

//     // $(this).each(function() {
//       $(this).toggleClass('color')
//     // })
//   })
// })


// * 要素押下後、色を変える
var trigger = document.querySelectorAll('td');
const array = []
for(var i = 0; i < trigger.length ; i++) {
  trigger[i].onclick = function(e) {
    e.path[0].classList.toggle('color')
    console.log(e.path[0])
    array.push(e.target.innerHTML)
    // console.log(array)
    sessionStorage.setItem("クリックした値", [array])
  }
}

// * 再生関数
document.getElementById("button").onclick = function() {
  const value = sessionStorage.getItem('クリックした値');
  const arraySession = value.split(',')
  aaaa(arraySession.length, arraySession);
};

// *再現
function aaaa(times, arraySession){
	var timer_id;
  var i = 0;
	timer_id = setInterval((function(){
    // console.log(arraySession[i])
    demo(arraySession[i])
    i++;
    if (i == times) {
      clearInterval(timer_id);
    }
  }), 1000);
};
function demo(value) {
  var triggerEnd = document.querySelectorAll('td');
  // console.log(triggerEnd)
  console.log(value)
  for(var i = 0; i < triggerEnd.length ; i++) {
    // console.log(triggerEnd[i].innerText)
  }
}