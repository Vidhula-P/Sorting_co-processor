// Verilog handles Count sort

module testbench;

  // Export SV function to C
  export "DPI-C" function count_sort;

  // cannot pass dynamic array in export function
  function automatic void count_sort(inout int arr[20],input int exp);
    int out [20]; // will store output
    int count[10]; // stores number of occurences of each digit
    int i, n;
    
    n = 20; // size of array; 
    		//fixed because export functions cannot have dynamic array
    
    // Store count of occurrences of a digit in count[digit]
    for (int i = 0; i < n; i++) begin
      count[(arr[i] / exp) % 10]+=1;
    end
    
    // Change count[i] so that count[i] now 
    // contains actual position+1 of this digit in output[]
    // Ex if count[0] = 6 and count[1] = 2, 0 needs to be 0-5 and 1 will be in 6-7
    // Notice the "-1" in the next loop
    for (int i = 1; i < 10; i++) begin
      count[i] += count[i - 1]; // cumulative add
    end
    
    // Build the output array
    // since for one digit, count sort preserves insertion order, we start from end of array
    for (int i = n - 1; i >= 0; i--) begin
        out[count[(arr[i] / exp) % 10] - 1] = arr[i];
        count[(arr[i] / exp) % 10]--;
    end
    
    // Copy the output array back to arr[]
    for (int i = 0; i < n; i++) begin
        arr[i] = out[i];
    end
    
  endfunction

  // Import C function
  import "DPI-C" context function void call_sv_from_c();

  initial begin
    call_sv_from_c();
  end

endmodule
