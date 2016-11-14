module AtRiskHelper
    
  def convert_time(datetime)
    datetime.in_time_zone("Pacific Time (US & Canada)").strftime("%b-%d-%Y, %a, %I:%M %P %Z")
  end
  
end

