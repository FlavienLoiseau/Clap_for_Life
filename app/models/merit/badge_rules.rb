# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # Find badge by badge_id, badge_id takes presidence over badge
      # grant_on 'users#create', badge_id: 7, badge: 'just-registered', to: :itself

      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', badge: 'commenter', level: 10 do |comment|
      #   comment.user.comments.count == 10
      # end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', badge: 'relevant-commenter',
      #   to: :user do |comment|
      #
      #   comment.votes.count == 5
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'registrations#update', badge: 'autobiographer',
      #   temporary: true, model_name: 'User' do |user|
      #
      #   user.name.length > 4
      # end
  
      grant_on 'users#update', badge_id: 2, to: :action_user

      grant_on 'participations#create', badge_id: 3, to: :action_user do |participation|
       participation.user.participations.count == 1
      end

      grant_on 'organisations#create', badge_id: 4, to: :action_user

      grant_on 'missions#create', badge_id: 5, to: :action_user

      grant_on 'participations#create', badge_id: 6 , to: :action_user do |participation|
        participation.user.participations.count >= 10
      end

      grant_on 'participations#create', badge_id: 7 , to: :action_user do |participation|
        participation.user.participations.count >= 50
      end

      grant_on 'participations#create', badge_id: 8 , to: :action_user do |participation|
        participation.user.participations.count >= 3
      end

      grant_on 'participations#create', badge_id: 9 , to: :action_user do |participation|
        total = []
        participation.user.participations.each do |p|
          total << p.mission.organisation_id if p.mission.organisation_id == participation.mission.organisation_id
        end
        total.count >=2
      end

      grant_on 'participations#create', badge_id: 10 , to: :action_user do |participation|
        participation.mission.tags.any? {|t| t.id == 26 || t.id == 27  || t.id == 28 }
      end

      grant_on 'participations#create', badge_id: 11 , to: :action_user do |participation|
        participation.mission.tags.any? {|t| t.id == 1 || t.id == 2  || t.id == 3 }
      end

      grant_on 'participations#create', badge_id: 12 , to: :action_user do |participation|
        participation.mission.tags.any? {|t| t.id == 4 || t.id == 5 }
      end


    end
  end
end
