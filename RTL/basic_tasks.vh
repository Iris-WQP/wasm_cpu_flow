`include "tasks_driver_MVM.vh"

task ReMap_Feature_Data(input bit [`MAX_DW-1:0] In_Feature [`Height][`Width_in],
                   output bit [`MAX_DW*`Tin-1:0] In_Feature_Expand [`Height][`slice_of_Win]);
begin
    
    for(int i=0;i<`Height;i++)
        for(int j=0;j<`slice_of_Win;j++)
            for(int k=0;k<`Tin;k++)
            begin
                if ((j*`Tin+k)<`Width_in)
                    In_Feature_Expand[i][j][k*`MAX_DW+:`MAX_DW]=In_Feature[i][j*`Tin+k];
                else
                    In_Feature_Expand[i][j][k*`MAX_DW+:`MAX_DW]=0;
                    
//                $display("In_Feature_Expand[%0d][%0d]=%0d",i,j,In_Feature_Expand[i][j][k*`MAX_DW+:`MAX_DW]);
            end        
end
endtask

task ReMap_Weight_Data_Tin(input bit  [`MAX_DW-1:0] Weight     [`Width_in][`Width_out],
                  output bit [`MAX_DW*`Tin-1:0] Weight_Expand [`slice_of_Win][`Width_out]);
begin
    
    for(int j=0;j<`Width_out;j++)    
        for(int i=0;i<`slice_of_Win;i++)
        
            for(int k=0;k<`Tin;k++)
            begin
                if ((i*`Tin+k)<`Width_in)
                    Weight_Expand[i][j][k*`MAX_DW+:`MAX_DW]=Weight[i*`Tin+k][j];
                else
                    Weight_Expand[i][j][k*`MAX_DW+:`MAX_DW]=0;
                
//                $display("Weight_Expand[%0d][%0d]=%0d",i,j,Weight_Expand[i][j][k*`MAX_DW+:`MAX_DW]);
            end        
end
endtask

task ReMap_Weight_Data_TinTout(input bit  [`MAX_DW-1:0] Weight     [`Width_in][`Width_out],
                  output bit [`MAX_DW*`Tin*`Tout-1:0] Weight_Expand_TinTout [`slice_of_Win][`slice_of_Wout]);
begin
    
    bit [`MAX_DW*`Tin-1:0] Weight_Expand_Tin [`slice_of_Win][`Width_out];
    
    for(int j=0;j<`Width_out;j++)    
        for(int i=0;i<`slice_of_Win;i++)
        
            for(int k=0;k<`Tin;k++)
            begin
                if ((i*`Tin+k)<`Width_in)
                    Weight_Expand_Tin[i][j][k*`MAX_DW+:`MAX_DW]=Weight[i*`Tin+k][j];
                else
                    Weight_Expand_Tin[i][j][k*`MAX_DW+:`MAX_DW]=0;
                
//                $display("Weight_Expand_Tin[%0d][%0d]=%0d",i,j,Weight_Expand_Tin[i][j][k*`MAX_DW+:`MAX_DW]);
            end   
        
            
    for(int j=0;j<`slice_of_Wout;j++)             
        for(int i=0;i<`slice_of_Win;i++)
            for(int out=0;out<`Tout;out++)
            begin
                Weight_Expand_TinTout[i][j][out*`MAX_DW*`Tin+:`MAX_DW*`Tin]=Weight_Expand_Tin[i][j*`Tout+out];
//                $display("Weight_Expand_TinTout[%0d][%0d][%0d]=%0h",i,j,out, Weight_Expand_TinTout[i][j][out*`MAX_DW*`Tin+:`MAX_DW*`Tin]);
            end
    
end
endtask


task Run_MVM_Soft(input bit [`MAX_DW-1:0] In_Feature [`Height][`Width_in],
             input bit [`MAX_DW-1:0] Weight     [`Width_in][`Width_out],
             input bit [`log2_S-1:0]shift, 
             output bit [`MAX_DW-1:0]Out_Feature[`Height][`Width_out]);
begin

    
    for(int i=0;i<`Height;i++)
        for(int j=0;j<`Width_out;j++)
        begin
            bit signed[31:0] tp;
            bit signed[`MAX_DW2+`log2_Width_max-1:0] tp2;
            bit signed[`MAX_DW-1:0] tp_sat;
            
            tp = 0;
            
            for(int k=0;k<`Width_in;k++)
            begin
                tp = tp + $signed(In_Feature[i][k])*$signed(Weight[k][j]);
            end


            if(!shift[`log2_S-1])
            begin
                tp2=$signed(tp)>>>shift[`log2_S-2:0];
                if((shift!=0)&&(tp2!={1'b0, {(`MAX_DW2+`log2_Width_max-1){1'b1}} }))
                    tp2=tp2+tp[shift-1];

                if( (tp2[(`MAX_DW2+`log2_Width_max-1)]) & (!(&tp2[(`MAX_DW2+`log2_Width_max-2):`MAX_DW-1])) ) //tp2 is negetive and tp2[32-2:15] is not all 1, means tp2 < 16'h8000(-2^15)
                    tp_sat={1'b1,{(`MAX_DW-1){1'b0}}};//8'h80; //sat to -2^7
                else
                begin
                    if( (!tp2[`MAX_DW2+`log2_Width_max-1]) & (|tp2[(`MAX_DW2+`log2_Width_max-2):(`MAX_DW-1)]) ) //tp2 is positive and tp2>`MAX_DW2'h7fff
                        tp_sat={1'b0,{(`MAX_DW-1){1'b1}}};//`DW'h7fff;
                    else
                        tp_sat=tp2[(`MAX_DW-1):0];
                end
            end
            else
            begin
                tp2=$signed(tp)<<shift[`log2_S-2:0];
                tp_sat=tp2[(`MAX_DW-1):0];
            end

            Out_Feature[i][j]=$signed(tp_sat);

        end
end
endtask    



task Run_MVM_Soft_Tin(  input bit [`MAX_DW*`Tin-1:0] In_Feature_Expand [`Height][`slice_of_Win],
                        input bit [`MAX_DW*`Tin-1:0] Weight_Expand [`slice_of_Win][`Width_out],
                        input bit [`log2_S-1:0]shift, 
                        output bit [`MAX_DW-1:0]Out_Feature[`Height][`Width_out]);
begin

    for(int i=0;i<`Height;i++)
        for(int j=0;j<`Width_out;j++)
        begin
            bit signed[31:0] tp;
            bit signed[`MAX_DW2+`log2_Width_max-1:0] tp2;
            bit signed[`MAX_DW-1:0] tp_sat;
            bit signed[31:0] tp_Tin;
            bit signed[`MAX_DW-1:0] tp_dat;
            bit signed[`MAX_DW-1:0] tp_wt;
            tp = 0;
            
            for(int k=0;k<`slice_of_Win;k++)
            begin
                tp_Tin=0;
                
                for(int m=0;m<`Tin;m++)
                begin
                    tp_dat=In_Feature_Expand[i][k][m*`MAX_DW+:`MAX_DW];
                    tp_wt=Weight_Expand[k][j][m*`MAX_DW+:`MAX_DW];
                    
                    tp_Tin = tp_Tin + $signed(tp_dat)*$signed(tp_wt);
//                    $display("tp_dat=%0d, tp_wt=%0d",$signed(tp_dat), $signed(tp_wt));
                end
                
                tp = tp + tp_Tin;
            end


            if(!shift[`log2_S-1])
            begin
                tp2=$signed(tp)>>>shift[`log2_S-2:0];
                if((shift!=0)&&(tp2!={1'b0, {(`MAX_DW2+`log2_Width_max-1){1'b1}} }))
                    tp2=tp2+tp[shift-1];

                if( (tp2[(`MAX_DW2+`log2_Width_max-1)]) & (!(&tp2[(`MAX_DW2+`log2_Width_max-2):`MAX_DW-1])) ) //tp2 is negetive and tp2[32-2:15] is not all 1, means tp2 < 16'h8000(-2^15)
                    tp_sat={1'b1,{(`MAX_DW-1){1'b0}}};//8'h80; //sat to -2^7
                else
                begin
                    if( (!tp2[`MAX_DW2+`log2_Width_max-1]) & (|tp2[(`MAX_DW2+`log2_Width_max-2):(`MAX_DW-1)]) ) //tp2 is positive and tp2>`MAX_DW2'h7fff
                        tp_sat={1'b0,{(`MAX_DW-1){1'b1}}};//`DW'h7fff;
                    else
                        tp_sat=tp2[(`MAX_DW-1):0];
                end
            end
            else
            begin
                tp2=$signed(tp)<<shift[`log2_S-2:0];
                tp_sat=tp2[(`MAX_DW-1):0];
            end

            Out_Feature[i][j]=$signed(tp_sat);

        end
end
endtask    


task Run_MVM_Soft_TinTout(  input bit [`MAX_DW*`Tin-1:0] In_Feature_Expand [`Height][`slice_of_Win],
                            input bit [`MAX_DW*`Tin*`Tout-1:0]  Weight_Expand_TinTout [`slice_of_Win][`slice_of_Wout],
                            input bit [`log2_S-1:0]shift, 
                            output bit [`MAX_DW*`Tout-1:0]Out_Feature_Expand[`Height][`slice_of_Wout]);
begin

    for(int i=0;i<`Height;i++)
        for(int j=0;j<`slice_of_Wout;j++)
        begin
            bit signed[31:0] tp_acc_all_CHin[`Tout];
            bit signed[31:0] tp_Tin[`Tout];
            
            for(int out=0;out<`Tout;out++) tp_acc_all_CHin[out] = 0;
            
            for(int k=0;k<`slice_of_Win;k++)
            begin
                bit signed[`MAX_DW*`Tin*`Tout-1:0] tp_wt_TinTout;
                bit signed[`MAX_DW*`Tin-1:0] tp_wt_Tin;
                bit signed[`MAX_DW-1:0] wt;
                bit signed[`MAX_DW-1:0] feature_in;
                tp_wt_TinTout=Weight_Expand_TinTout[k][j];
                
                for(int out=0;out<`Tout;out++)
                begin

                    tp_wt_Tin=tp_wt_TinTout[out*`MAX_DW*`Tin+:`MAX_DW*`Tin];

                    tp_Tin[out]=0;
                    for(int in=0;in<`Tin;in++)
                    begin
                        wt=tp_wt_Tin[in*`MAX_DW+:`MAX_DW];
                        feature_in=In_Feature_Expand[i][k][in*`MAX_DW+:`MAX_DW];
                        tp_Tin[out] = tp_Tin[out] + $signed(feature_in)*$signed(wt); //$display("tp_feature_in=%0d, tp_wt=%0d",$signed(feature_in), $signed(wt));
                    end
                    
                    tp_acc_all_CHin[out] = tp_acc_all_CHin[out] + tp_Tin[out];
                end
            end
           
            for(int out=0;out<`Tout;out++)        
            begin
                bit signed[`MAX_DW2+`log2_Width_max-1:0] tp_shift;
                bit signed[`MAX_DW-1:0] tp_sat;  
               
                if(!shift[`log2_S-1])
                begin
                   tp_shift=$signed(tp_acc_all_CHin[out])>>>shift[`log2_S-2:0];
                   if((shift!=0)&&(tp_shift!={1'b0, {(`MAX_DW2+`log2_Width_max-1){1'b1}} }))
                       tp_shift=tp_shift+tp_acc_all_CHin[out][shift-1];
                
                   if( (tp_shift[(`MAX_DW2+`log2_Width_max-1)]) & (!(&tp_shift[(`MAX_DW2+`log2_Width_max-2):`MAX_DW-1])) ) //tp_shift is negetive and tp_shift[32-2:15] is not all 1, means tp_shift < 16'h8000(-2^15)
                       tp_sat={1'b1,{(`MAX_DW-1){1'b0}}};//8'h80; //sat to -2^7
                   else
                   begin
                       if( (!tp_shift[`MAX_DW2+`log2_Width_max-1]) & (|tp_shift[(`MAX_DW2+`log2_Width_max-2):(`MAX_DW-1)]) ) //tp_shift is positive and tp_shift>`MAX_DW2'h7fff
                           tp_sat={1'b0,{(`MAX_DW-1){1'b1}}};//`DW'h7fff;
                       else
                           tp_sat=tp_shift[(`MAX_DW-1):0];
                   end
                end
                else
                begin
                   tp_shift=$signed(tp_acc_all_CHin[out])<<shift[`log2_S-2:0];
                   tp_sat=tp_shift[(`MAX_DW-1):0];
                end
           
               Out_Feature_Expand[i][j][out*`MAX_DW+:`MAX_DW]=$signed(tp_sat);
           end
    end

end
endtask    
