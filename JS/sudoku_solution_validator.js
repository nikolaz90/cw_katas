// https://www.codewars.com/kata/529bf0e9bdf7657179000008/train/javascript

function validSolution(board){
  if(!cols(board) || !blocks(board) || !rows(board)) return false
  return true
}

function cols(arr) {
  for (let i=0; i<9; i++){
    let row = []
    for(let j=0; j<9; j++){
      row.push(arr[j][i])
    }
    if(!validator(row)) return false
  }
  return true
}

function rows(arr) {
  for (let i=0; i<9; i++){
    if(!validator(arr[i])) return false
  }
  return true
}

function blocks(arr) {
  for (let i=0; i<9; i+=3){
    block1 = arr[i].slice(0, 3).concat(arr[i+1].slice(0,3)).concat(arr[i+2].slice(0,3))
    block2 = arr[i].slice(3, 6).concat(arr[i+1].slice(3,6)).concat(arr[i+2].slice(3,6))
    block3 = arr[i].slice(6, 9).concat(arr[i+1].slice(6,9)).concat(arr[i+2].slice(6,9))
    if(!validator(block1) || !validator(block2) || !validator(block3)) return false
  }
  return true
}

function validator(arr){
  const desiredArr = [1,2,3,4,5,6,7,8,9]
  return arr.sort().join('') === desiredArr.join('')
}

// console.log the following
console.log(validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 2],
  [6, 7, 2, 1, 9, 5, 3, 4, 8],
  [1, 9, 8, 3, 4, 2, 5, 6, 7],
  [8, 5, 9, 7, 6, 1, 4, 2, 3],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 6, 1, 5, 3, 7, 2, 8, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 4, 5, 2, 8, 6, 1, 7, 9]]) )// true

console.log(validSolution([[5, 3, 4, 6, 7, 8, 9, 1, 2],
  [6, 7, 2, 1, 9, 0, 3, 4, 8],
  [1, 0, 0, 3, 4, 2, 5, 6, 0],
  [8, 5, 9, 7, 6, 1, 0, 2, 0],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 0, 1, 5, 3, 7, 2, 1, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 0, 0, 4, 8, 1, 1, 7, 9]])) //false
