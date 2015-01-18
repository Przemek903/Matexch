module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Matexch"      
    end
  end
end
