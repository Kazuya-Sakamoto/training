// * 要素 HTML表示
for (let i = 0; i < 10; i++) {
  let tr = $('<tr>');
  for (var j = 0; j < 10; j++) {
    var mathNum = i * 10 + j + 1;
    tr.append($('<td>').text(mathNum));
  }
  $('#table').append(tr);  
}

// * 要素押下後、色を変える
$(function() {
  $('td').click(function() {
    $(this).each(function() {
      $(this).toggleClass('color')
    })
  })
})