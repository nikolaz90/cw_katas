function moveZeros(arr) {
  const temp = arr.filter((i) => i === 0)
  return arr.filter((i) => i !== 0).concat(temp)
}

console.log(moveZeros([1,2,0,1,0,1,0,3,0,1]))
