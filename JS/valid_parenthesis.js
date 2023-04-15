function validParentheses(parens) {
  let stock = []
  for(let i = 0; i< parens.length; i++){
    const first = stock[0]
    if(parens[i] === '('){
      stock.push(parens[i])
    }else if(parens[i] === ')' && first === '(' ){
      stock.pop()
    }else if(parens[i] === ')'){
      stock.push(parens[i])
    }
  }
  return stock.length === 0;
}

console.log(validParentheses( "(" ))
console.log(validParentheses( ")" ))
console.log(validParentheses( "" ))
console.log(validParentheses( "()" ))
console.log(validParentheses( "())" ))
