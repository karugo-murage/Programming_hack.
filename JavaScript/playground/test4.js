// you can write to stdout for debugging purposes, e.g.
// console.log('this is a debug message');

function solution(B) {
  // write your code in JavaScript (Node.js 8.9.4)
  const nn = B.length;
  const m = B[0].length;
  const used = [];
  function follow(i, j) {
    if (i < 0 || j < 0) return 0;
    if (i > nn - 1 || j > nn - 1) return 0;
    const name = i + ":" + j;
    if (used.includes(name)) {
      return 0;
    }
    used.push(name);
    let n = 1;
    if (B[i + 1] && B[i + 1][j] === "#") {
      n += follow(i + 1, j);
    }
    if (B[i - 1] && B[i - 1][j] === "#") {
      n += follow(i - 1, j);
    }
    if (B[i][j + 1] && B[i][j + 1] === "#") {
      n += follow(i, j + 1);
    }
    if (B[i][j - 1] && B[i][j - 1] === "#") {
      n += follow(i, j - 1);
    }
   // console.log(i,j)
 //   if (n > 1) used.push(name);
    return n;
  }
  let one = 0;
  let two = 0;
  let three = 0;

  for (let i = 0; i < nn - 1; i++) {
    for (let j = 0; j < m - 1; j++) {
      let n = follow(i, j);
      if (n === 1) {
        one += 1;
      }
      if (n === 2) {
        two += 1;
      }
      if (n === 3) {
        three += 1;
      }
      console.log(n);
    }
  }
  return [one, two, three];
}

const s = solution([".##.#", "#.#..", "#...#", "#.##."]);
console.log("solutuion", s);
