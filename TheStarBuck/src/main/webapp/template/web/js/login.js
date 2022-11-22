const ipnElement = document.querySelector('#pass')
const btnElement = document.querySelector('#passeye')


// step 2
btnElement.addEventListener('click', function() {
  // step 3
  const currentType = ipnElement.getAttribute('type')
  // step 4
  ipnElement.setAttribute(
    'type',
    currentType === 'password' ? 'text' : 'password'
  )
})
const ipnElement1 = document.querySelector('#retypepass')
const btnElement1 = document.querySelector('#passeye')


// step 2
btnElement1.addEventListener('click', function() {
  // step 3
  const currentType = ipnElement1.getAttribute('type')
  // step 4
  ipnElement1.setAttribute(
    'type',
    currentType === 'password' ? 'text' : 'password'
  )
})
//
// const ipnElement2 = document.querySelector('#passold')
// const btnElement2 = document.querySelector('#passeye')
//
//
// // step 2
// btnElement2.addEventListener('click', function() {
//   // step 3
//   const currentType = ipnElement2.getAttribute('type')
//   // step 4
//   ipnElement2.setAttribute(
//     'type',
//     currentType === 'password' ? 'text' : 'password'
//   )
// });
