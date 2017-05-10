module ApplicationHelper
    def my_start_hour_select(var)
        select_tag('start_hour',options_for_select([1,2,3,4,5,6,7,8,9,10,11,12]))
    end
    
    def my_start_minute_select(var)
        l = ["00","01","02","03","04","05","06","07","08","09"] + [*10..59].map{ |n| n.to_s}
        select_tag('start_minute',options_for_select(l))
    end
    
    def my_start_ampm_select(var)
        select_tag('start_ampm',options_for_select([["am",0],["pm",1]]))
    end
    
    def my_end_hour_select(var)
        select_tag('end_hour',options_for_select([1,2,3,4,5,6,7,8,9,10,11,12]))
    end
    
    def my_end_minute_select(var)
        l = ["00","01","02","03","04","05","06","07","08","09"] + [*10..59].map{ |n| n.to_s}
        select_tag('end_minute',options_for_select(l))
    end
    
    def my_end_ampm_select(var)
        select_tag('end_ampm',options_for_select([["am",0],["pm",1]]))
    end
end
