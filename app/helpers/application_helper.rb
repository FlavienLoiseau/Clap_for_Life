module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-warning'
    when 'notice'
      'alert-info'
    else
      flash_type.to_s
    end
  end

  def search_result(object, search, location)
      
      if search.present? && location.present? 
       
        if object.any? {|m| m.address.city == location.strip}
          "#{object.count} résultats pour: "
        else
          "Aucun résultat pour: "
        end
      elsif search.present? && location.blank?
        "#{object.count} résultats pour: "
      elsif search.blank? && location.present?
        if object.any? {|m| m.address.city == location.strip}
          "#{object.count} résultats pour: "
        else
          "Aucun résultat pour: "
        end
      else
        "#{object.count} résultats"
      end
  end

end
