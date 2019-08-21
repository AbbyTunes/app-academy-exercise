start_idx = i 
end_idx = 




function dedede (name) {

  var my_func = function callback() {
    console.log(name);
  };

  setTimeout(my_func, 1000);
}

function setTimeout(callback, time) {
  os.sleep(time);
  callback();
}