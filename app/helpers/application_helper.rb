module ApplicationHelper

    def my_start_hour_select(var)
        select_tag('start_hour',options_for_select([1,2,3,4,5,6,7,8,9,10,11,12]))
    end
    
    def my_start_minute_select(var)
        select_tag('start_minute',options_for_select(["00","05","10","15","20","25","30","35","40","45","50","55"]))
    end
    
    def my_start_ampm_select(var)
        select_tag('start_ampm',options_for_select([["am",0],["pm",1]]))
    end
    
    def my_end_hour_select(var)
        select_tag('end_hour',options_for_select([1,2,3,4,5,6,7,8,9,10,11,12]))
    end
    
    def my_end_minute_select(var)
        select_tag('start_minute',options_for_select(["00","05","10","15","20","25","30","35","40","45","50","55"]))
    end
    
    def my_end_ampm_select(var)
        select_tag('end_ampm',options_for_select([["am",0],["pm",1]]))
    end
end
