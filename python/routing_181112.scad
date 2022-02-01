module  channel(first_point,length, dimmensions, color_channel, endings = [[0,0],[0,0]]){
    
    ending_0 = sign(length) >= 0 ? endings[0][0]:endings[0][1];
    ending_1 = sign(length) >= 0 ? endings[1][1]:endings[1][0];
    
    
    translate(first_point)
    color(color_channel){
        
        if (dimmensions[0] == [0,0]){
            
            wchan = abs(dimmensions[1][1] - dimmensions[1][0]);
            hchan = abs(dimmensions[2][1] - dimmensions[2][0]);
           
            translate([ending_0,dimmensions[1][0],dimmensions[2][0]])
            mirror([sign(length)-1,0,0])
            cube([abs(length)+ abs(ending_0)+abs(ending_1),wchan, hchan]);
            
            
        }
        else if (dimmensions[1] == [0,0]){
            
            wchan = abs(dimmensions[0][1] - dimmensions[0][0]);
            hchan = abs(dimmensions[2][1] - dimmensions[2][0]);
            
            translate([dimmensions[0][0],ending_0,dimmensions[2][0]])
            mirror([0,sign(length)-1,0])
            cube([wchan, abs(length)+abs(ending_0)+abs(ending_1), hchan]);
              
        }
        else if (dimmensions[2] == [0,0]){
            
            wchan = abs(dimmensions[0][1] - dimmensions[0][0]);
            hchan = abs(dimmensions[1][1] - dimmensions[1][0]);
            
            translate([dimmensions[0][0],dimmensions[1][0],ending_0])
            mirror([0,0,sign(length)-1])
            cube([wchan, hchan, abs(length)+abs(ending_0)+abs(ending_1)]);
            
        }        
    }
}

function xyz_idx(string, index) = (string[0] == "+") ? ((string[index+1] == "x")? 0:((string[index+1] == "y") ? 1:2)) : ((string[index] == "x")? 0:((string[index] == "y") ? 1:2));

