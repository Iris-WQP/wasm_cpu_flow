const wasmInstance =
      new WebAssembly.Instance(wasmModule, {}); 
const { g0, g1, g2, g3, g4, g5, g6, g7, g8, g9 } = wasmInstance.exports; 
 
console.log(g0.value);
console.log(g1.value); 
console.log(g2.value);   
console.log(g3.value); 
console.log(g4.value);  
console.log(g5.value);  
console.log(g6.value); 
console.log(g7.value); 
console.log(g8.value); 
console.log(g9.value); 