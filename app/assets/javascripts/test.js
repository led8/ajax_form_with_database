// var questions = gon.questions
// var answers = gon.answers
// var count = 1
// var q2 = `${questions[1].title}`

// var ans2 = []
// answers.forEach(function(el){if(el.question_id == 2){ans2.push(el)}})

// var a2 = ans2.map((el, ind) => {
//   return `
//     <div>
//       <input type=${el.answer_type} label="false" id=${el.order.toString()} value=${el.value} name=${el.parameter} >
//       <label for=${el.order.toString()} >
//     </div>
//   `
// }).join('')

// const add = (e) => {
//   e.preventDefault();
//   document.querySelector(`.question-${count}`).style.display = "none"
//   document.querySelector('form').insertAdjacentHTML('afterend',`<div>${q2}</div>${a2}`)
// }

// document.querySelector(`.btn-${count}`).addEventListener('click', add);
// // $(`.btn-${count}`).click(function(e){
// //   e.preventDefault();
// //   $(`.question-${count}`).hide();
// //   $('form').append(`<div>${q2}</div>`)
// // })


$( document ).ready(function() {
    $('.selectize').selectize();
});

$('.button').click(function(){
  if($('select').val() != null){
    console.log('next step')
  }
  else if($('select').val() == null){
    console.log('you have to choose')
  }
})

var form = document.getElementById('new_privacy_notice');

if(form){
  const preventSubmitFormOnEnter = (e) => {
    if (e.keyCode === 13) {
      e.preventDefault();
      return false;
    }
  };
  form.addEventListener("keypress", preventSubmitFormOnEnter);
}






