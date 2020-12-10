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

  def search_result_organisation(organisation, search, location) 
      if search.present? && location.present? 
        if organisation.any? {|m| m.address.city == location.strip.capitalize}
          "#{organisation.count} résultats pour: "
        else
          "Aucun résultat pour: "
        end
      elsif search.present? && location.blank?
        "#{organisation.count} résultats pour: "
      elsif search.blank? && location.present?
        if organisation.any? {|m| m.address.city == location.strip.capitalize}
          "#{organisation.count} résultats pour: "
        else
          "Aucun résultat pour: "
        end
      else
        "#{organisation.count} résultats"
      end
  end

  def search_result_mission(mission, search, location)   
    if search.present? && location.present? 
      if mission.any? {|m| m.address.city == location.strip.capitalize}
        "#{(mission.select {|m| m if m.start_date > DateTime.now}).count  } résultats pour: "
      else
        "Aucun résultat pour: "
      end
    elsif search.present? && location.blank?
      "#{(mission.select {|m| m if m.start_date > DateTime.now}).count} résultats pour: "
    elsif search.blank? && location.present?
      if mission.any? {|m| m.address.city == location.strip.capitalize}
        "#{(mission.select {|m| m if m.start_date > DateTime.now}).count} résultats pour: "
      else
        "Aucun résultat pour: "
      end
    else
      "#{(mission.select {|m| m if m.start_date > DateTime.now}).count} résultats"
    end
end

end
