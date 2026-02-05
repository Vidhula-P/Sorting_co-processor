// TimSort is a hybrid sorting algorithm that uses the ideas of Merge Sort and Insertion Sort.
// Verilog handles Insertion sort

module testbech;

  // Export SV function to C
  export "DPI-C" function sv_sort;

  function void sv_sort(inout int arr[5]);
    int i, j, key;
    $display("\nSV received: arr=%0p", arr);
    for(i=1; i<5; i++) begin
      key = arr[i]; // current element being considered
      j = i-1;
      while (j>=0 && key<arr[j]) begin
        arr[j+1] = arr[j];
        j-=1;
      end
      arr[j+1] = key;
    end
  endfunction

  // Import C function
  import "DPI-C" context function void call_sv_from_c();

  initial begin
    call_sv_from_c();
  end

endmodule