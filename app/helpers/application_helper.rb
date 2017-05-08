module ApplicationHelper
    def my_hour_select
        select_tag('hour',options_for_select([1,2,3,4,5,6,7,8,9,10,11,12]))
    end
    
    def my_minute_select
        l = ["00","01","02","03","04","05","06","07","08","09"] + [*10..59].map{ |n| n.to_s}
        select_tag('minute',options_for_select(l))
    end
    
    def my_ampm_select
        select_tag('ampm',options_for_select([["am",0],["pm",1]]))
    end
end
