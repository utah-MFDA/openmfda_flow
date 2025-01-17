# place_cell -inst_name device.one.column_lower.thing -origin { 0 0 } -orient R0 -status FIRM
# place_cell -inst_name device.one.column_upper.thing -origin { 420 0 } -orient R0 -status FIRM
# place_cell -inst_name device.one.circulate2.thing -origin { 840 0  } -orient R0 -status FIRM
# place_cell -inst_name device.one.circulate1.thing -origin { 1260 0  } -orient R0 -status FIRM
# place_cell -inst_name device.two.column_upper.thing -origin { 0 420 } -orient R0 -status FIRM
# place_cell -inst_name device.two.column_lower.thing -origin { 420 420  } -orient R0 -status FIRM
# place_cell -inst_name device.two.circulate2.thing -origin { 840 420  } -orient R0 -status FIRM
# place_cell -inst_name device.two.circulate1.thing -origin { 1260 420  } -orient R0 -status FIRM
place_macro -macro_name device.one.column_lower.thing -location { 0 0 } -orientation R0 -exact
place_macro -macro_name device.one.column_upper.thing -location { 420 0 } -orientation R0 -exact
place_macro -macro_name device.one.circulate2.thing -location { 840 0  } -orientation R0 -exact
place_macro -macro_name device.one.circulate1.thing -location { 1260 0  } -orientation R0 -exact
place_macro -macro_name device.two.column_upper.thing -location { 0 420 } -orientation R0 -exact
place_macro -macro_name device.two.column_lower.thing -location { 420 420  } -orientation R0 -exact
place_macro -macro_name device.two.circulate2.thing -location { 840 420  } -orientation R0 -exact
place_macro -macro_name device.two.circulate1.thing -location { 1260 420  } -orientation R0 -exact