module routing(p0 ,pf ,dimm = dimm, routing_color = "gray", endings = [[[0,0],[0,0],[0,0]],[[0,0],[0,0],[0,0]]],index = 0, sub_index = 0, def = [0,1,2]){
    
    
    if (pf[index][0][0] == "+"){

        if(pf[index][0][sub_index + 1] == "x"){
            
            length      =(pf[index][1][sub_index] == undef) ?  pf[index][1]:pf[index][1][sub_index];
            chan_dimm   = dimm[(pf[index][2] == undef) ? def[0]:((len(pf[index][2]) == undef) ? pf[index][2]:pf[index][2][sub_index])];
            
            if(len(pf[index][0])-1 == sub_index + 1){
                
                if (len(pf)-1 == index){
                    
                    channel(p0,length, chan_dimm, routing_color, [endings[0][0],endings[1][0]]);                 
                }
                else{
                    
                    ending_2 = dimm[(pf[index+1][2] == undef) ? def[xyz_idx(pf[index+1][0],0)]:((len(pf[index+1][2]) == undef) ? pf[index+1][2]:pf[index+1][2][0])][0];
                    
                    channel(p0,length, chan_dimm, routing_color, [endings[0][0],ending_2]);
                    routing(p0 + [length,0,0],pf, dimm, routing_color,[chan_dimm,endings[1]], index+1,0,def);      
                }
            }
            else{

                ending_2 = dimm[(pf[index][2] == undef) ? def[xyz_idx(pf[index][0],sub_index+1)]:pf[index][2][sub_index+1]][0];
                channel(p0,length, chan_dimm, routing_color, [endings[0][0],ending_2]);
                routing(p0 + [length,0,0],pf, dimm, routing_color,[chan_dimm,endings[1]], index, sub_index+1,def);                   
            }   
        }
        /////////////////////////////////////////////////////////////////////////////////////        
        else if(pf[index][0][sub_index + 1] == "y"){
            
            length      =(pf[index][1][sub_index] == undef) ?  pf[index][1]:pf[index][1][sub_index];
            chan_dimm   = dimm[(pf[index][2] == undef) ? def[1]:((len(pf[index][2]) == undef) ? pf[index][2]:pf[index][2][sub_index])];
            
            if(len(pf[index][0])-1 == sub_index + 1){
                
                if (len(pf)-1 == index){
                    
                    channel(p0,length, chan_dimm, routing_color, [endings[0][1],endings[1][1]]);                 
                }
                else{
                    
                    ending_2 = dimm[(pf[index+1][2] == undef) ? def[xyz_idx(pf[index+1][0],0)]:((len(pf[index+1][2]) == undef) ? pf[index+1][2]:pf[index+1][2][0])][1];
                    
                    channel(p0,length, chan_dimm, routing_color, [endings[0][1],ending_2]);
                    routing(p0 + [0,length,0],pf, dimm, routing_color,[chan_dimm,endings[1]], index+1,0,def);      
                }
            }
            else{
                
                ending_2 = dimm[(pf[index][2] == undef) ? def[xyz_idx(pf[index][0],sub_index+1)]:pf[index][2][sub_index+1]][1];
                channel(p0,length, chan_dimm, routing_color, [endings[0][1],ending_2]);
                routing(p0 + [0,length,0],pf, dimm, routing_color,[chan_dimm,endings[1]], index, sub_index+1,def);                   
            }    
        }
        //////////////////////////////////////////////////////////////////////////////////////
        else if(pf[index][0][sub_index + 1] == "z"){
            
            length      =(pf[index][1][sub_index] == undef) ?  pf[index][1]:pf[index][1][sub_index];
            chan_dimm   = dimm[(pf[index][2] == undef) ? def[2]:((len(pf[index][2]) == undef) ? pf[index][2]:pf[index][2][sub_index])];
            
            if(len(pf[index][0])-1 == sub_index + 1){
                
                if (len(pf)-1 == index){
                    
                    channel(p0,length, chan_dimm, routing_color, [endings[0][2],endings[1][2]]);                 
                }
                else{
                    
                    ending_2 = dimm[(pf[index+1][2] == undef) ? def[xyz_idx(pf[index+1][0],0)]:((len(pf[index+1][2]) == undef) ? pf[index+1][2]:pf[index+1][2][0])][2];
                    
                    channel(p0,length, chan_dimm, routing_color, [endings[0][2],ending_2]);
                    routing(p0 + [0,0,length],pf, dimm, routing_color,[chan_dimm,endings[1]], index+1,0,def);      
                }
            }
            else{
                
                ending_2 = dimm[(pf[index][2] == undef) ? def[xyz_idx(pf[index][0],sub_index+1)]:pf[index][2][sub_index+1]][2];
                channel(p0,length, chan_dimm, routing_color, [endings[0][2],ending_2]);
                routing(p0 + [0,0,length],pf, dimm, routing_color,[chan_dimm,endings[1]], index, sub_index+1,def);                   
            }             
            
        }
        
    }
    else{

        if(pf[index][0][sub_index] == "x"){
            
            length      =(pf[index][1][sub_index] == undef ?  pf[index][1]:pf[index][1][0]) - p0[0];
            chan_dimm   = dimm[(pf[index][2] == undef) ? def[0]:((len(pf[index][2]) == undef) ? pf[index][2]:pf[index][2][sub_index])];
            //echo(sub_index);
            if(len(pf[index][0]) == sub_index + 1){
                
                if (len(pf)-1 == index){
                    
                    channel(p0,length, chan_dimm, routing_color, [endings[0][0],endings[1][0]]);                 
                }
                else{
                    
                    ending_2 = dimm[(pf[index+1][2] == undef) ? def[xyz_idx(pf[index+1][0],0)]:((len(pf[index+1][2]) == undef) ? pf[index+1][2]:pf[index+1][2][0])][0];
                    
                    channel(p0,length, chan_dimm, routing_color, [endings[0][0],ending_2]);
                    routing(p0 + [length,0,0],pf, dimm, routing_color,[chan_dimm,endings[1]], index+1,0,def);      
                }
            }
            else{
                
                ending_2 = dimm[(pf[index][2] == undef) ? def[xyz_idx(pf[index][0],sub_index+1)]:pf[index][2][sub_index+1]][0];
                channel(p0,length, chan_dimm, routing_color, [endings[0][0],ending_2]);
                routing(p0 + [length,0,0],pf, dimm, routing_color,[chan_dimm,endings[1]], index, sub_index+1,def); 
            }   
        }
        /////////////////////////////////////////////////////////////////////////////////////        
        else if(pf[index][0][sub_index] == "y"){
            
            length      =(pf[index][1][sub_index] == undef ?  pf[index][1]:pf[index][1][1]) - p0[1];
            chan_dimm   = dimm[(pf[index][2] == undef) ? def[1]:((len(pf[index][2]) == undef) ? pf[index][2]:pf[index][2][sub_index])];
            
            if(len(pf[index][0]) == sub_index + 1){
                
                if (len(pf)-1 == index){
                    
                    channel(p0,length, chan_dimm, routing_color, [endings[0][1],endings[1][1]]);                 
                }
                else{
                    
                    ending_2 = dimm[(pf[index+1][2] == undef) ? def[xyz_idx(pf[index+1][0],0)]:((len(pf[index+1][2]) == undef) ? pf[index+1][2]:pf[index+1][2][0])][1];
                    
                    channel(p0,length, chan_dimm, routing_color, [endings[0][1],ending_2]);
                    routing(p0 + [0,length,0],pf, dimm, routing_color,[chan_dimm,endings[1]], index+1,0,def);      
                }
            }
            else{
                
                ending_2 = dimm[(pf[index][2] == undef) ? def[xyz_idx(pf[index][0],sub_index+1)]:pf[index][2][sub_index+1]][1];
                channel(p0,length, chan_dimm, routing_color, [endings[0][1],ending_2]);
                routing(p0 + [0,length,0],pf, dimm, routing_color,[chan_dimm,endings[1]], index, sub_index+1,def);                   
            }    
        }
        //////////////////////////////////////////////////////////////////////////////////////
        else if(pf[index][0][sub_index] == "z"){
            
            length      =(pf[index][1][sub_index] == undef ?  pf[index][1]:pf[index][1][2]) - p0[2];
            chan_dimm   = dimm[(pf[index][2] == undef) ? def[2]:((len(pf[index][2]) == undef) ? pf[index][2]:pf[index][2][sub_index])];
            
            if(len(pf[index][0]) == sub_index + 1){
                
                if (len(pf)-1 == index){
                    
                  
                    channel(p0,length, chan_dimm, routing_color, [endings[0][2],endings[1][2]]);                 
                }
                else{
                    
                    ending_2 = dimm[(pf[index+1][2] == undef) ? def[xyz_idx(pf[index+1][0],0)]:((len(pf[index+1][2]) == undef) ? pf[index+1][2]:pf[index+1][2][0])][2];
                    
                    channel(p0,length, chan_dimm, routing_color, [endings[0][2],ending_2]);
                    routing(p0 + [0,0,length],pf, dimm, routing_color,[chan_dimm,endings[1]], index+1,0,def);      
                }
            }
            else{
                
                ending_2 = dimm[(pf[index][2] == undef) ? def[xyz_idx(pf[index][0],sub_index+1)]:pf[index][2][sub_index+1]][2];
                channel(p0,length, chan_dimm, routing_color, [endings[0][2],ending_2]);
                routing(p0 + [0,0,length],pf, dimm, routing_color,[chan_dimm,endings[1]], index, sub_index+1,def);                   
            }             
            
        }
        
        
        
    }
    
}






  
    
    
    
    
    
    
    
    
    
    
    
    