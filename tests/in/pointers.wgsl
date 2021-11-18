fn f() {
   var v: vec2<i32>;
   let px = &v.x;
   *px = 10;
}

[[block]]
struct DynamicArray {
    array: array<u32>;
};

fn index_dynamic_array(p: ptr<workgroup, DynamicArray>, i: i32, v: u32) -> u32 {
   let old = (*p).array[i];
   (*p).array[i] = v;
   return old;
}

[[group(0), binding(0)]]
var<storage, read_write> dynamic_array: DynamicArray;

fn index_unsized(i: i32, v: u32) {
   let p: ptr<storage, DynamicArray, read_write> = &dynamic_array;

   let val = (*p).array[i];
   (*p).array[i] = val + v;
}

fn index_dynamic_array(i: i32, v: u32) {
   let p: ptr<storage, array<u32>, read_write> = &dynamic_array.array;

   let val = (*p)[i];
   (*p)[i] = val + v;
}
