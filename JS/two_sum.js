 function twoSum(nums, target) {
  for(let i = 0; i < nums.length; i++) {
      for(let j = i + 1; j < nums.length; j++) {
          if(nums[i] + nums[j] === target)
              return [i, j];
      }
  }
};

function twoSumHash(nums, target) {
  let hash = new Map();
  for(let i = 0; i < nums.length; i++) {
      const temp = target - nums[i];
      if (hash.has(temp)) {
          return [hash.get(temp), i]
      }
      hash.set(nums[i], i)
  }
};

console.log(twoSum([3, 5, 55, 1, 76], 56).toString() === [2, 3].toString()) // true
console.log(twoSumHash([3, 5, 55, 1, 76], 56).toString() === [2, 3].toString()) // true
console.log(twoSum([3, 5, 55, 1, 76], 56).toString() === [1, 3].toString()) // false
console.log(twoSumHash([3, 5, 55, 1, 76], 56).toString() === [2, 4].toString()) // false
