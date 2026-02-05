// Verilog handles Count sort

module testbench;

  // Export SV function to C
  export "DPI-C" function count_sort;

  // cannot pass dynamic array in export function
  function void count_sort(inout int arr[20],input int exp);
    int out [20]; // will store output
    int count[10]; // stores number of occurences of each digit
    int i, n;
    
    n = 20; // size of array; 
    		//fixed because export functions cannot have dynamic array
    
    $display("\nSV received: arr=%0p", arr);
    
    // Store count of occurrences in count[]
    for (int i = 0; i < n; i++) begin
      count[(arr[i] / exp) % 10]+=1;
    end
    
    $display("Step 1: count = %p",count);
    
    // Change count[i] so that count[i] now 
    // contains actual position of this digit
    // in output[]
    for (int i = 1; i < 10; i++) begin
      count[i] += count[i - 1]; // cumulative add
    end
    
    $display("Step 2: count = %p",count);
    
    // Build the output array
    for (int i = n - 1; i >= 0; i--) begin
        out[count[(arr[i] / exp) % 10] - 1] = arr[i];
        count[(arr[i] / exp) % 10]--;
    end
    
    $display("Step 3: out = %p",out);
    
    // Copy the output array back to arr[]
    for (int i = 0; i < n; i++) begin
        arr[i] = out[i];
    end
    
    $display("Step 4: out = %p",out);
    
  endfunction

  // Import C function
  import "DPI-C" context function void call_sv_from_c();

  initial begin
    call_sv_from_c();
  end

endmodule